#ifndef __FLIP_INTERFACE_H
#define __FLIP_INTERFACE_H

/* ---------------------------------------------------------------- */
/** 
\file flip_interface.h
\brief FLIP interface with targets.
*/

#define __LIBFP_INLINE 
#define __LIBFP_EXPORT_SHORT_NAMES 
#define __LIBFP_USE_LZCNT 
#define __LIBFP_INLINE_INSTUBS

/// Current types are based on the ST library.
#include <fptypes.h>
#include <__fpsupport.h>
#include <fpmodels.h>

/* ---------------------------------------------------------------- */

// FIXME keep in here in final version ???

/// Several views of the same word for debug purpose.
typedef union 
{
  float32       f32; ///< View the value as a \b float32 value
  float         f;   ///< View the value as a standard \b float value
  unsigned int  i;   ///< View the value as an \b unsigned \b integer value
} cfloat; 


/* ---------------------------------------------------------------- */
#endif // __FLIP_INTERFACE_H

