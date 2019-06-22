/* ---------------------------------------------------------------- */
/** \file fdiv.c
    \brief code for the division operation
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** \brief returns the quotient \a x / \a y
 
    \a x and \a y should be 32-bit floating-point numbers.
    \param x is the dividend
    \param y is the divisor

\addindex FPN

*/
// NEW VERSION  WITHOUT DENORMAL
inline
float32 __float32_flip_div_float32_float32(float32 x, float32 y)
{
  float32 _x, _y;
  sbits32 _xMant, _yMant;
  sbits32 _xBExp, _yBExp, _rBExp;           // Computing with biased exponents.
  bits32 _rMant, _rSign;
  sbits32 _xBExp_special, _yBExp_special;   // Useful when exponents represent special values.
  bits32 _iter, _shift;
  
  _x = x;
  _y = y;
  _xMant = extractFloat32Frac( _x );
  _xBExp = ( sbits32 ) extractFloat32Exp( _x );
  _yMant = extractFloat32Frac( _y );
  _yBExp = ( sbits32 ) extractFloat32Exp( _y );

  _xMant |= 1 << _FLIP_MANT_SIZE;         // Append the implicit bit (1 << 23 = 0x00800000).
  _yMant |= 1 << _FLIP_MANT_SIZE;         // Idem.
  _rBExp = _xBExp - _yBExp + 0x7F;
  _rSign = ( _x ^ _y ) & 0x80000000;        // Compute the sign bit of the result.

  // Only exponent values 0 and 255 give 0xFE after performing the following operation.

  _xBExp_special = ( _xBExp - 1 ) & 0xFE;
  _yBExp_special = ( _yBExp - 1 ) & 0xFE;

  // Initialization step.

  // Quotient can be of two forms, 1.XX...X or 0.1X...X.

  _shift = _xMant < _yMant;  // If zero, an extra bit of quotient must be calculated.
  _rMant = 0;
  _yMant = _yMant << 1;      // Prescale the divisor so _yMant > _xMant.

  // Nonrestoring division using redundant quotient bit (-1, +1) and 
  // gives (25 + _shift) bits of quotient including a guard bit for rounding.

  for( _iter = 1; _iter <= 25 + _shift; _iter++ )
    {
      _xMant = _xMant << 1;
      if( _xMant >= 0 )
	{
	  _rMant = ( _rMant << 1 ) + 1;
	  _xMant = _xMant - _yMant;
	}
      else
	{
	  _rMant = ( _rMant << 1 ) - 1;
	  _xMant = _xMant + _yMant;
	}
    }
    
  if( _xMant < 0 )  // Make the remainder positive.
    {
      _xMant = _xMant + _yMant;
      _rMant = _rMant - 1;
    }

  _rBExp = _rBExp - _shift; 
  _rMant = ( _rMant << 1 ) | ( _xMant > 0 );  // Append the sticky bit.
  
  _rMant = _flip_round( _rMant, _rSign );

  // Special treatment for special values.

  if( _FLIP_MAX( _xBExp_special, _yBExp_special ) == 0xFE )
    {
      if( _xBExp == 0xFF )
	{
	  if( ( _xMant ) || ( _yBExp == 0xFF ) )
	    {
	      return _flip_declare_nan();
	    }
	  return _flip_declare_infinity( _rSign );
	}
      if( _yBExp == 0xFF )
	{
	  if( _yMant )
	    {
	      return _flip_declare_nan();
	    }
	  return _flip_declare_zero( _rSign );
	}
      if( _xBExp == 0 )
	{
	  if( _yBExp == 0 )
	    return _flip_declare_nan();
	  else
	    return _flip_declare_zero( _rSign );
	}
      if( _yBExp == 0 )
	{
	  return _flip_declare_infinity( _rSign );
	}
    }

  if( _rBExp <= 0 )  // Underflow check.
    {
      return _rSign | _flip_underflow( _rSign ) ;
    }

  // Overflow check and pack the two parts (mantissa and exponent) into a single 32-bit integer.

  _rMant = _flip_overflow_join( _rMant, _rBExp, _rSign );

  // Append the sign bit to an already joined part.

  return _rSign | _rMant;
}
