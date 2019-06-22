/* ---------------------------------------------------------------- */
/** 
\file fmul.c
\brief Code for the multiplication operation.
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** 
\brief FP \b multiplication operation: returns \f$ x \times y \f$.

\param x is the multiplicand (32-bit FPN)
\param y is the multiplier (32-bit FPN)

\addindex FPN

*/
// NEW VERSION  WITHOUT DENORMAL
inline
float32 __float32_flip_mul_float32_float32(float32 x, float32 y)
{
  float32 _x, _y;
  sbits32 _xBExp, _yBExp, _rBExp;           // Computing with biased exponents.
  sbits32 _xBExp_val_spl, _yBExp_val_spl;   // Useful when exponents represent special values.
  bits32 _xMant, _yMant, _rMant;
  bits32 _rSign;

  _x = x;
  _y = y;
  _xMant = extractFloat32Frac( _x );
  _xBExp = ( sbits32 ) extractFloat32Exp( _x );
  _yMant = extractFloat32Frac( _y );
  _yBExp = ( sbits32 ) extractFloat32Exp( _y );

  _xMant |= 1 << _FLIP_MANT_SIZE;         // Append the implicit bit (1 << 23 = 0x00800000).
  _yMant |= 1 << _FLIP_MANT_SIZE;         // Idem.
  _rBExp = _xBExp + _yBExp - _FLIP_BIAS;
  _rSign = ( _x ^ _y ) & 0x80000000;        // Compute the sign bit of the result.

  _rMant = _flip_mul_mant_with_sticky( _xMant, _yMant );

  // Only exponent values 0 and 255 give 0xFE after performing the following operation.

  _xBExp_val_spl = ( _xBExp - 1 ) & 0xFE;
  _yBExp_val_spl = ( _yBExp - 1 ) & 0xFE;

  // Special treatment for special values.

  if( _FLIP_MAX( _xBExp_val_spl, _yBExp_val_spl ) == 0xFE )
    {
      if( _xBExp == 0xFF )
	{
	  if( ( _xMant << 9 ) || ( _yBExp == 0 ) )
	    {
	      return _flip_declare_nan();
	    }
	  else
	    {
	      if( ( y << 1 ) <= 0xFF000000 )
		{
		  return _flip_declare_infinity( _rSign );
		}
	      else
		return _flip_declare_nan();
	    }
	}

      if( _xBExp == 0 )
	{
	  if( _yBExp == 0xFF )
	    return _flip_declare_nan();
	  else
	    return _flip_declare_zero( _rSign );
	}

      // Result is same as second operand which is a special value with the new sign appended.
      // Mantissa should be changed to zero if exponent is zero (normalized version).

      ( bits32 ) _rMant = ( _yBExp << _FLIP_MANT_SIZE ) | ( _yMant & ( ( 0 - _yBExp ) >> 31 ) );
  
      return _rSign | _rMant;
    }

  // 32-bit product stored as signed integer can be of two forms.
  // Final product (after normalization) is of 26-bits including least 2-bits for rounding.

  if( ( sbits32 ) _rMant < 0 )  // 1X.XX...X|XX
    {
      _rMant = ( ( _rMant >> 6 ) & 0x3FFFFFF ) | ( ( _rMant & 0x3F ) > 0 );
      _rBExp = _rBExp + 1;      // Exponent is updated after normalization.
    }
  else                          // 0X.XX...X|XX
    {
      _rMant = ( _rMant >> 5 ) | ( ( _rMant & 0x3F ) > 0 );

      // Update of an exponent may be required after rounding but we detect it before.

      _rBExp = _rBExp + _flip_detect_exp_update( _rMant, _rSign, 26 );
    }

  _rMant = _flip_round( _rMant, _rSign );

  if( _rBExp <= 0 )  // Check for underflow.
    {
      return _rSign | _flip_underflow( _rSign );
    }

  // Check for overflow and pack the two parts (mantissa and exponent) into a single 32-bit integer.

  _rMant = _flip_overflow_join( _rMant, _rBExp, _rSign );

  // Append the sign bit to an already joined part.

  return _rSign | _rMant;
}

