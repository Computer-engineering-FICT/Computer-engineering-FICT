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

inline
float32 __float32_flip_mul_float32_float32(float32 x, float32 y)
{
  float32 _x, _y;
  sbits32 _xBExp, _yBExp, _rBExp;
  sbits32 _xBExp_val_special, _yBExp_val_special;
  bits32 _xMant, _yMant, _rMant;
  bits32 _rSign;

#ifdef __HAS_SUBNORMALS

  float32 _xI, _yI;
  sbits32 _lzc, _shift_den;

/*---------------------------------------------------------------------------------
  For fully IEEE mode "_flip_mul_mant_with_sticky()" can not be used as the exact
  product of the mantissas is needed when the final exponent <= 0 which may lead
  to gradual underflow.
---------------------------------------------------------------------------------*/

  bits32 _xMant_h, _xMant_l;          // higher and lower part of x 
  bits32 _yMant_h, _yMant_l;          // higher and lower part of y
  bits32 _xhyh, _xhyl, _xlyh, _xlyl;  // the 4 intermediate products
  bits32 _xym;                        // the middle part of the product

#endif  //__HAS_SUBNORMALS

  _x = x;
  _y = y;

  _xMant = extractFloat32Frac( _x );              // Extract the 23-bit mantissa.
  _xBExp = ( sbits32 ) extractFloat32Exp( _x );   // Extract the biased exponent.
  _yMant = extractFloat32Frac( _y );
  _yBExp = ( sbits32 ) extractFloat32Exp( _y );

/*----------------------
  Implicit bit is added.
----------------------*/

  _xMant |= 1 << _FLIP_MANT_SIZE;
  _yMant |= 1 << _FLIP_MANT_SIZE;

  _rBExp = _xBExp + _yBExp - _FLIP_BIAS;
  _rSign = ( _x ^ _y ) & 0x80000000;        // Compute the sign bit of the result.

#ifndef __HAS_SUBNORMALS

/*---------------------------------------------------------------
  Early exit in case of trivial computation (operand is zero).
---------------------------------------------------------------*/

  if( !_xBExp || !_yBExp )
    {
      if( ( _xBExp != 255 ) && ( _yBExp != 255 ) )
	{
	  return (bits32) _rSign;
	}
    }

#endif  //__HAS_SUBNORMALS

#ifdef __HAS_SUBNORMALS

  _xI = _x << 1;  // Remove the sign bit.
  _yI = _y << 1;


  // Extract higher and lower parts of x and y.

  _xMant_l = _xMant & 0xFFFF;
  _yMant_l = _yMant & 0xFFFF;
  _xMant_h = _xMant >> 16;
  _yMant_h = _yMant >> 16;

  // Apply a standard 4 products decomposition.

  _xlyl = _xMant_l * _yMant_l; 
  _xlyh = _xMant_l * _yMant_h; 
  _xhyl = _xMant_h * _yMant_l; 
  _xhyh = _xMant_h * _yMant_h; 

  // Sum up the two "middle" products.

  _xym = _xlyh + _xhyl;

  // Sum up with the other terms.

  _rMant = ( _xym + ( _xlyl >> 16 ) + ( _xhyh << 16 ) );

#else  // Quasi IEEE mode.

/*----------------------------------------------------------------------
  Computes the most significant 32 bits of the 48-bit (24 * 24) product
  with the sticky bit computed from the truncated part of 16 bits.
-----------------------------------------------------------------------*/

#ifdef __ST220__  // Code specified for ST220.

/*-----------------------------------------
  Standard 4 partial product decompoition.
-----------------------------------------*/

  _rMant = _flip_mul_mant_with_sticky( _xMant, _yMant );

#else  // Code specified for ST231.

/*--------------------------------------------------------
  Perform the 32 * 32 multiplication as ST231 supports it.
---------------------------------------------------------*/

  _rMant = _flip_32h_umul_32_32( _xMant << 8, _yMant << 8 ) |
          ( ( _flip_32h_umul_32_32( _xMant << 16, _yMant << 16 ) & 0xFFFF ) > 0 );

#endif  //__ST220__

#endif  //__HAS_SUBNORMALS

/*----------------------------------------------------------------------
 If either of the operand is NaN, Infinity or Zero then the following 
 operation allows to verify this through a single comparison after
 one MAX operation. See the special values verification part below.
----------------------------------------------------------------------*/

  _xBExp_val_special = ( _xBExp - 1 ) & 0xFE;
  _yBExp_val_special = ( _yBExp - 1 ) & 0xFE;

/*-----------------------------------------------------------------------
  Special values (NaN, Inf, 0) verification through a single comparison.
------------------------------------------------------------------------*/

  if( _FLIP_MAX( _xBExp_val_special, _yBExp_val_special ) == 0xFE )
    {
      if( _xBExp == 0xFF )
	{
	  if( ( _xMant << 9 ) || 

#ifdef __HAS_SUBNORMALS

	      ( _yI == 0 )  // For fully IEEE mode both exp and man should be zero.

#else  // Quasi IEEE mode.

	      ( _yBExp == 0 )

#endif  //__HAS_SUBNORMALS

	      )

	    {
	      return _flip_declare_nan();
	    }
	  else
	    {
	      if( (( _y << 1 ) <= 0xFF000000) && (( _y << 1 ) != 0 ) )
		{
		  return _flip_declare_infinity( _rSign );
		}
	      else
		return _flip_declare_nan();
	    }
	}


      if( _xBExp == 0 )
	{

#ifdef __HAS_SUBNORMALS

	if ( !(_xMant << 9) )
	  {

#endif  //__HAS_SUBNORMALS

	  if( _yBExp == 0xFF )
	    return _flip_declare_nan();

#ifdef __HAS_SUBNORMALS

	  else
	    return _flip_declare_zero( _rSign );
	  }
	else
	  {
	    _rMant = _rMant - ( _yMant << 7 );
	    _rBExp = _rBExp + 1;
	  }

#endif  //__HAS_SUBNORMALS

	}

#ifdef __HAS_SUBNORMALS

      if( _yBExp == 0 )
	{
	  if (_yMant << 9) 
	    {
	      _rMant = _rMant - ( _xMant << 7 );
	      _rBExp = _rBExp + 1;
	    }
	  else
	    return _rSign;
	}
      else
	{
	  if( _yBExp == 0xFF )
	    {
	      ( bits32 ) _rMant = ( _yBExp << _FLIP_MANT_SIZE ) | _yMant;
	      return _rSign | _rMant;
	    }
	}

#else  // Quasi IEEE mode.

      ( bits32 ) _rMant = ( _yBExp << _FLIP_MANT_SIZE ) | _yMant;
      return _rSign | _rMant;

#endif  //__HAS_SUBNORMALS

    }

#ifdef __HAS_SUBNORMALS

/*------------------------------------------------------------------------------
  Here we are dealing with subnormal numbers and try to check whether the final 
  exponent after normalization:
  1. is <= -25 in which case the result should be flushed to zero or,
  2. is between 0 and -25 in which case gradual underflow is possible or,
  3. is > 0 in which case the final result is a normalized number.
------------------------------------------------------------------------------*/

  _lzc = ( sbits32 ) countLeadingZeros32( _rMant ) - 1;
  _shift_den = _rBExp - _lzc;

  if( ( sbits32 ) ( _shift_den ) <= 0 )
    {
      if( ( sbits32 ) ( _shift_den ) <= -25 )
	{
	  _rMant = 1;
	  _rBExp = 0;
	}
      else
	{
	  if( _lzc > 0 )
	    {
	      _xlyl = _xlyl << 16;

	      _rMant = _rMant << _lzc | ( ( _xlyl & ~( 0xFFFFFFFF >> _lzc ) ) >> (32 - _lzc ) );
	      _rMant |= ( ( _xlyl << _lzc ) != 0 );
	    }
	  else
	    {
	      _rMant |= ( ( _xlyl & 0xFFFF ) > 0 );
	    }

	  _shift_den = 1 - _shift_den + 5 + ( (sbits32) _rMant < 0 );
	  _rMant = ( _rMant >> _shift_den ) | ( ( _rMant & ~(~0 << _shift_den ) ) > 0 );

	  _rBExp = _flip_detect_exp_update( _rMant, _rSign, 25 );
	}
    }
  else
    {
      if( _lzc > 0 )
	{
	  _xlyl = _xlyl << 16;
	  _rMant = _rMant << _lzc | ( ( _xlyl & ~( 0xFFFFFFFF >> _lzc ) ) >> (32 - _lzc ) );
	  _rMant |= ( ( _xlyl << _lzc ) != 0 );
	  _rMant = ( _rMant >> 5 ) | ( ( _rMant & 0x3F ) > 0 );

	  _rBExp = ( sbits32 ) _rBExp - _lzc + _flip_detect_exp_update( _rMant, _rSign, 26 );
	}
      else
	{
	  _rMant |= ( ( _xlyl & 0xFFFF ) > 0 );

#endif  //__HAS_SUBNORMALS

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

/*--------------------------------------------------------------------------
  Exponent update may be required after rounding if the form is 01.11...1.
--------------------------------------------------------------------------*/

      _rBExp = _rBExp + _flip_detect_exp_update( _rMant, _rSign, 26 );
    }

#ifdef __HAS_SUBNORMALS

	}
    }

#endif  //__HAS_SUBNORMALS

/*-------------------------------------------------------------------------
  26-bit mantissa is rounded. _rSign serves when round mode is +inf/-inf.
-------------------------------------------------------------------------*/

  _rMant = _flip_round( _rMant, _rSign );

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

      return _rSign | _flip_underflow( _rSign );
    }

#endif  //__HAS_SUBNORMALS

#if defined (__HAS_SUBNORMALS) || defined (__HAS_ROUNDING_MODES)

/*-------------------------------------------------------------------------
  Check overflow and pack the 2 parts (mantissa and exponent) into 
  a single 32-bit integer with the sign added later.
-------------------------------------------------------------------------*/

  _rMant = _flip_overflow_join( _rMant, _rBExp, _rSign );
  return _rSign | _rMant;

#else  // Quasi IEEE mode.

/*--------------------------------------
  Check overflow and pack the 3 parts.
--------------------------------------*/

  if( _rBExp >= 255 )
    return _rSign | 0x7F800000;

  return _rSign | ( _rBExp << _FLIP_MANT_SIZE ) | ( _rMant & 0x007FFFFF );

#endif //__HAS_SUBNORMALS || __HAS_ROUNDING_MODES

}
