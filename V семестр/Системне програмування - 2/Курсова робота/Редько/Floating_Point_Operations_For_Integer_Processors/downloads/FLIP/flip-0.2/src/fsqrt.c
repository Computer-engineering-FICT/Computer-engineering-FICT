/* ---------------------------------------------------------------- */
/**
\file fsqrt.c
\brief code for the square root operation
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** \brief returns the square root of \a x
 
\a x should be a 32-bit floating-point number.
\param x is the operand
\addindex FPN

*/

inline
float32 __float32_flip_sqrt_float32( float32 x )
{
  float32 _x;
  sbits32 _xMant;
  sbits32 _xBExp, _rBExp;
  bits32 _rMant, _rSign;
  bits32 _iter;
  bits32 _cst_frac_part;
  bits32 _xFrac;

#ifdef __HAS_SUBNORMALS

  bits32 _lzc;

#else  // Quasi IEEE mode

  sbits32 _yBExp;

#endif  //__HAS_SUBNORMALS

  _x = x;

/*-----------------------------------------------------------------------------
  Since the square root of a negative number is NaN (sqrt(-0) = -0), all x < 0
  are transformed into a NaN (0xFFFFFFFF). So this x is filtered as a special
  value and the result returned is NaN.
-----------------------------------------------------------------------------*/

#ifdef __HAS_SUBNORMALS

  _x = _x | ( ( ( ( sbits32 ) ( _x ) >> 31 ) ) & ( ( sbits32 ) ( 0x80000000 - _x ) >> 31 ) );

#else  // Quasi IEEE mode

  _yBExp = ( sbits32 ) extractFloat32Exp( _x );
  _x = _x | ( ( sbits32 ) ( _x ) >> 31 );

#endif  //__HAS_SUBNORMALS

  _xFrac = extractFloat32Frac( _x );              // Extract the 23-bit mantissa.
  _xBExp = ( sbits32 ) extractFloat32Exp( _x );   // Extract the biased exponent.
  _rSign = _x & 0x80000000;                       // Compute the sign bit of the result.
  
#ifdef __HAS_SUBNORMALS

/*----------------------------------------------------------------------------
  If the operand is a subnormal no. then its mantissa is normalized.
  Consequently, its exponent is decreased to have the same mathematical value.
  Otherwise the implicit bit is added.
  --------------------------------------------------------------------------*/

  if( _xBExp == 0 )
    {
      if( _xFrac == 0 )
	return _rSign;

      _lzc = ( sbits32 ) countLeadingZeros32( _xFrac ) - 8;
      _xMant = _xFrac << _lzc;
      _xBExp = 1 - _lzc;
    }

  else
    _xMant = _xFrac | ( 1 << _FLIP_MANT_SIZE );

#else  // Quasi IEEE mode

  /*---------------------------------------------------------------
    Early exit in case of trivial computation (operand is zero).
    ---------------------------------------------------------------*/

  if( !_yBExp )
    return _rSign;

  _xMant = _xFrac | ( 1 << _FLIP_MANT_SIZE );

#endif  //__HAS_SUBNORMALS

/*-----------------------------------------------------------------------------
  2^e * m = 2^(e-1) * 2 * m, the odd unbiased exponent is turned into an even
  exponent in order to compute the sqrt easily (sqrt(2^even) = 2^(even/2)).
-----------------------------------------------------------------------------*/

  _xMant = _xMant << ( ~_xBExp & 0x1 );
  _rBExp = ( ( _xBExp + _FLIP_BIAS ) >> 1 ); 

/*--------------------------------------------------------------------------------
  Square root of the mantissa "_xMant" is performed using nonrestoring algorithm.
  Since 1 <= _xMant < 4, 1 <= sqrt < 2.
  32-bit register  : 31...25 24 . 23...1 0
  _xMant (even exp):  0... 0  1 .  X...X X
  _xMant (odd exp) :  0... 1  X .  X...X 0

  Since 24-bit normalized quotient is required and each iteration gives 1 bit, 25
  iterations are performed, last being for guard bit.
  Since first 2 iterations are fast (first bit of sqrt is always 1), they are
  performed separately with initializaton step.
  -------------------------------------------------------------------------------*/

  _rMant = 1 << ( _FLIP_MANT_SIZE + 1 );
  _cst_frac_part = 0x800000;
  _xMant = _xMant - _rMant;
  _xMant = ( _xMant << 2 ) - _cst_frac_part;
  _rMant = _rMant | _cst_frac_part;
  _cst_frac_part = _cst_frac_part >> 1;

  for( _iter = 3; _iter <= 25; _iter++ )
    {
      _xMant = _xMant << 1;

      if( _xMant >= 0 )
	{
	  _xMant = _xMant - ( ( _rMant << 1 ) | _cst_frac_part );
	  _rMant = _rMant | _cst_frac_part;
	}
      else
	{
	  _xMant = _xMant + ( ( _rMant << 1 ) - _cst_frac_part );
	  _rMant = _rMant - _cst_frac_part;
	}
      _cst_frac_part = _cst_frac_part >> 1;
    }

  if( _xMant < 0 )
    {
      _xMant = _xMant + ( ( _rMant << 1 ) - 1 );
      _rMant = _rMant - 1;
    }

  /*---------------------------------------------------------------------------
    In square root sticky bit is only required when rounding mode is +inf/-inf.
    For round-to-nearest tie case can never occur.
    --------------------------------------------------------------------------*/

  _rMant = ( _rMant << 1 ) | ( _xMant != 0 );
  _rBExp = _rBExp + _flip_detect_exp_update( _rMant, _rSign, 26 );

  /*-------------------------------------------------------------------------
    26-bit mantissa is rounded. _rSign serves when round mode is +inf/-inf.
    -------------------------------------------------------------------------*/

  _rMant = _flip_round( _rMant, _rSign );

  /*-----------------------------------------------------------------------
    Special values (NaN, Inf, 0) verification through a single comparison.
    ------------------------------------------------------------------------*/

#ifdef __HAS_SUBNORMALS

  if( _xBExp == 0xFF )
    return _x;

#else  // Quasi IEEE mode

  if( _xBExp == 0xFF )
    return _x;

#endif  //__HAS_SUBNORMALS

/*------------------
  Pack the 3 parts.
------------------*/

  return _rSign | ( _rBExp << _FLIP_MANT_SIZE ) | ( _rMant & 0x7FFFFF );

}
