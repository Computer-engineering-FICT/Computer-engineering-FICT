#ifndef __FLIP_INTERNAL_PRODUCT_H
#define __FLIP_INTERNAL_PRODUCT_H

/* ---------------------------------------------------------------- */
/** 
\file internal/product.h
\brief FLIP internal definitions for product computation.

\warning This file is included into flip.h, it can not be called alone.

*/
/* ---------------------------------------------------------------- */

/** 
\brief Return the product of the two 24-bit mantissa including the sticky bit

\param xMant is the 24-bit multiplicand mantissa (integer representation)
\param yMant is the 24-bit multiplier mantissa (integer representation)

\warning 
The least significant bit includes (by oring) the sticky bit 
corresponding to the dropped part of the product.

*/
inline static 
sbits32 _flip_mul_mant_with_sticky( sbits32 xMant, sbits32 yMant )
{
  sbits32 _r;
  bits32 _xMant_h, _xMant_l; // higher and lower part of x 
  bits32 _yMant_h, _yMant_l; // higher and lower part of y

  bits32 _xhyh, _xhyl, _xlyh, _xlyl; // the 4 intermediate products

  bits32 _xym; // the middle part of the product

  // extract higher and lower part of x and y
  _xMant_l = xMant & 0xFFFF;
  _yMant_l = yMant & 0xFFFF;
  _xMant_h = xMant >> 16; // shift as unsigned values
  _yMant_h = yMant >> 16; // idem

  // apply a standard 4 products decomposition 
  _xlyl = _xMant_l * _yMant_l; 
  _xlyh = _xMant_l * _yMant_h; 
  _xhyl = _xMant_h * _yMant_l; 
  _xhyh = _xMant_h * _yMant_h; 

  // sum up the two 'middle' products
  _xym = _xlyh + _xhyl;

  // sum up with the other 
  _r = ( _xym + ( _xlyl >> 16 ) + ( _xhyh << 16 ) );

  // insert the sticky bit at the least significant bit
  _r |= ( ( _xlyl & 0xFFFF ) > 0 );

 return _r;
}


/*----------------------------------------------------------------------------
  Returns 32 bits (higher part) of 64-bit product of 2 unsigned 32-bit values.
-----------------------------------------------------------------------------*/

inline static
uint32 _flip_32h_umul_32_32(uint32 a, uint32 b)  // __mulhuw()
{ 
  uint64 t0 = a;
  uint64 t1 = b;
  uint64 t2 = ( t0 * t1 ) >> 32;
  return t2;
}

/*-------------------------------------------------------------------------------------
  Returns 32 bits (higher part) of 48-bit product of 2 signed 32-bit and 16-bit values.
--------------------------------------------------------------------------------------*/

inline static 
int32 _flip_32h_smul_32_16(int32 a, int32 b)  // __st220mulhhs()
{ 
  int64 t0 = a;
  int64 t1 = b;
  int64 t2 = ( t0 * ( t1 >> 16 ) ) >> 16;
  return t2;
}

/*----------------------------------------------------
  Returns 64-bit product of 2 unsigned 32-bit values.
----------------------------------------------------*/

inline static
uint64 _flip_64_umul_32_32(uint32 a, uint32 b)  // __mulun()
{
  uint64 t0 = a;
  uint64 t1 = b;
  return t0 * t1;
}

/* ---------------------------------------------------------------- */
#endif // __FLIP_INTERNAL_PRODUCT_H

