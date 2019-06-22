/* ---------------------------------------------------------------- */
/**
\file fdiv.c
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

inline
float32 __float32_flip_div_float32_float32(float32 x, float32 y)
{
  float32 _x, _y;
  sbits32 _xMant, _yMant;
  sbits32 _xBExp, _yBExp, _rBExp;
  bits32 _rMant, _rSign;
  sbits32 _xBExp_special, _yBExp_special;
  bits32 _iter, _shift;
  bits32 _xFrac, _yFrac;

#ifdef __HAS_SUBNORMALS

  bits32 _lzc;
  float32 _xI, _yI;

#endif  //__HAS_SUBNORMALS

  _x = x;
  _y = y;
  _xFrac = extractFloat32Frac( _x );            // Extract the 23-bit mantissa.
  _xBExp = ( sbits32 ) extractFloat32Exp( _x ); // Extract the biased exponent.
  _yFrac = extractFloat32Frac( _y );
  _yBExp = ( sbits32 ) extractFloat32Exp( _y );
  _rSign = ( _x ^ _y ) & 0x80000000;            // Compute the sign bit of the result.
  _rBExp = _xBExp - _yBExp + 0x7F;

#ifndef __HAS_SUBNORMALS

  /*---------------------------------------------------------------
    Early exit in case of trivial computation (operand is zero).
    ---------------------------------------------------------------*/

  if( !_xBExp )
    {
      if( _yBExp && ( _yBExp != 255 ) )
	{
	  return (bits32) _rSign;
	}
    }

#endif  //__HAS_SUBNORMALS

#ifdef __HAS_SUBNORMALS

  /*-------------------------------------------------------------------------------
    If the operand is a subnormal no. then its mantissa is normalized which is a
    necessary requirement of the division algorithm implemented here. Consequently,
    its exponent is decreased to have the same mathematical value.
    Otherwise the implicit bit is added.
    -------------------------------------------------------------------------------*/

  if( _xBExp == 0 )
    {
      _lzc = countLeadingZeros32( _xFrac ) - 8;
      _xMant = _xFrac << _lzc;
      _rBExp = 1 + _rBExp - _lzc;
    }
  else
    _xMant = _xFrac | ( 1 << _FLIP_MANT_SIZE );

  if( _yBExp == 0 )
    {
      _lzc = countLeadingZeros32( _yFrac ) - 8;
      _yMant = _yFrac << _lzc;
      _rBExp = _rBExp - 1 + _lzc;
    }
  else
    _yMant = _yFrac | ( 1 << _FLIP_MANT_SIZE );

#else  // Quasi IEEE mode.

  _xMant = _xFrac | ( 1 << _FLIP_MANT_SIZE );
  _yMant = _yFrac | ( 1 << _FLIP_MANT_SIZE );

#endif  //__HAS_SUBNORMALS

  /*----------------------------------------------------------------------
    If either of the operand is NaN, Infinity or Zero then the following 
    operation allows to verify this through a single comparison after
    one MAX operation. See the special values verification part below.
    ----------------------------------------------------------------------*/

  _xBExp_special = ( _xBExp - 1 ) & 0xFE;
  _yBExp_special = ( _yBExp - 1 ) & 0xFE;

  /*----------------------------------------------------------------------------------------
    Division of the 2 mantissas "_xMant / _yMant" is performed using nonrestoring algorithm.
    This algorithm requires the divisor and the dividend to be in a particular interval.
    So 1/2 <= _xMant < 1 <= _yMant < 2 that gives 1/4 < quotient < 1. Quotient can be of
    two forms, .1XX...X or 0.01X...X whereas an additional iteration is required for the
    later form.
    32-bit register: 31...26 25 . 24 23...2 1 0
    _yMant         :  0... 0  1 .  X  X...X X 0
    _xMant         :  0... 0  0 .  1  X...X X X
    Since 24-bit (25-bit when first bit is 0) normalized quotient is required and each
    iteration gives 1 bit, 25 or 26 iterations are performed, last being for guard bit.
    ----------------------------------------------------------------------------------------*/

  _shift = _xMant < _yMant;
  _rMant = 0;
  _yMant = _yMant << 1;

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
    
  if( _xMant < 0 )
    {
      _xMant = _xMant + _yMant;
      _rMant = _rMant - 1;
    }

  /*--------------------------------------------------------------------------
    When quotient is of the form 0.01X...X, exponent is updated.
    In division sticky bit is only required when rounding mode is +inf/-inf.
    For round-to-nearest tie case can never occur.
    --------------------------------------------------------------------------*/
  
  _rBExp = _rBExp - _shift;
  _rMant = ( _rMant << 1 ) | ( _xMant != 0 );

#ifdef __HAS_SUBNORMALS

  /*------------------------------------------------------------------------------
    Here we are dealing with subnormal numbers and try to check whether the final 
    exponent after normalization:
    1. is <= -25 in which case the result should be flushed to zero or,
    2. is between 0 and -25 in which case gradual underflow is possible.
    ------------------------------------------------------------------------------*/

  if( _rBExp <= 0 )
    {
      if( _rBExp <= -25 )
	{
	  _rMant = 1;
	  _rBExp = 0;
	}
      else
	{
	  _rBExp = 1 - _rBExp;
	  _rMant = ( _rMant >> _rBExp ) | ( ( _rMant & ~(~0 << _rBExp ) ) > 0 );
	  _rBExp = _flip_detect_exp_update( _rMant, _rSign, 25 );
	}
    }

#endif  //__HAS_SUBNORMALS

  /*-------------------------------------------------------------------------
    26-bit mantissa is rounded. _rSign serves when round mode is +inf/-inf.
    -------------------------------------------------------------------------*/

  _rMant = _flip_round( _rMant, _rSign );

  /*-----------------------------------------------------------------------
    Special values (NaN, Inf, 0) verification through a single comparison.
    ------------------------------------------------------------------------*/

  if( _FLIP_MAX( _xBExp_special, _yBExp_special ) == 0xFE )
    {
      if( _xBExp == 0xFF )
	{
	  if( ( _xFrac ) || ( _yBExp == 0xFF ) )
	    {
	      return _flip_declare_nan();
	    }
	  return _flip_declare_infinity( _rSign );
	}

      if( _yBExp == 0xFF )
	{
	  if( _yFrac )
	    {
	      return _flip_declare_nan();
	    }
	  return _flip_declare_zero( _rSign );
	}

#ifdef __HAS_SUBNORMALS

      _xI = _x << 1;
      _yI = _y << 1;

      if( _xI == 0 )  // For fully IEEE mode both exp and man should be zero.
	{
	  if( _yI )
	    return _flip_declare_zero( _rSign );
	  else
	    return _flip_declare_nan();
	}

      if( _yI == 0 )
	return _flip_declare_infinity( _rSign );

#else
      if( ( _xBExp | _yBExp ) == 0 )
	{
	  return _flip_declare_nan();
	}
      else
	{
	  return _flip_declare_infinity( _rSign );
	}

#endif  //__HAS_SUBNORMALS

    }

#ifndef __HAS_SUBNORMALS

  /*--------------------------------------------------------------------------
    For quasi IEEE mode when the final exponent <= 0, result is flushed to
    0 except for the border case 0x00FFFFFF which is promoted to next higher
    FP no., that is, the smallest "normalized" number.
    --------------------------------------------------------------------------*/

  if( _rBExp <= 0 )
    {

#ifdef __HAS_ROUNDING_MODES

      if( flip_rnd_mode == FLIP_RN )
	{

#endif  //__HAS_ROUNDING_MODES

      if( ( _rBExp | _rMant ) == 0x00FFFFFF )
	{
	  return _rSign | 0x00800000;
	}

#ifdef __HAS_ROUNDING_MODES

	}
      else

#endif  //__HAS_ROUNDING_MODES

      return _rSign | _flip_underflow( _rSign ) ;
    }

#endif  //__HAS_SUBNORMALS

  /*-------------------------------------------------------------------------
    Check overflow and pack the 2 parts (mantissa and exponent) into 
    a single 32-bit integer with the sign added later.
    -------------------------------------------------------------------------*/

  _rMant = _flip_overflow_join( _rMant, _rBExp, _rSign );
  return _rSign | _rMant;
}
