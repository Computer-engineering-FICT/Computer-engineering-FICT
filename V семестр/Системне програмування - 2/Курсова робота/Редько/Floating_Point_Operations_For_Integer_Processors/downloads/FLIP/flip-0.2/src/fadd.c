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

inline  
float32 __float32_flip_add_float32_float32(float32 x, float32 y)
{ 
  float32 _x, _y;
  sbits32 _xBExp, _yBExp, _rBExp;
  sbits32 _xBExp_special, _yBExp_special;
  bits32  _rMant;
  sbits32 _xsMant, _ysMant, _tsMant, _rsMant;
  bits32  _xSign, _ySign, _rSign, _lzc;
  sbits32 _expDiff, _expDiffAbs, _preShift;
  bits32  _xFrac, _yFrac;

#ifdef __HAS_SUBNORMALS

  float32 _xI, _yI;
  sbits32 _shift_den;

#endif  //__HAS_SUBNORMALS

#if defined (__HAS_SUBNORMALS) || defined (__HAS_ROUNDING_MODES)

  bits32 _rBExp_rMant_pack;
  
#endif  //__HAS_SUBNORMALS || __HAS_ROUNDING_MODES

  _x = x;
  _y = y;
  _xFrac = extractFloat32Frac( _x );  // Extract the 23-bit mantissa.
  _xBExp = extractFloat32Exp( _x );   // Extract the biased exponent.
  _xSign = extractFloat32Sign( _x );  // Extract the sign bit by _x >> 31.
  _yFrac = extractFloat32Frac( _y );
  _yBExp = extractFloat32Exp( _y );
  _ySign = extractFloat32Sign( _y );
  _expDiff = _xBExp - _yBExp;

#ifndef __HAS_SUBNORMALS

/*---------------------------------------------------------------
  Early exit in case of trivial computation (operand is zero).
---------------------------------------------------------------*/

  if( !_xBExp || !_yBExp )
    {
      if( ( _xBExp != 255 ) && ( _yBExp != 255 ) )
	{
	  if( ( _xBExp | _yBExp ) == 0 )
	  
#ifdef __HAS_ROUNDING_MODES

	    if( flip_rnd_mode == FLIP_RD )
	      return ( _x | _y ) & 0x80000000;
	    else

#endif  //__HAS_ROUNDING_MODES

	    return ( x & y ) & 0x80000000;
	  else
	    {
	      if( _xBExp == 0 )
		return y;
	      else
		return x;
	    }
	}
    }

#endif  //__HAS_SUBNORMALS

/*----------------------------------------------------------------------
 If either of the operand is NaN, Infinity or Zero then the following 
 operation allows to verify this through a single comparison after
 one MAX operation. See the special values verification part below.
----------------------------------------------------------------------*/

  _xBExp_special = ( _xBExp - 1 ) & 0xFE;
  _yBExp_special = ( _yBExp - 1 ) & 0xFE;

#ifdef __HAS_SUBNORMALS

  _xI = _x << 1;  // Remove the sign bit.
  _yI = _y << 1;

/*---------------------------------------------------------------
  No implicit bit is added if exponent is zero.
  Shift mantissa left by 3 bits to accomodate guard bits.
---------------------------------------------------------------*/

  _xsMant = ( sbits32 ) ( ( _xFrac | ( ( ( 0 - _xBExp ) >> 8 ) & 0x800000 ) ) << 3 );
  _ysMant = ( sbits32 ) ( ( _yFrac | ( ( ( 0 - _yBExp ) >> 8 ) & 0x800000 ) ) << 3 );

#else  // Quasi IEEE mode.

/*--------------------------------------------------------------------
  Implicit bit is added.
  Shift mantissa left by 3 bits to accomodate guard bits.
--------------------------------------------------------------------*/

  _xsMant = (sbits32) ( ( _xFrac | ( 1 << _FLIP_MANT_SIZE ) ) << 3 );
  _ysMant = (sbits32) ( ( _yFrac | ( 1 << _FLIP_MANT_SIZE ) ) << 3 );

#endif  //__HAS_SUBNORMALS

/*----------------------------------------------------------------------------------------
  Mantissas are changed to signed mantissas using the signs of their respective operands.
----------------------------------------------------------------------------------------*/

  _xsMant = ( ( ~_xsMant + 1 ) & ( 0 - _xSign ) ) | ( _xsMant & ~( 0 - _xSign ) );
  _ysMant = ( ( ~_ysMant + 1 ) & ( 0 - _ySign ) ) | ( _ysMant & ~( 0 - _ySign ) );

#ifdef __HAS_SUBNORMALS

/*------------------------------------------------------------------------
  If the operand is subnormal its exponent is 1 for computations.
------------------------------------------------------------------------*/

  _xBExp = _FLIP_MAX( _xBExp, 1 );
  _yBExp = _FLIP_MAX( _yBExp, 1 );
  _expDiff = _xBExp - _yBExp;

#endif  //__HAS_SUBNORMALS

/*-------------------------------------------------------------------------------
  Mantissas are swapped according to the sign of the exponent difference.
  Mantissa of the operand with a smaller exponent is always stored in _ysMant.
-------------------------------------------------------------------------------*/

  _tsMant = _xsMant;
  _xsMant = ( _xsMant & ~( _expDiff >> 31 ) ) | ( _ysMant & ( _expDiff >> 31 ) );
  _ysMant = ( _ysMant & ~( _expDiff >> 31 ) ) | ( _tsMant & ( _expDiff >> 31 ) );

/*-----------------------------------------------------------------------------------
  Alignment of mantissas is done by shifting _ysMant.
  Shift >=26 makes all the significant bits equal to 0 and the sticky bit becomes 1.
-----------------------------------------------------------------------------------*/

  _expDiffAbs = _FLIP_ABS( _expDiff );
  _preShift = _FLIP_MIN( _expDiffAbs, 26 );
  _ysMant = ( _ysMant >> _preShift ) | ( ( _ysMant &  ~( ~0 << _preShift ) ) != 0 );

/*----------------------------------------------------------------------
  Mantissas are added and the final sign is extracted from the sum.
----------------------------------------------------------------------*/

  _rsMant = _xsMant + _ysMant;
  _rSign = ( bits32 ) ( _rsMant & 0x80000000 );

  _rMant = ( bits32 ) _FLIP_ABS( _rsMant );

/*-----------------------------------------------------------------------------------
  The sum (_rsMant) of the forms, 1X.XX...X or 0.00...XX must be shifted left
  or right by the no. of bits given by _lzc and the exponent is updated consequently.
------------------------------------------------------------------------------------*/

  _lzc = ( bits32 ) countLeadingZeros32( _rMant ) - 1;

#ifdef __HAS_SUBNORMALS

/*-------------------------------------------------------------------------------
  Final exponent is computed and 4 is added to it because  _lzc of 000001.XX...X 
  is 4. As exponent update is not required in this case, 4 is subtracted later.
-------------------------------------------------------------------------------*/

  _rBExp = _FLIP_MAX( _xBExp, _yBExp ) + 4;  // Update the exponent.

#else  // Quasi IEEE mode.

  _rMant = _rMant << _lzc;                          // Final mantissa is normalized.
  _rBExp = _FLIP_MAX( _xBExp, _yBExp ) + 4 - _lzc;  // Final exponent is computed and updated.

#endif  //__HAS_SUBNORMALS


#ifdef __HAS_SUBNORMALS

/*------------------------------------------------------------------------------
  Here we are dealing with subnormal numbers and try to check whether the final 
  exponent after normalization:
  1. is <= -26 in which case the result should be flushed to zero or,
  2. is between 0 and -26 in which case gradual underflow is possible or,
  3. is > 0 in which case the final result is a normalized number.
------------------------------------------------------------------------------*/

    _shift_den = _rBExp - _lzc;

  if( ( sbits32 ) ( _shift_den ) <= -26 )
    {
      _rMant = 1;
      _rBExp = 0;
    }
  else
    if( ( sbits32 ) ( _shift_den ) <= 0 )
      {
	_rMant = _rMant << _lzc;
	_shift_den = 1 - _shift_den + 5;
	_rMant = ( _rMant >> ( _shift_den ) ) | ( ( _rMant & ~(~0 << ( _shift_den ) ) ) > 0 );
	_rBExp = 0;
	_rBExp = _flip_detect_exp_update( _rMant, _rSign, 25 );
      }
    else
      {
	_rMant = _rMant << _lzc;
	_rBExp = ( sbits32 ) _rBExp - _lzc;

#endif  //__HAS_SUBNORMALS

/*--------------------------------------------------------------------------------
  Mantissa is shifted right to have 24 bits with additional 2 bits for rounding.
--------------------------------------------------------------------------------*/

  _rMant = ( _rMant >> 5 ) | ( ( _rMant & 0x3F ) > 0 );

/*--------------------------------------------------------------------------
  Exponent update may be required after rounding if the form is 01.11...1.
--------------------------------------------------------------------------*/

  _rBExp = _rBExp + _flip_detect_exp_update( _rMant, _rSign, 26 );

#ifdef __HAS_SUBNORMALS

      }  // To avoid duplicating the 2 lines above.

#endif  //__HAS_SUBNORMALS

/*-----------------------------------------------------------------------
  Special values (NaN, Inf, 0) verification through a single comparison.
------------------------------------------------------------------------*/

  if( _FLIP_MAX( _xBExp_special, _yBExp_special ) == 0xFE )
    {
      if( _expDiff > 0 )
	{
	  if( ( _xBExp == 0xFF ) || 

#ifdef __HAS_SUBNORMALS

	      ( _yI == 0 )  // For fully IEEE mode both exp and man should be zero.

#else  // Quasi IEEE mode.

	      ( _yBExp == 0 )

#endif  //__HAS_SUBNORMALS

	      )
	    return _x;
	}

      else
	if( _expDiff < 0 )
	  {
	    if( ( _yBExp == 0xFF ) ||

#ifdef __HAS_SUBNORMALS

		( _xI == 0 )

#else  // Quasi IEEE mode.

		( _xBExp == 0 )

#endif  //__HAS_SUBNORMALS

		)
	      return _y;
	  }
	else
	  {
	    if( _xBExp == 0xFF )
	      {
		if( _xFrac | _yFrac )
		  return _flip_declare_nan();
		if( _xSign == _ySign) 
		  return _x;
		return _flip_declare_nan();
	      }

#ifdef __HAS_SUBNORMALS

	    if( ( _xI | _yI ) == 0 )
	      {
		if( flip_rnd_mode == FLIP_RD )
		  return _x | _y;
		else
		  return _x & _y;
	      }

#endif  //__HAS_SUBNORMALS

	  }
    }

/*-------------------------------------------------------------------------
  26-bit mantissa is rounded. _rSign serves when round mode is +inf/-inf.
-------------------------------------------------------------------------*/

  _rMant = _flip_round( _rMant, _rSign );

/*--------------------------------------------------------------------------------
  When the sum of two operands with opposite signs (or the difference of two
  operands with like signs) is exactly zero, the sign of that sum (or difference)
  shall be "+" in all rounding modes except round toward -inf, in which mode that
  sign shall be "-". (from IEEE 754 standard draft)
--------------------------------------------------------------------------------*/

  if( ( _rsMant ) == 0 ) 
    {

#ifdef __HAS_ROUNDING_MODES

      if( flip_rnd_mode == FLIP_RD )
	return 0x80000000;

#endif  //__HAS_ROUNDING_MODES

      return 0;
    }  

#ifndef __HAS_SUBNORMALS

  if( _rBExp <= 0 )  // Underflow check.
    {
      return _rSign | _flip_underflow( _rSign );
    }

#endif  //__HAS_SUBNORMALS

#if defined (__HAS_SUBNORMALS) || defined (__HAS_ROUNDING_MODES)

/*-------------------------------------------------------------------------
  Check overflow and pack the 2 parts (mantissa and exponent) into 
  a single 32-bit integer with the sign added later.
-------------------------------------------------------------------------*/

  _rBExp_rMant_pack = _flip_overflow_join( _rMant, _rBExp, _rSign );
  return _rSign | _rBExp_rMant_pack;

#else // Quasi IEEE mode.

/*--------------------------------------
  Check overflow and pack the 3 parts.
--------------------------------------*/

  if( _rBExp >= 255 )
    return _rSign | 0x7F800000;

  return _rSign | ( _rBExp << _FLIP_MANT_SIZE ) | ( _rMant & 0x007FFFFF );

#endif //__HAS_SUBNORMALS || __HAS_ROUNDING_MODES

}
