#ifndef __FLIP_INTERNAL_H
#define __FLIP_INTERNAL_H

/* ---------------------------------------------------------------- */
/** 
\file internal.h
\brief FLIP internal definitions.

This  file   contains  all  the  internal   FLIP  definitions.   Those
definitions  are only  required to  build FLIP.   They are  \b  NOT be
accessible at the user level.

*/
/* ---------------------------------------------------------------- */
// MACROS DEFINITION

/// Returns the \b maximum of the two operands \p x and \p y.
#define _FLIP_MAX(x,y) ( (x)>(y) ? (x) : (y) )

/// Returns the \b minimum of the two operands \p x and \p y.
#define _FLIP_MIN(x,y) ( (x)<(y) ? (x) : (y) )


/* ---------------------------------------------------------------- */
// CONSTANTS DEFINTION

#define _FLIP_EXP_SIZE 8   ///< \b Size of \b exponent in single precision numbers.
#define _FLIP_MANT_SIZE 23 ///< \b Size of \b mantissa in single precision numbers.
#define _FLIP_BIAS 127     ///< \b Bias of \b exponent in single precision numbers.

/* ---------------------------------------------------------------- */
// INTERMEDIATE FUNCTIONS DEFINITION

// DEVEL README: all functions declared using 'inline static'

#include "misc.h"
#include "rounding.h"
#include "product.h"


/* ---------------------------------------------------------------- */
#endif // __FLIP_INTERNAL_H

