/* ---------------------------------------------------------------- */
/** 
\file fsub.c
\brief Code for the subtraction operation.
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** 
\brief FP \b subtraction operation: returns \f$ x - y \f$.

\param x is the minuend (32-bit FPN)
\param y is the subtrahend (32-bit FPN)

\addindex FPN

*/
// NEW VERSION  WITHOUT DENORMAL
// Subtraction operation x - y can always be changed to an addition x + (-y) by changing the sign of the second operand.

inline   
float32 __float32_flip_sub_float32_float32( float32 x, float32 y )
{
  float32 _x, _y;

  _x = x;
  _y = y;
  _y = _y ^ 0x80000000;  // Changing the sign and calling the function for addition.
  return __float32_flip_add_float32_float32( _x, _y );
}
