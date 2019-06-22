/* ---------------------------------------------------------------- */
/** 
\file sqr.c
\brief Code to compute the square.
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** 
\brief FP \b squaring operation: returns \f$ x \times x \f$.

\param x is a 32-bit floating-point number
\addindex FPN

*/

/*---------------------------------------------------------------------------
  This implementation of computing the square can better be explained as
  perfoming the multiplication implemented in "fmul.c" with equals operands.
  The multiplication implementation is slightly modified while doing
  trivial computations and verifying special values.
  Moreover, implementation is done for two different processor cores, ST220
  and ST231. Infact, apart from the way mantissas are multiplied other
  computations are almost same.
  The fully IEEE implementation is not supported, that is no "subnormals" 
  and rounding mode is fixed to "round-to-nearest-even". 
----------------------------------------------------------------------------*/

inline
float32 __float32_flip_sqr_float32(float32 x)
{
  float32 _x;
  sbits32 _xBExp, _rBExp;
  bits32 _xMant, _rMant, _rnd;

  _x = x;
  _xMant = extractFloat32Frac( _x );             // Extract the 23-bit mantissa.
  _xBExp = ( sbits32 ) extractFloat32Exp( _x );  // Extract the biased exponent.

/*---------------------------------------------------------
  Implicit bit is added, if exponent = 0 the operand is 0.
---------------------------------------------------------*/

  _xMant |= 1 << _FLIP_MANT_SIZE;
  _rBExp = ( _xBExp << 1 ) - _FLIP_BIAS;  // Compute the exponent of the result.

/*---------------------------------------------------------------
  Early exit in case of trivial computation (operand is zero).
---------------------------------------------------------------*/

  if( !_xBExp )
    {
      return 0;
    }

/*----------------------------------------------------------------------
  Computes the most significant 32 bits of the 48-bit (24 * 24) product
  with the sticky bit computed from the truncated part of 16 bits.
-----------------------------------------------------------------------*/

  _rMant = _flip_mul_mant_with_sticky( _xMant, _xMant );

/*----------------------------------------------------------------------------------
  Product of 2 mantissas can be of two forms, 1X.XX...X or 0X.XX...X. The first
  form needs normalization and so exponent is updated.
  Mantissa is shifted right to have 24 bits with additional 2 bits for rounding.
----------------------------------------------------------------------------------*/

  if( ( sbits32 ) _rMant < 0 )
    {
      _rMant = ( ( _rMant >> 6 ) & 0x3FFFFFF ) | ( ( _rMant & 0x3F ) > 0 );
      _rBExp = _rBExp + 1;
    }
  else
    {
      _rMant = ( _rMant >> 5 ) | ( ( _rMant & 0x3F ) > 0 );
    }

/*----------------------------
  26-bit mantissa is rounded.
----------------------------*/

  _rnd = _rMant & 0x3;
  _rMant = ( ( ( _rMant + 0x2 ) >> 2 ) & ( ( ~( _rnd & 0x2 ) >> 1 ) | _rnd ) );

/*----------------------------------------
  Special values (NaN, Inf) verification.
----------------------------------------*/

  if( _xBExp == 0xFF )
    return 0x7FFFFFFF & _x;

/*--------------------------------------------------------------------------
  For quasi IEEE mode when the final exponent <= 0, result is flushed to
  0 except for the border case 0x00FFFFFF which is promoted to next higher
  FP no., that is, the smallest "normalized" number.
--------------------------------------------------------------------------*/

  if( _rBExp <= 0 )
    {
      if( ( _rBExp | _rMant ) == 0x00FFFFFF )
	{
	  return 0x00800000;
	}

      return 0;
    }

/*------------------------------------------------------------
  Check overflow and pack the 2 parts (sign bit is always 0).
------------------------------------------------------------*/

  if( _rBExp >= 255 )
    return 0x7F800000;

  return ( _rBExp << _FLIP_MANT_SIZE ) | ( _rMant & 0x007FFFFF );
}

