#ifndef __FLIP_ISFUNC_H
#define __FLIP_ISFUNC_H

/* ---------------------------------------------------------------- */
/** \file flip_isfunc.h
    \brief FLIP test functions declarations.
*/
/* ---------------------------------------------------------------- */

#include "flip_interface.h"

/* ---------------------------------------------------------------- */

/** \brief Return 1 if \a x is NaN, return 0 else.
*/
inline int flip_isnan(float32 x)
{
  // First we get rid of the sign bit of x and if |x| > 0xFF000000
  // then x is NaN. Depending on whether the result of the 
  // subtraction represented in 2's complement is positive (0XX...X) 
  // or negative (1X...X), 0 or 1 is returned.

  return ( ( unsigned int ) ( 0xFF000000 - ( x << 1 ) ) ) >> 31;
}

/* ---------------------------------------------------------------- */

/** \brief Return 1 if \a x is \f$ \pm 0 \f$, return 0 else.
*/
inline int flip_iszero(float32 x)
{
  // First we get rid of the sign bit of x and if |x| < 0x00000001 
  // then x = +0/-0 and from the same argument above 0 or 1 is returned.

  return ( ( unsigned int ) ( ( x << 1 ) - 1 ) ) >> 31;
}

/* ---------------------------------------------------------------- */

/** \brief Return 1 if \a x is \f$ \pm \infty \f$, return 0 else.
*/
inline int flip_isinf(float32 x)
{
  // First we get rid of the sign bit of x and if |(|x| - 0xFF000000)| >= 1
  // then x is not equal to +inf/-inf. Only when x is +inf/-inf the final
  // result will be 11...1 (2's complement) and 1 is returned.

  return ( ( unsigned int ) ( abs( ( x << 1 ) - 0xFF000000 ) - 1 ) ) >> 31;
}

/* ---------------------------------------------------------------- */

/** \brief Return the sign (+1 or -1) of \a x.

This function returns 
\f$ \left\{
\begin{array}{cl}
+1 & \mbox{ if } x \geq 0 \\
-1 & \mbox{ if } x < 0
\end{array} \right.
\f$
This function returns 

\warning In case of a \e NaN argument, the returned value does not have any sense.
*/
inline int flip_sign(float32 x)
{
  // always 3 cycles without test
  return ( ( ((int) x) >> 31 ) & 0xFFFFFFFE ) + 1;  
}

/* ---------------------------------------------------------------- */
#endif // __FLIP_ISFUNC_H
