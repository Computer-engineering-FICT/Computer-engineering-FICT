/* ---------------------------------------------------------------- */
/** 
\file fms.c
\brief Code for the fused multiply and subtract operation.
*/
/* ---------------------------------------------------------------- */

#include "flip.h"
#include "internal/internal.h"

/** 
\brief FP \b fused multiply and subtract operation: returns \f$ x \times y - z \f$.

\param x is the multiplicand (32-bit FPN)
\param y is the multiplier (32-bit FPN)
\param z is the addend (32-bit FPN)
\addindex FPN

*/

/*-------------------------------------------------------------------------------
  This is a implementation of fused multiply and sub operation which computes
  "x * y - z". After changing the sign of the third operand, it calls the
  "__float32_flip_fma_float32_float32_float32()" function.
-------------------------------------------------------------------------------*/

inline
float32 __float32_flip_fms_float32_float32_float32( float32 x, float32 y, float32 z )
{
  z = z ^ 0x80000000 ;
  return __float32_flip_fma_float32_float32_float32( x, y, z );
}

