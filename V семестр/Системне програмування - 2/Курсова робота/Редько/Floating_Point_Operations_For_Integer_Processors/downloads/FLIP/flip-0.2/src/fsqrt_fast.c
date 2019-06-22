/* ---------------------------------------------------------------- */
/**
\file fsqrt_fast.c
\brief code for the square root operation
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** \brief returns the square root of \a x
 
\a x should be a 32-bit floating-point number.
\addindex FPN
*/


/*-----------------------------------------------------------------------------
  This implementation of square root is much faster than the one in "fsqrt.c".
  Moreover, same implementation applies for two different processor cores,
  ST220 and ST231. The approach adopted and the optimizations done are
  explained later. Apart from the square root (root) of the mantissa all other
  computations are performed in the same way as in "fsqrt.c". The fully IEEE
  implementation is not supported, that is no "subnormals" and rounding mode
  is fixed to "round-to-nearest-even". 
-----------------------------------------------------------------------------*/

inline
float32 __float32_flip_sqrt_float32( float32 x )
{
  float32 _x;
  bits32 _xMant;
  sbits32 _xBExp, _rBExp;
  bits32 _rMant, _rSign, _rnd;
  bits32 _cst_u3, _cst_u2, _cst_u1, _cst_u0;
  bits32 _xMant_sqr, _poly_term_1, _poly_term_2, _poly_approx;
  bits32 _z_1;
  bits32 _w_1, _w_2;

  _x = x;

  _xMant = extractFloat32Frac( _x );             // Extract the 23-bit mantissa.
  _xBExp = ( sbits32 ) extractFloat32Exp( _x );  // Extract the biased exponent.
  _rSign = _x & 0x80000000;                      // Compute the sign bit of the result.

/*---------------------------------------------------------
  Implicit bit is added, if exponent = 0 the operand is 0.
---------------------------------------------------------*/

  _xMant = _xMant | ( 1 << _FLIP_MANT_SIZE );

/*-----------------------------------------------------------------------------
  2^e * m = 2^(e-1) * 2 * m, the odd unbiased exponent is turned into an even
  exponent in order to compute the sqrt easily (sqrt(2^even) = 2^(even/2)).
-----------------------------------------------------------------------------*/

  _rBExp = ( ( _xBExp + _FLIP_BIAS ) >> 1 ); 

/*---------------------------------------------------------------
  Early exit in case of trivial computation (operand is zero).
  ---------------------------------------------------------------*/

  if( !_xBExp )
    return _rSign;

/*------------------------------------------------------------------------------------
  Brief description of the square root implementation for ST220/ST231.
  The root "sqrt(_xMant)" where 1 <= _xMant < 2, is obtained in 3 following steps.
  Step 1: Obtain an approximation of "sqrt(1 / _xMant)" through a degree 3 polynomial.
  Step 2: Obtain the root by performing 1 iteration of Goldschmidt algorithm.
  Step 3: If the exponent is odd "_xMant" falls into different binade 2 <= _xMant < 4.
          This last step consists of multiplying sqrt(2) with the root obtained in
          step 2, if required and correcting the last bit in order to prepare the root
          for final rounding.
-------------------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------------------
  All the variables and intermediate values are encoded on a 32 bits register. 
  Initially _xMant is stored as 1.X...X00...0 (1,23). This is a machine interpretation
  that shows the position of the decimal point of each value. In (I,F) I is the no. of
  integral bits and F, the no. of significant fractional bits. The point is placed at
  the best possible position in order to have guard bits (prevent loss of precision)
  on the right and to avoid overflow on the left.
-------------------------------------------------------------------------------------*/

  _xMant = _xMant << 8;

/*---------------------------------------------------------------------------------------
  Step1: Brief description of the degree 3 polynomial evaluation.
  To have a more accurate approximation of "sqrt(1/_xMant)", (u2 - u3*N)*N^2 + u0 - u1*N
  where N = _xMant is evaluated with either of the 2 different sets of coefficients.
  The first set is chosen when 1 <= N < 3/2 and for 3/2 <= N < 2, second set is chosen.
  The machine interpretation is shown in comments after every coefficient and variables
  of intermediate operations.
---------------------------------------------------------------------------------------*/

  // Polynomial coeffcients as hexadecimal constants.

  if( _xMant < 0xC0000000 )  // First set if 1 <= _yMant (01.0X...X0...0) < 3/2.
    {
      _cst_u0 = 0x7EBB70F3;  // 1.9801905... = 01.111110...    (2,30).
      _cst_u1 = 0xCEA191B7;  // 1.6143057... =  1.1001110...   (1,31).
      _cst_u2 = 0x64616C1D;  //  .7842230... =  0.11001000...  (1,31).
      _cst_u3 = 0x2670DEC4;  //  .1501597... =   .001001100... (0,32).
    }
  else                       // Second set if 3/2 <= _yMant (01.1X...X0...0 ) < 2.
    {
      _cst_u0 = 0x6A792F8B;  // 1.6636465... = 01.101010...    (2,30).
      _cst_u1 = 0x7AD95CE2;  //  .9597583... =  0.1111010...   (1,31).
      _cst_u2 = 0x2A606850;  //  .3310671... =  0.01010100...  (1,31).
      _cst_u3 = 0x0B8FCA7D;  //  .0451628... =   .000010111... (0,32).
    }

/*---------------------------------------------------------------------------
  The multiplication is performed using an intrinsic function "__mulhhuw"
  which returns top 32 bits of the 64-bit product obtained from an unsigned 
  32 * 32 multiplication. 
---------------------------------------------------------------------------*/

  _poly_term_1 = _flip_32h_umul_32_32( _xMant, _cst_u3 );  // 0.XX...X (1,31).

  _xMant_sqr = _flip_32h_umul_32_32( _xMant, _xMant );  // XX.XX...X (2,30).

  _poly_term_1 = _flip_32h_umul_32_32( ( _cst_u2 - _poly_term_1 ), _xMant_sqr ) << 1;  // 01.XX...X0 (2,29). 

  _poly_term_2 = _cst_u0 - _flip_32h_umul_32_32( _xMant, _cst_u1 );  // XX.XX...X (2,30).

/*----------------------------------------------------------------------------------
  Finally, the polynomial is evaluated by adding the 2 terms which can easily be
  added. After that, it is shifted left get to rid of zeros.
----------------------------------------------------------------------------------*/

  _poly_approx = _poly_term_1 + _poly_term_2;  // 00.XX...X (2,30).
  _poly_approx = _poly_approx << 2;  // .XX...X00 (0,30).

/*-----------------------------------------------
  Step 2: Prepare for Goldschmidt iteration.
-----------------------------------------------*/

/*----------------------------------------------------------------------------------
  The above approximation (denote M ~ sqrt(1/N)) is accurate upto 14+ bits, that is
  1 - 2^14 < z = N*(M^2) < 1 + 2^14.
----------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
  Brief description of the Goldschmidt algorithm.
  To find root R = sqrt(N), Goldschmidt algorithm tries to to compute
  "z = N * (M^2)" which is closer to 1. It refines z and "w1 = M" by by taking
  them more closer to 1 and root respectively after performing 1 more iteration.
-------------------------------------------------------------------------------*/

  _z_1 = _flip_32h_umul_32_32( _xMant, _flip_32h_umul_32_32( _poly_approx, _poly_approx ) ) >> 1;  // 0X.XX...X (2,30).

  _w_1 = _flip_32h_umul_32_32( _xMant, _poly_approx );  // 1.XX...X (1,31).

/*----------------------------------------------------------------------------
  In the first iteration, w2 is obtained as "w2 = w1 * (3 - z1)/2" which is a
  more precise square root.
----------------------------------------------------------------------------*/

  _w_2 = _flip_32h_umul_32_32( _w_1, ( 0xC0000000 - _z_1 ) ) << 1;  // 1.XX...X (1,31).

/*--------------------------------------------------------------------------------
  Step 3:
  This last step consists of multiplying "sqrt(2)" (0xB504F333 = 1.011...1 (1,31))
  with the root obtained above if unbiased exponent is odd. The last bit is
  corrected by verifying whether "(_rMant)^2 >= _xMant".
--------------------------------------------------------------------------------*/

  if( ( _xBExp & 0x1 ) == 1 )
    {
      _rMant = ( _w_2 + 0x00000040 ) >> 7;

      if( ( _flip_32h_umul_32_32( _rMant << 7, _rMant << 7 ) << 1 ) >= _xMant )
	_rMant = _rMant - 1;
    }
  else
    {
      _w_2 = _flip_32h_umul_32_32( _w_2, 0xB504F333 ) << 1;
      _rMant = ( _w_2 + 0x00000040 ) >> 7;

      if( _flip_32h_umul_32_32( _rMant << 7, _rMant << 7 ) >= _xMant )
	_rMant = _rMant - 1;

    }

/*---------------------------------------------------------------------------
  In square root sticky bit is only required when rounding mode is +inf/-inf.
  For round-to-nearest tie case can never occur. We can always assume sticky
  bit as 1 since it is useful when the guard bit is 1 and does not harm when
  it is 0.
  --------------------------------------------------------------------------*/

  _rMant = ( _rMant << 1 ) | ( 0x1 );

/*-------------------------------------------------------------------------
  26-bit mantissa is rounded.
  -------------------------------------------------------------------------*/

  _rnd = _rMant & 0x3;
  _rMant = ( ( ( _rMant + 0x2 ) >> 2 ) & ( ( ~( _rnd & 0x2 ) >> 1 ) | _rnd ) );


/*--------------------------------------------------------------------------
  Special values (NaN, Inf) verification and return NaN for negative values.
  -------------------------------------------------------------------------*/
  
  if( _x > 0x80000000 )
    return _flip_declare_nan();

  if( _xBExp == 0xFF )
    return _x;

/*------------------
  Pack the 3 parts.
------------------*/

  return _rSign | ( _rBExp << _FLIP_MANT_SIZE ) | ( _rMant & 0x7FFFFF );
}


