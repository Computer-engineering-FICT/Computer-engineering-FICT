/* ---------------------------------------------------------------- */
/** \file fsqrt.c
    \brief code for the square root operation
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** \brief returns the square root of \a x
 
    \a x should be a 32-bit floating-point number.
    \param x is the operand (utile de dire ca ?)

\addindex FPN
*/
// NEW VERSION  WITHOUT DENORMAL
inline
float32 __float32_flip_sqrt_float32( float32 x )
{
  float32 _x;
  sbits32 _xMant;
  sbits32 _xBExp, _rBExp;           // Computing with biased exponents.
  bits32 _rMant, _rSign;
  bits32 _iter;
  bits32 _cst_frac_part;

  _x = x;

  // Square root of a negative number is NaN so change the operand into 
  // a NaN if the sign bit is 1 and the operand is not +0 or -0.

  _x = _x | ( ( ( ( sbits32 ) ( _x ) >> 31 ) ) & ( ( 0 - _x ) >> 31 ) );

  _xMant = extractFloat32Frac( _x );
  _xBExp = ( sbits32 ) extractFloat32Exp( _x );

  _rSign = _x & 0x80000000;                      // Compute the sign bit of the result.
  _xMant = _xMant | ( 1 << _FLIP_MANT_SIZE );   // Append the implicit bit (1 << 23 = 0x00800000).

  // Mantissa is doubled to make an odd exponent (real) even.

  _xMant = _xMant << ( ~_xBExp & 0x1 );
  _rBExp = ( ( _xBExp + _FLIP_BIAS ) >> 1 ); 

  // Initialization.

  _rMant = 1 << ( _FLIP_MANT_SIZE + 1 );  // Square root bits (1.X...X).
  _cst_frac_part = 0x800000;
  _xMant = _xMant << 1;       // Shifting to accomodate the guard bit .
  _xMant = _xMant - _rMant;

  // Nonrestoring square root using redundant quotient bit (-1, +1) and 
  // gives 24-bits including a guard bit for rounding.

  for( _iter = 2; _iter <= 25; _iter++ )
    {
      _xMant = _xMant << 1;

      if( _xMant >= 0 )
	{
	  _xMant = _xMant - ( ( _rMant << 1 ) | _cst_frac_part );
	  _rMant = _rMant | _cst_frac_part;
	}
      else
	{
	  _xMant = _xMant + ( ( _rMant << 1 ) - _cst_frac_part );  // Restoration.
	  _rMant = _rMant - _cst_frac_part;
	}
      _cst_frac_part = _cst_frac_part >> 1;
    }

  if( _xMant < 0 )  // Make the final residue positive.
    {
      _rMant = _rMant - 1;
      _xMant = _xMant + ( ( _rMant << 1 ) - 1 );
    }

  _rMant = ( _rMant << 1 ) | ( _rMant > 0 );  // Append the sticky bit.
  _rMant = _flip_round( _rMant, _rSign );

  // Special treatment for special value.

  if( ( ( ( _xBExp - 1 ) & 0xFE ) == 0xFE ) )
    return _x;  // The operand is same as result if it is a special value (negative numbers turned into NaN).

  // Pack the three parts into a single 32-bit integer.

  return _rSign | ( _rBExp << _FLIP_MANT_SIZE ) | ( _rMant & 0x7FFFFF );

}
