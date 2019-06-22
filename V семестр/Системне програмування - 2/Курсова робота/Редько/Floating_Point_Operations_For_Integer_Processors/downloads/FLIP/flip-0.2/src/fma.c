/* ---------------------------------------------------------------- */
/** 
\file fma.c
\brief Code for the fused multiply and add operation.
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** 
\brief FP \b fused multiply and add operation: returns \f$ x \times y + z \f$.

\param x is the multiplicand (32-bit FPN)
\param y is the multiplier (32-bit FPN)
\param z is the addend (32-bit FPN)
\addindex FPN

*/

/*-------------------------------------------------------------------------------
  This is a implementation of fused multiply and add operation which computes
  "x * y + z". This operation performs full width multiplication, that is the
  product x*y is exact when it is added to z. So, there is only 1 rounding error
  after addition instead of 2 if x*y+z is performed as 2 separate operations.
  The product can be computed using either of the processors ST220/ST231.
-------------------------------------------------------------------------------*/

inline
float32 __float32_flip_fma_float32_float32_float32(float32 x, float32 y, float32 z)
{
  float32 _x, _y, _z;
  sbits32 _xBExp, _yBExp, _zBExp, _prodBExp, _rBExp;
  sbits32 _xBExp_val_spl, _yBExp_val_spl, _zBExp_val_spl;

  bits32 _xFrac, _yFrac, _zFrac, _xMant, _yMant, _zMant, _rMant;
  bits64 _prodMant64, _zMant64, _rMant64;
  sbits64 _prodsMant64, _zsMant64, _rsMant64, _tempsMant64;

  bits32 _prodSign, _zSign, _rSign, _lzc, _rnd, _prod_exp_up;

#ifdef __ST220__  //  code specified for ST220

  bits32 _xMant_L, _xMant_H, _yMant_L, _yMant_H;
  bits32 _xHyH, _xHyL, _xLyH, _xLyL;
  bits32 _xyM;
  bits32 _prod_high32;

#else  //  code specified for ST231

  bits32 _xy_HM32, _xy_ML32;

#endif  //__ST220__

  sbits32 _expDiff, _expDiffAbs, _preShift;

  _x = x;
  _y = y;
  _z = z;

  _xFrac = extractFloat32Frac( _x );             // Extract the 23-bit mantissa.
  _xBExp = ( sbits32 ) extractFloat32Exp( _x );  // Extract the biased exponent.

  _yFrac = extractFloat32Frac( _y );
  _yBExp = ( sbits32 ) extractFloat32Exp( _y );

  _zFrac = extractFloat32Frac( _z );
  _zBExp = ( sbits32 ) extractFloat32Exp( _z );

  _zSign = extractFloat32Sign( _z );

/*---------------------------------------------------------
  Implicit bit is added, if exponent = 0 the operand is 0.
---------------------------------------------------------*/

  _xMant = _xFrac | ( 1 << _FLIP_MANT_SIZE );
  _yMant = _yFrac | ( 1 << _FLIP_MANT_SIZE );
  _zMant = _zFrac | ( 1 << _FLIP_MANT_SIZE );

/*-----------------------------------------------------------
  Since the implicit bit is added, the mantissa of the third
  operand is made equal to 0 if its exponent is 0.
-----------------------------------------------------------*/

  if( _zBExp == 0 )
    _zMant = 0;

  _prodBExp = _xBExp + _yBExp - 0x7F;    // Compute the intermediate exponent.
  _expDiff = _prodBExp - _zBExp;
  _prodSign = ( _x ^ _y ) & 0x80000000;  // Compute the intermediate sign.

/*---------------------------------------------------------------
  Early exit in case of trivial computation (operand is zero).
---------------------------------------------------------------*/

  if( !_xBExp || !_yBExp )
    {
      if( ( _xBExp != 255 ) && ( _yBExp != 255 ) )
	{
	  if( _zBExp == 0 )
	    return ( _prodSign & _z ) & 0x80000000;

	  return _z;
	}
    }

/*---------------------------------------------------------------------------------
  Since exact product of the mantissas is needed, "_flip_mul_mant_with_sticky()"
  which computes the sticky bit too, can not be used. The full width product is
  stored on a 64-bit variable.
---------------------------------------------------------------------------------*/

#ifdef __ST220__ // code specified for ST220

  // Extract higher and lower parts of x and y.

  _xMant_L = _xMant & 0xFFFF;
  _yMant_L = _yMant & 0xFFFF;
  _xMant_H = _xMant >> 16;
  _yMant_H = _yMant >> 16;

  // Apply a standard 4 products decomposition.

  _xLyL = _xMant_L * _yMant_L;
  _xLyH = _xMant_L * _yMant_H; 
  _xHyL = _xMant_H * _yMant_L; 
  _xHyH = _xMant_H * _yMant_H; 

  // Sum up the two "middle" products.

  _xyM = _xLyH + _xHyL;

  // Sum up with the other terms.

  _prod_high32 = ( _xyM + ( _xLyL >> 16 ) + ( _xHyH << 16 ) );
  _prod_exp_up = _prod_high32;
  _prodMant64 = ( ( ( bits64 ) _prod_high32 << 32 ) | ( _xLyL << 16 ) ) >> 2;

#else  // code specified for ST231

/*---------------------------------------------------------------------------
  The multiplication is performed using an intrinsic function "__mulhhuw"
  which returns top 32 bits of the 64-bit product obtained from an unsigned 
  32 * 32 multiplication. 
---------------------------------------------------------------------------*/

  _xy_ML32 = _flip_32h_umul_32_32( _xMant << 16, _yMant << 16 );
  _xy_HM32 = _flip_32h_umul_32_32( _xMant << 8, _yMant << 8 );
  _prod_exp_up = _xy_HM32;

  _prodMant64 = ( ( ( bits64 ) _xy_HM32 << 32 ) | ( ( _xy_ML32 & 0xFFFF ) << 16 ) ) >> 2;

#endif  //__ST220__

/*----------------------------------------------------------------------------------
  Note that now we are performing 64-bit arithmetic. The mantissa "_zMant" is stored
  on a 64-bit variable. 64-bit arithmetic is efficient especially when _zMant is
  aligned by more than 48 bits (product length). The addition operation is almost
  same as performing a FP addition in "fadd.c".
----------------------------------------------------------------------------------*/

  _zMant64 = ( bits64 ) _zMant << 37;

  _prodsMant64 = ( sbits64 ) _prodMant64;
  _zsMant64 = ( sbits64 ) _zMant64;

/*----------------------------------------------------------------------------------------
  Mantissas are changed to signed mantissas using the sign of the product and the operand.
-----------------------------------------------------------------------------------------*/

  if( _prodSign ) _prodsMant64 = -_prodsMant64;
  if( _zSign ) _zsMant64 = -_zsMant64;

/*-------------------------------------------------------------------------------
  Mantissas are swapped according to the sign of the exponent difference.
  Mantissa of the operand with a smaller exponent is always stored in _zsMant64.
-------------------------------------------------------------------------------*/

  _tempsMant64 = _prodsMant64;
  if( _expDiff < 0 )
    {
      _prodsMant64 = _zsMant64;
      _zsMant64 = _tempsMant64;
    }

/*-----------------------------------------------------------------------------------
  Alignment of mantissas is done by shifting _ysMant.
  Shift >=48 makes all the significant bits equal to 0 and the sticky bit becomes 1.
-----------------------------------------------------------------------------------*/

  _expDiffAbs = _FLIP_ABS( _expDiff );
  _preShift = _FLIP_MIN( _expDiffAbs, 48 );
  _zsMant64 = ( _zsMant64 >> _preShift ) | ( ( _zsMant64 & ~( ~(bits64) 0 << _preShift ) ) != 0 );

/*----------------------------------------------------------------------
  Mantissas are added and the final sign is extracted from the sum.
----------------------------------------------------------------------*/

  _rsMant64 = _prodsMant64 + _zsMant64;
  _rSign = ( bits32 ) ( _rsMant64 >> 32 ) & 0x80000000;

  _rMant64 = ( bits64 ) _FLIP_ABS( _rsMant64 );

/*-----------------------------------------------------------------------------------
  The sum (_rsMant) of the forms, 1X.XX...X or 0.00...XX must be shifted left
  or right by the no. of bits given by _lzc and the exponent is updated consequently.
------------------------------------------------------------------------------------*/

  _lzc = ( bits32 ) countLeadingZeros64( _rMant64 );
  _rMant64 = _rMant64 << _lzc;
  _rBExp = _FLIP_MAX( _prodBExp, _zBExp ) + 3 - _lzc;

/*--------------------------------------------------------------------------------
  Mantissa is shifted right to have 24 bits with additional 2 bits for rounding.
--------------------------------------------------------------------------------*/

  _rMant = ( bits32 ) ( ( _rMant64 >> 38 ) | ( ( _rMant64 & 0x3FFFFFFFFFLL ) != 0 ) );

/*--------------------------------------------------------------------------
  Exponent update may be required after rounding if the form is 01.11...1.
--------------------------------------------------------------------------*/

  _rBExp = _rBExp + ( ( _rMant + 0x2 ) >> 26 );

/*---------------------------
  26-bit mantissa is rounded.
----------------------------*/

  _rnd = _rMant & 0x3;
  _rMant = ( ( ( _rMant + 0x2 ) >> 2 ) & ( ( ~( _rnd & 0x2 ) >> 1 ) | _rnd ) );

/*----------------------------------------------------------------------
 If either of the operand is NaN, Infinity or Zero then the following 
 operation allows to verify this through a single comparison after
 one MAX operation. See the special values verification part below.
----------------------------------------------------------------------*/

  _xBExp_val_spl = ( _xBExp - 1 ) & 0xFE;
  _yBExp_val_spl = ( _yBExp - 1 ) & 0xFE;
  _zBExp_val_spl = ( _zBExp - 1 ) & 0xFE;

/*-----------------------------------------------------------------------
  Special values (NaN, Inf, 0) verification through a single comparison.
------------------------------------------------------------------------*/

  if( _FLIP_MAX( _FLIP_MAX( _xBExp_val_spl, _yBExp_val_spl ), _zBExp_val_spl ) == 0xFE )
    {
      if( ( _z << 1 ) > 0xFF000000 )
	return _flip_declare_nan();

      _prodBExp = _prodBExp + ( _prod_exp_up >> 31 );
      _zSign = _zSign << 31;

      if( _xBExp == 0xFF )
	{
	  if( _xFrac || ( _yBExp == 0 ) )
	    {
	      return _flip_declare_nan();
	    }
	  else
	    {
	      if( ( ( _y << 1 ) > 0xFF000000 ) || ( ( _yBExp == 0 ) ) )
		return _flip_declare_nan();
	      if( _zBExp == 0xFF )
		{
		  if( _zFrac || ( _prodSign != _zSign ) )
		    return _flip_declare_nan();
		}

	      return _flip_declare_infinity( _prodSign );
	    }
	}

      if( _xBExp == 0 )
	{
	  if( _yBExp == 0xFF )
	    return _flip_declare_nan();
	}

      if( _yBExp == 0xFF )
	{
	  if( _yFrac )
	    return _flip_declare_nan();
	  if( _zBExp == 0xFF )
	    {
	      if( _zFrac || ( _prodSign != _zSign ) )
		return _flip_declare_nan();
	    }

	  return _flip_declare_infinity( _prodSign );
	}

      if( _zBExp == 0xFF )
	{
	  if( _zFrac || ( ( _prodBExp == 0xFF ) && ( _prodSign != _zSign ) ) )
	    return _flip_declare_nan();

	  return _rSign | ( _z & 0x7FFFFFFF );
	}
    }

/*--------------------------------------------------------------------------------
  When the sum of two operands with opposite signs (or the difference of two
  operands with like signs) is exactly zero, the sign of that sum (or difference)
  shall be "+" in all rounding modes except round toward -inf, in which mode that
  sign shall be "-". (from IEEE 754 standard draft)
--------------------------------------------------------------------------------*/

  if( _rMant == 0 ) 
    return 0;

  
  if( _rBExp <= 0 )  // Underflow check.
    {
      return 0;
    }

/*--------------------------------------
  Check overflow and pack the 3 parts.
--------------------------------------*/

  if( _rBExp >= 255 )
    return _rSign | 0x7F800000;

  return _rSign | ( _rBExp << _FLIP_MANT_SIZE ) | ( _rMant & 0x007FFFFF );

}
