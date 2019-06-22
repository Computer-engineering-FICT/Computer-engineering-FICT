/* ---------------------------------------------------------------- */
/** 
\file fadd.c
\brief Code for the addition operation.
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** 
\brief FP \b addition operation: returns \f$ x + y \f$.

\param x is the augend (32-bit FPN)
\param y is the addend (32-bit FPN)
\addindex FPN

*/
// NEW VERSION  WITHOUT DENORMAL

inline  
float32 __float32_flip_add_float32_float32(float32 x, float32 y)
{ 
  float32 _x, _y;
  sbits32 _xBExp, _yBExp, _rBExp;           // Computing with biased exponents.
  sbits32 _xBExp_special, _yBExp_special;   // Useful when exponents represent special values.
  bits32 _xMant, _yMant, _rMant;
  sbits32 _xsMant, _ysMant, _tsMant, _rsMant;
  bits32 _xSign, _ySign, _rSign, _lzc;
  sbits32 _expDiff, _preShift;

  _x = x;
  _y = y;
  _xMant = extractFloat32Frac( _x );
  _xBExp = extractFloat32Exp( _x );
  _xSign = extractFloat32Sign( _x );
  _yMant = extractFloat32Frac( _y );
  _yBExp = extractFloat32Exp( _y );
  _ySign = extractFloat32Sign( _y );
  _expDiff = _xBExp - _yBExp;

  // Only exponent values 0 and 255 give 0xFE after performing the following operation.

  _xBExp_special = ( _xBExp - 1 ) & 0xFE;
  _yBExp_special = ( _yBExp - 1 ) & 0xFE;

  // Implicit bit is appended and final mantissa is shifted to accomodate guard, round and sticky bits.

  _xsMant = (sbits32) ( ( _xMant | ( 1 << _FLIP_MANT_SIZE ) ) << 3 );
  _ysMant = (sbits32) ( ( _yMant | ( 1 << _FLIP_MANT_SIZE ) ) << 3 );

  // Mantissas are changed to signed mantissas using the signs of their respective operands.

  _xsMant = ( ( ~_xsMant + 1 ) & ( 0 - _xSign ) ) | ( _xsMant & ~( 0 - _xSign ) );
  _ysMant = ( ( ~_ysMant + 1 ) & ( 0 - _ySign ) ) | ( _ysMant & ~( 0 - _ySign ) );

  // Mantissas are swapped depending on the sign of the exponent difference.

  _tsMant = _xsMant;
  _xsMant = ( _xsMant & ~( _expDiff >> 31 ) ) | ( _ysMant & ( _expDiff >> 31 ) );
  _ysMant = ( _ysMant & ~( _expDiff >> 31 ) ) | ( _tsMant & ( _expDiff >> 31 ) );

  _expDiff = abs( _expDiff );

  // Shift >26 results in all the bits equal to 0 and the sticky equal to 1.

  _preShift = _FLIP_MIN( _expDiff, 26 );

  _ysMant = ( _ysMant >> _preShift ) | ( ( _ysMant &  ~( ~0 << _preShift ) ) != 0 );

  _rsMant = _xsMant + _ysMant;
  _rSign = ( bits32 ) ( _rsMant & 0x80000000 );

  _rMant = ( bits32 ) abs( _rsMant ); 

  // Sum can be of two forms, 1X.XX...X or 0.00...1X.

  _lzc = ( bits32 ) countLeadingZeros32( _rMant ) - 1;
  _rMant = _rMant << _lzc;                          // Normalize the final mantissa.
  _rBExp = _FLIP_MAX( _xBExp, _yBExp ) + 4 - _lzc;  // Update the exponent.

  _rMant = ( _rMant >> 5 ) | ( ( _rMant & 0x3F ) > 0 );

  // Update of an exponent may be required after rounding but we detect it before.

  _rBExp = _rBExp + _flip_detect_exp_update( _rMant, _rSign, 26 );

  // Special treatment for special values.

  if( _FLIP_MAX( _xBExp_special, _yBExp_special ) == 0xFE )
    {
      if( _expDiff > 0 )
	{
	  if( ( _xBExp == 0xFF ) || ( _yBExp == 0 ) )
	    return _x;
	}

      else
	if( _expDiff < 0 )
	  {
	    if( ( _yBExp == 0xFF ) || ( _xBExp == 0 ) )
	      return _y;
	  }
	else
	  {
	    if( _xBExp == 0xFF )
	      {
		if( _xMant | _yMant )
		  return _flip_declare_nan();
		if( _xSign == _ySign) 
		  return _x;
		return _flip_declare_nan();
	      }

	    if( ( _xBExp | _yBExp ) == 0 )
	      {
		if (flip_rnd_mode == FLIP_RD)
		  return _x | _y;
		else
		  return _x & _y;
	      }

	  }
    }

  _rMant = _flip_round( _rMant, _rSign );
  
  if( _rMant == 0 ) 
    {
      if (flip_rnd_mode == FLIP_RD)
	return -0;
      else
	return 0;
    }
  
  if( _rBExp <= 0 )  // Underflow check.
    {
      return _rSign | _flip_underflow( _rSign );
    }

  // Overflow check and pack the two parts (mantissa and exponent) into a single 32-bit integer.

  _rMant = _flip_overflow_join( _rMant, _rBExp, _rSign );

  // Append the sign bit to an already joined part.

  return _rSign | _rMant;
    
}
