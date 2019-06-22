#include "flip.h"
#include "internal/internal.h"

/* ---------------------------------------------------------------- */

/** \brief addition of 2 FP numbers (for compiler support only).

*/

float __adds( float x, float y )
{
  cfloat _x, _y, _r;
  _x.f = x;
  _y.f = y;
  _r.f32 =  __float32_flip_add_float32_float32( _x.f32, _y.f32 );
  return _r.f;
}

/* ---------------------------------------------------------------- */

/** \brief subtraction of 2 FP numbers (for compiler support only).

*/

float __subs( float x, float y )
{
  cfloat _x, _y, _r;
  _x.f = x;
  _y.f = y;
  _r.f32 =  __float32_flip_sub_float32_float32( _x.f32, _y.f32 );
  return _r.f;
}

/* ---------------------------------------------------------------- */

/** \brief multiplication of 2 FP numbers (for compiler support only).

*/

float __muls( float x, float y )
{
  cfloat _x, _y, _r;
  _x.f = x;
  _y.f = y;
  _r.f32 =  __float32_flip_mul_float32_float32( _x.f32, _y.f32 );
  return _r.f;
}

/* ---------------------------------------------------------------- */

/** \brief division of 2 FP numbers (for compiler support only).

*/

float __divs( float x, float y )
{
  cfloat _x, _y, _r;
  _x.f = x;
  _y.f = y;
  _r.f32 =  __float32_flip_div_float32_float32( _x.f32, _y.f32 );
  return _r.f;
}

/* ---------------------------------------------------------------- */

/** \brief square root of 1 FP number (for compiler support only).

*/

float __sqrts( float x )
{
  cfloat _x, _r;
  _x.f = x;
  _r.f32 =  __float32_flip_sqrt_float32( _x.f32 );
  return _r.f;
}

/* ---------------------------------------------------------------- */

/** \brief square of 1 FP number (for compiler support only).

*/

#ifdef __HAS_FAST_OPERATIONS
float __sqrs( float x )
{
  cfloat _x, _r;
  _x.f = x;
  _r.f32 =  __float32_flip_sqr_float32( _x.f32 );
  return _r.f;
}
#endif // __HAS_FAST_OPERATIONS

/* ---------------------------------------------------------------- */

/** \brief reciprocal of 1 FP number (for compiler support only).

*/

#ifdef __HAS_FAST_OPERATIONS
float __reciprocals( float x )
{
  cfloat _x, _r;
  _x.f = x;
  _r.f32 =  __float32_flip_reciprocal_float32( _x.f32 );
  return _r.f;
}
#endif // __HAS_FAST_OPERATIONS

/* ---------------------------------------------------------------- */

/** \brief reciprocal of the square root of 1 FP number (for compiler support only).

*/

#ifdef __HAS_FAST_OPERATIONS
float __invsqrts( float x )
{
  cfloat _x, _r;
  _x.f = x;
  _r.f32 =  __float32_flip_invsqrt_float32( _x.f32 );
  return _r.f;
}
#endif // __HAS_FAST_OPERATIONS


/* ---------------------------------------------------------------- */

/** \brief fused multiply and add operation (xy + z) with 3 FP operands (for compiler support only).

*/

#ifdef __HAS_FAST_OPERATIONS
float __fmas( float x, float y, float z )
{
  cfloat _x, _y, _z, _r;
  _x.f = x;
  _y.f = y;
  _z.f = z;
  _r.f32 = __float32_flip_fma_float32_float32_float32( _x.f32, _y.f32, _z.f32 );
  return _r.f;
}
#endif // __HAS_FAST_OPERATIONS

/* ----------------------------------------------------------------- */

/** \brief fused multiply and subtract operation (xy - z) with 3 FP operands (for compiler support only).

*/

#ifdef __HAS_FAST_OPERATIONS
float __fmss( float x, float y, float z )
{
  cfloat _x, _y, _z, _r;
  _x.f = x;
  _y.f = y;
  _z.f = z;
  _r.f32 = __float32_flip_fms_float32_float32_float32( _x.f32, _y.f32, _z.f32 );
  return _r.f;
}
#endif // __HAS_FAST_OPERATIONS

/* ----------------------------------------------------------------- */

