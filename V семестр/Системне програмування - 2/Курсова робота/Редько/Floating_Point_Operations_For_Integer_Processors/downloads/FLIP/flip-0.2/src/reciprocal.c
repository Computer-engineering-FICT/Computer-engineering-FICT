/* ---------------------------------------------------------------- */
/**
\file reciprocal.c
\brief code for the reciprocal operation
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** \brief returns the reciprocal \a 1 / \a y
 
\a y should be a 32-bit floating-point number.
\addindex FPN

*/

/*---------------------------------------------------------------------------
  This implementation of computing the reciprocal can better be explained 
  as perfoming the division implemented in "fdiv_fast.c" with the dividend
  equals to 1. The division implementation is slightly modified while doing
  trivial computations, verifying special values and obtaining the first
  partial remainder.
  Moreover, implementation is done for two different processor cores, ST220
  and ST231. The approach adopted and the optimizations done for both
  processors are explained later. 
  The fully IEEE implementation is not supported, that is no "subnormals" 
  and rounding mode is fixed to "round-to-nearest-even". 
----------------------------------------------------------------------------*/

inline
float32 __float32_flip_reciprocal_float32(float32 y)
{
  float32 _y;
  bits32 _yFrac, _yMant;
  sbits32 _yBExp, _rBExp;
  bits32 _rMant, _rSign, _rnd;
  bits32 _z, _w0, _q;
  sbits32 _w1;
  bits32 _prod_quo_div;
  bits32 _cst_u3, _cst_u2, _cst_u1, _cst_u0; 
  bits32 _yMant_sqr, _poly_term_1, _poly_term_2, _poly_term_3, _poly_approx;

#ifdef __ST220__  // code specific for ST220

  bits32 _q1;
  sbits32 _w2, _q2, _q3;

#else // code specific for ST231

  bits32 _cst_u4, _cst_u5, _yMant_sqr_sqr, _z_compl, _shift_cst;

#endif

  _y = y;
  _yFrac = extractFloat32Frac( _y );             // Extract the 23-bit mantissa.
  _yBExp = ( sbits32 ) extractFloat32Exp( _y );  // Extract the biased exponent.

/*---------------------------------------------------------
  Implicit bit is added, if exponent = 0 the operand is 0.
---------------------------------------------------------*/

  _yMant = _yFrac | ( 1 << _FLIP_MANT_SIZE );

  _rBExp = 254 -_yBExp - ( _yFrac != 0 );     // Compute the exponent of the result.
  _rSign = _y & 0x80000000;                   // Compute the sign bit of the result.

/*---------------------------------------------------------------
  Early exit in case of trivial computation (operand is zero).
  ---------------------------------------------------------------*/

  if( !_yBExp )
    {
      return _flip_declare_infinity( _rSign );
    }

#ifdef __ST220__ // code specified for ST220

/*----------------------------------------------------------------------------------
  Brief description of the reciprocal implementation for ST220.
  The reciprocal "1 / _yMant" where 1 <= _yMant < 2, is performed in
  3 following steps for ST220.
  Step 1: Obtain an approximation of "1 / _yMant" through a degree 3 polynomial.
  Step 2: This approximation gives the first few bits of the reciprocal. Refine this
          reciprocal by 2 high-radix SRT iterations.
  Step 3: Correct the last bit of the reciprocal and prepare it for rounding.
          This step is common for both processors.
  Since there exist a 32 * 16 => 32 bits multiplier on ST220, the second operand is
  automatically truncated before multiplication.
-----------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------
  All the variables and intermediate values are encoded on a 32 bits register. 
  Initially _yMant is stored as 01.X...X00...0 (2,23). This is a machine
  interpretation that shows the position of the decimal point of each value. In (I,F)
  I is the no. of integral bits and F, the no. of significant fractional bits. 
  The point is placed at the best possible position in order to have guard bits 
  (prevent loss of precision) on the right and to avoid overflow on the left.
-----------------------------------------------------------------------------------*/

  _yMant = _yMant << 7;

/*-----------------------------------------------------------------------------------
  Step1: Brief description of the degree 3 polynomial evaluation.
  To have a more accurate approximation of "1 / _yMant", (u2 - u3*Y)*Y^2 + u0 - u1*Y
  where Y = _yMant is evaluated with either of the 2 different sets of coefficients.
  The first set is chosen when 1 <= _yMant < 3/2 and for 3/2 <= _yMant < 2, second
  set is chosen. The machine interpretation is shown in comments after every
  coefficient and variables of intermediate operations.
-----------------------------------------------------------------------------------*/

  if( _yMant < 0x60000000 )  // First set if 1 <= _yMant (01.0X...X0...0) < 3/2.
    {
      _cst_u0 = 0x0D219C5F;  // 3.2828341... = 000011.0100... (6,26).
      _cst_u1 = 0x40380000;  // 4.0136934... =   0100.0000... (4,28).
      _cst_u2 = 0x8AA16599;  // 2.1661067... =     10.0010... (2,30).
      _cst_u3 = 0x6F780000;  // 0.4354189... =       .0110... (0,32).
    }

  else                       // Second set if 3/2 <= _yMant (01.1X...X0...0 ) < 2.
    {
      _cst_u0 = 0x0942F40F;  // 2.3153857... = 000010.0101... (6,26).
      _cst_u1 = 0x200E0000;  // 2.0034469... =   0010.0000... (4,28).
      _cst_u2 = 0x3123BC04;  // 0.7678062... =     00.1100... (2,30).
      _cst_u3 = 0x1C270000;  // 0.1099684... =       .0001... (0,32).
    }

/*---------------------------------------------------------------
  The multiplication is performed using an intrinsic function
  "_flip_32h_smul_32_16" which returns top 32 bits of the 48-bit
  product obtained from a signed 32 * 16 multiplication.
---------------------------------------------------------------*/

  _poly_term_1 = _flip_32h_smul_32_16( _yMant, _cst_u3 );  // 00.X...X (2,30).

/*-------------------------------------------------------------------
  To compute "Y^2", Y must be truncated in order to use the existing
  multiplier. The truncated Y is of the form 01.XX...X0...0 (2,14).
-------------------------------------------------------------------*/

  _yMant_sqr = _flip_32h_smul_32_16( _yMant, _yMant );  // 00XX.X...X (4,28).

/*----------------------------------------------------------------------------
  Now, "Y^2" is multiplied by truncation of "u2 - u3*Y". Initially, its form
  is 0X.X...X (2,30) which becomes 0X.X...X0...0 (2,14) after truncation.
  Note that this subtraction is exact in this format.
----------------------------------------------------------------------------*/

  _poly_term_2 = _flip_32h_smul_32_16( _yMant_sqr, ( _cst_u2 - _poly_term_1 ) );  // 0000XX.X...X (6,26).

  _poly_term_3 = _flip_32h_smul_32_16( _yMant, _cst_u1 );  // 000XXX.X...X (6,26).

/*----------------------------------------------------------------------------------
  Finally, the polynomial is evaluated by adding the 3 terms which can easily be
  added. After that, it is shifted left get to rid of zeros.
----------------------------------------------------------------------------------*/

  _poly_approx = _cst_u0 - _poly_term_3 + _poly_term_2;  // 000000.1X...X (6,26).
  _poly_approx = _poly_approx << 5;                      // 0.1X...X00000 (1,26).

/*-----------------------------------------------
  Step 2: Prepare for high-radix SRT iterations.
-----------------------------------------------*/

/*--------------------------------------------------------------------------------
  The above approximation (denote M ~ 1/Y) is accurate upto 9+ bits, that is
  1 - 2^9 < z = Y*M < 1 + 2^9.
  Prescale "Y" (multiply by M) so that z approaches 1. M (denoted w0), the 
  initial reciprocal, is truncated to 16 bits. One can consider _yMant as the
  dividend and 1 as the divisor in order to follow the implementation of the
  high-radix SRT iterations in "fdiv_fast.c".
--------------------------------------------------------------------------------*/
	
  _z = _flip_32h_smul_32_16( _yMant, _poly_approx) << 1;  // 0X.X...X0       (2,29).
  _w0 = ( _poly_approx & 0xFFFF0000 ) >> 2;        // 000.1X...X0...0 (3,15).

/*-----------------------------------------------------------------------------
  To satisfy the requirements of the high-radix SRT algorithm w0 is divided by
  4 (w0 >> 2). Also an additional bit is required at the most significant 
  position to avoid any overflow. So assuming the form of w0 as 0.001X...X0...0
  the first 9 bits of the quotient are obtained as ROUND(2^9*w0 + 2^-1) which
  gives the integral bits. No need to shift w0 explicitly as the position of 
  the point is taken care of while rounding.
-----------------------------------------------------------------------------*/

  _q1 = ( _w0 + 0x00200000 ) & 0xFFC00000;  // 00XXXXXXXX.00...0 (10,0).

/*-----------------------------------------------------------------------------
  SRT iteration                        : w[j+1] = 2^9 * w[j] - q[j+1] * z.
  Quotient (reciporcal here) selection : q[j+1] = ROUND(2^9 * w[j] + 2^-1).
  Since q[j+1]*z is of the form 000XXXXXXXXX.X...X (12,20), 2^9*w[j] must be
  shifted right by 2 bits to have the point at the right position. Obviously,
  this shift will be adjusted for the next iteration by shifting w[j] by 11
  bits instead of 9 to left.
-----------------------------------------------------------------------------*/

/*------------------
  First iteration.
------------------*/

  _w1 = ( _w0 >> 2 ) - _flip_32h_smul_32_16( _z, _q1 );  // 000000000000.XX...X (12,20).
  _w1 = _w1 << 11;                                // 0.XX...X00000000000 ( 1,20).
  _q2 = ( _w1 + 0x00200000 ) & 0xFFC00000;        // 0XXXXXXXXX.00...0   (10, 0).

/*------------------
  Second iteration.
------------------*/

  _w2 = ( _w1 >> 2 ) - _flip_32h_smul_32_16( _z, _q2 );  // All as above. 
  _w2 = _w2 << 11;
  _q3 = ( _w2 + 0x00200000 ) & 0xFFC00000;

/*-------------------------------------------------------------------
  The final reciprocal is formed as shown below. It can be of 2 forms,
  0.01X...X or 0.001X...X depending on the dividend and the divisor.

  _q1: 0000X XXXXXXXXX00...0
  _q2: 00000 000000000XXXXXXXXX00...0
  _q3: 00000 000000000000000000XXXXXXXXX

   _q: 00000.0XXX.....................XX (5,27)
-------------------------------------------------------------------*/

  _q = ( _q1 >> 4 ) + ( _q2 >> 13 ) + ( _q3 >> 22 );

#else // code specified for ST231

/*----------------------------------------------------------------------------------
  Brief description of the division implementation for ST231.
  The reciprocal "1 / _yMant" where 1 <= _yMant < 2, is performed in
  3 following steps for ST220.
  Step 1: Obtain an approximation of "1 / _yMant" through a degree 5 polynomial.
  Step 2: This approximation gives the first few bits of the reciprocal. Refine this
          reciprocal by 2 high-radix SRT iterations.
  Step 3: Correct the last bit of the reciprocal and prepare it for rounding.
          This step is common for both processors.
-----------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------
  All the variables and intermediate values are encoded on a 32 bits register. 
  Initially _yMant is stored as 1.X...X00...0 (1,23). This is a machine 
  interpretation that shows the position of the decimal point of each value. 
  In (I,F) I is the no. of integral bits and F, the no. of significant fractional
   bits. The point is placed at the best possible position in order to have guard
   bits (prevent loss of precision) on the right and to avoid overflow on the left.
-----------------------------------------------------------------------------------*/

  _yMant = _yMant << 8;

/*-----------------------------------------------------------------------------------
  Step1: Brief description of the degree 5 polynomial evaluation.
  To have a more accurate approximation of "1 / _yMant", 
  (u4 - u5*Y)*Y^4 + (u2 - u3*Y)*Y^2 + u0 - u1*Y where Y = _yMant is evaluated with
  either of the 2 different sets of coefficients. The first set is chosen when
  1 <= _yMant < 3/2 and for 3/2 <= _yMant < 2, second set is chosen. The machine
  interpretation is shown in comments after every coefficient and variables of
  intermediate operations.
-----------------------------------------------------------------------------------*/

  if( _yMant < 0xC0000000 )  // First set if 1 <= _yMant (1.0X...X0...0) < 3/2.
    {
      _cst_u0 = 0x13A9CBBC;  // 4.9158162... = 000100.11...      (6,26).
      _cst_u1 = 0x503829C5;  // 10.027423... =  01010.000...     (5,27).
      _cst_u2 = 0xADD32DF9;  // 10.864057... =   1010.1101...    (4,28).
      _cst_u3 = 0xD30031B3;  // 6.5937736... =    110.10011...   (3,29).
      _cst_u4 = 0x880B9496;  // 2.1257068... =     10.001000...  (2,30).
      _cst_u5 = 0x2466BBF6;  // 0.2843851... =      0.0100100... (1,31). 
      _shift_cst = 5;        // Shift final approximation left to get rid of 0's.
    }
  else                       // Second set if 3/2 <= _yMant (1.1X...X0...0 ) < 2.
    {
      _cst_u0 = 0x1BC2BBC2;  // 3.4700846... = 00011.011...     (5,27).
      _cst_u1 = 0x501C42DC;  // 5.0068997... =  0101.0000...    (4,28).
      _cst_u2 = 0x7B0A4354;  // 3.8450028... =   011.11011...   (3,29).
      _cst_u3 = 0x6A142F53;  // 1.6574819... =    01.101010...  (2,30).
      _cst_u4 = 0x30AD0BD9;  // 0.3802809... =      .0000100... (0,32).
      _cst_u5 = 0x094998D5;  // 0.0362792...
      _shift_cst = 4;
    }

/*----------------------------------------------------------------------------------
  The multiplication is performed using an intrinsic function "_flip_32h_umul_32_32"
  which returns top 32 bits of the 64-bit product obtained from an unsigned 
  32 * 32 multiplication. Note that after every operation, the first machine
  interpretation belongs to the first set of coefficients while the second
  comes when evaluation is done with the second set (in the comments).
-----------------------------------------------------------------------------------*/

  _poly_term_1 = _flip_32h_umul_32_32( _yMant, _cst_u5 );  // 00.X...X (2,30) ## 0.X...X (1,31).

  _yMant_sqr = _flip_32h_umul_32_32( _yMant, _yMant );  // XX.X...X (2,30) ## same.

  _yMant_sqr_sqr = _flip_32h_umul_32_32( _yMant_sqr, _yMant_sqr );  // XXXX.X...X (4,28) ## same.

/*--------------------------------------------------------------------------------
  Here 2 operations are performed, "u4 - u5*Y" which has the form 0X.X...X (2,30)
  for the first set and X.X...X (1,31) for the second set. After multiplying with
  Y^4, for the first set the form is 0XXXXX.X...X (6,26) and XXXXX.X...X (5,27)
  for the second set.
--------------------------------------------------------------------------------*/

  _poly_term_1 = _flip_32h_umul_32_32( _yMant_sqr_sqr, ( _cst_u4 - _poly_term_1 ) );

/*-------------------------------------------------------------------------------
  Here 3 operations are performed, "u3*Y", "u2 - u3*Y" and "(u2 - u3*Y)*Y^2" and
  the final form is XXXXXX.X...X (6,26) for the first set and XXXXX.X...X (5,27)
  for the second set.
-------------------------------------------------------------------------------*/

  _poly_term_2 = _flip_32h_umul_32_32( _yMant_sqr, ( _cst_u2 - _flip_32h_umul_32_32( _yMant, _cst_u3 ) ) );

  _poly_term_3 = _cst_u0 - ( _flip_32h_umul_32_32( _yMant, _cst_u1 ) );  // XXXXXX.X...X (6,26) ## XXXXX.X...X (5,27).

/*---------------------------------------------------------------------------------
  Finally, the polynomial is evaluated by adding the 3 terms which can easily be
  added. After that, it is shifted left get to rid of zeros.
----------------------------------------------------------------------------------*/

  _poly_approx = _poly_term_1 + _poly_term_2 + _poly_term_3;  // 000000.1X...X (6,26) ## 00000.1X...X (5,27).
  _poly_approx = _poly_approx << _shift_cst;                  // 0.1X...X00000 (1,26) ## 0.1X...X0000 (1,27).

/*-----------------------------------------------
  Step 2: Prepare for Goldschmidt iteration.
-----------------------------------------------*/

/*------------------------------------------------------------------------------
  The above approximation (denote M ~ 1/Y) is accurate upto 16+ bits, that is
  1 - 2^16 < z = Y*M < 1 + 2^16.
  Prescale "Y" (multiply by M) so that z approaches 1. M (denoted w0), is the 
  initial reciprocal. One can consider _yMant as the dividend and 1 as the
  divisor in order to follow the implementation of the Goldschmidt iterations
  in "fdiv_fast.c".
------------------------------------------------------------------------------*/

  _z = _flip_32h_umul_32_32( _yMant, _poly_approx);  // 0X.XX...X (2,30).

  _w0 = _poly_approx;  // See above.

/*-------------------------------------------------------------------------------------
  Brief description of the Goldschmidt algorithm.
  To find quotient (reciprocal here) q = 1 / _yMant (1/Y), Goldschmidt algorithm tries
  to find a sequence K1, K2, K3... such that Y*K1*K2*...*Ki approaches 1 as i goes
  infinity.  Hence, qi = 1*K1*K2*...Ki approaches q. Here, computing K1 and K2 allows
  to have a reciprocal of required precision (25 bits). After finding K1,
  if Y*K1 = 1 - eps, select K2 = 1 + eps, which gives Y*K1*K2 = 1 - eps^2. 
  So, K1*K2 is now more closer to q than K1.
-------------------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------------------
  The above approximation gives K1 = M which is multiplied by the divisor (Y*K1) above
  in the prescaling step. Perform the first iteration of Goldschmidt and compute
  K2 = 1 + 1 - Y*K1 (2's complement). Obtain the new divisor (approaches 1) and the
  new reciprocal (approaches q) with greater precision.
-------------------------------------------------------------------------------------*/

  _z_compl = 0x80000000 - _z;            // 0X.XX...XX (2,30).
  _w1 = _flip_32h_umul_32_32( _w0, _z_compl ) << 1;  // 0X.XX...X0 (2,29).

/*---------------------------------------------------------------------------------
  The final reciprocal is obtained as ROUND(2^25*_w1 + 2^-1). There can be 2 forms of
  _w0, 00.1X...X0 or 01.XX...X0, depending on whether divisor >= 1.
----------------------------------------------------------------------------------*/

  _q = ( _w1 + 0x10 ) >> 5;  // 00000 0X.XX...X (7,25).
  _yMant = _yMant >> 1;

#endif  //__ST220__

/*----------------------------------------------------------------------------------
  Either of the implementation gives a 27-bit reciprocal (first 2 bits are always 0)
  and so a 25-bit normalized reciprocal is obtained as required.
----------------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------------
  Step3:
  Correct last bit for final rounding (round-to-nearest-even) of the reciprocal is
  obtained by verifying whether _yMant * _q >= 1. Since _yMant and _q are of 24 
  and 25 bits, a full width multiplication (32*32 => 32 bits) is performed.
  This step is executed nearly 4 times faster on ST231 than on ST220.
--------------------------------------------------------------------------------*/

  _prod_quo_div = _flip_32h_umul_32_32( ( _yMant << 1 ), ( _q << 6 ) );

  if( _prod_quo_div >= 0x40000000 )
    _q = _q - 1;  // Last bit correction.

/*------------------------------------------------------------------------------
  In division (1/Y) sticky bit is only required when rounding mode is +inf/-inf.
  For round-to-nearest tie case can never occur. We can always assume sticky
  bit as 1 since it is useful when the guard bit is 1 and does not harm when
  it is 0.
  ----------------------------------------------------------------------------*/

  _rMant = ( _q << 1 ) | 0x1;

/*---------------------------
  26-bit mantissa is rounded.
----------------------------*/

  _rnd = _rMant & 0x3;
  _rMant = ( ( ( _rMant + 0x2 ) >> 2 ) & ( ( ~( _rnd & 0x2 ) >> 1 ) | _rnd ) );

/*-------------------------------------------------------------------
  Special values (NaN, Inf) verification through a single comparison.
  ------------------------------------------------------------------*/

  if( _yBExp == 0xFF )
    {
      if( _yFrac )
	{
	  return _flip_declare_nan();
	}
      return _flip_declare_zero( _rSign );
    }

/*--------------------------------------------------------------------------
  For quasi IEEE mode when the final exponent <= 0, result is flushed to
  0 except for the border case 0x00FFFFFF which is promoted to next higher
  FP no., that is, the smallest "normalized" number.
  --------------------------------------------------------------------------*/

  if( _rBExp <= 0 )
    {
      if( ( _rBExp | _rMant ) == 0x00FFFFFF )
	{
	  return _rSign | 0x00800000;
	}
      return _rSign;
    }

/*-------------------------------------------------------------------------
  Check overflow and pack the 2 parts (mantissa and exponent) into 
  a single 32-bit integer with the sign added later.
  -------------------------------------------------------------------------*/

  _rMant = _flip_overflow_join( _rMant, _rBExp, _rSign );
  return _rSign | _rMant;
}  
