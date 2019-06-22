/* ---------------------------------------------------------------- */
/** 
\file interface.c
\brief Interface between FLIP and ST tools.

The  ST200 compiler requires  specific binding  functions in  order to
call FLIP functions as operations on standard floating-point types.

By default, the basic ST C library includes such binding functions. 
In order to use the FLIP functions instead, one has to link the object
files with the FLIP library.

\par Example:

the two-line code 
\code
float a, b, s;
s = a + b;
\endcode
is converted by the compiler to 
\code
float a, b, s;
s = __fadds(a, b);
\endcode

See also the \ref pgexample page.

*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/* ---------------------------------------------------------------- */

/** \brief binding function for the addition of 2 FP numbers (using ST compiler support only).

*/
float __adds(float x, float y)
{
  float32 _x, _y, _r;

  _x = *(float32 *)&x;
  _y = *(float32 *)&y;
  _r = __float32_flip_add_float32_float32(_x, _y);
  return *(float *)&_r;
}

/* ---------------------------------------------------------------- */

/** \brief binding function for the subtraction of 2 FP numbers (using ST compiler support only).

*/
float __subs(float x, float y)
{
  float32 _x, _y, _r;

  _x = *(float32 *)&x;
  _y = *(float32 *)&y;
  _r = __float32_flip_sub_float32_float32(_x, _y);
  return *(float *)&_r;
}

/* ---------------------------------------------------------------- */

/** \brief binding function for the multiplication of 2 FP numbers (using ST compiler support only).

*/
float __muls(float x, float y)
{
  float32 _x, _y, _r;

  _x = *(float32 *)&x;
  _y = *(float32 *)&y;
  _r = __float32_flip_mul_float32_float32(_x, _y);
  return *(float *)&_r;
}

/* ---------------------------------------------------------------- */

/** \brief binding function for the division of 2 FP numbers (using ST compiler support only).

*/
float __divs(float x, float y)
{
  float32 _x, _y, _r;

  _x = *(float32 *)&x;
  _y = *(float32 *)&y;
  _r = __float32_flip_div_float32_float32(_x, _y);
  return *(float *)&_r;
}

/* ---------------------------------------------------------------- */

/** \brief binding function for the square root of 1 FP number (using ST compiler support only).

*/
float __sqrts(float x)
{
  float32 _x, _r;

  _x = *(float32 *)&x;
  _r = __float32_flip_sqrt_float32(_x);
  return *(float *)&_r;
}

/* ---------------------------------------------------------------- */
