#ifndef __FLIP_H
#define __FLIP_H

/* ---------------------------------------------------------------- */
/** 
\file flip.h
\brief FLIP main header (user level definitions).

This file contains all the user level informations about FLIP. This is
the only file required to compile programs based on FLIP.
    
Specificaly, it contains:
\li Types definition
\li Global variables definition
\li Functions declaration
*/


/* ---------------------------------------------------------------- */
// TYPE DEFINITIONS

/// Types depends on the target
#include "flip_interface.h"

/* ---------------------------------------------------------------- */
// ROUDING MODES

/// Defines the 4 possible IEEE rounding modes.
typedef enum 
{
  FLIP_RN, ///< Rounding to nearest (default mode)
  FLIP_RU, ///< Rounding up
  FLIP_RD, ///< Rounding down
  FLIP_RZ  ///< Rounding to zero
} flip_rnd_mode_t;

/// Active rounding mode register.
extern flip_rnd_mode_t flip_rnd_mode;

/// Set the active rounding mode.
inline void flip_set_rnd_mode(flip_rnd_mode_t rnd);

/* ---------------------------------------------------------------- */
// EXCEPTIONS

/// Defines the possible execptions.
typedef enum 
{
  FLIP_EXPT_OK ///< No execption.
} flip_execption_t;

/// \brief IEEE exceptions register.
extern flip_execption_t flip_status;


/* ---------------------------------------------------------------- */
// LOW-LEVEL OPERATIONS

// Returns (x + y).
float32 __float32_flip_add_float32_float32(float32 x, float32 y);

// Returns (x - y).
float32 __float32_flip_sub_float32_float32(float32 x, float32 y);

// Returns (x * y).
float32 __float32_flip_mul_float32_float32(float32 x, float32 y);

// Returns (x / y).
float32 __float32_flip_div_float32_float32(float32 x, float32 y);

// Returns sqrt(x).
float32 __float32_flip_sqrt_float32(float32 x);

#ifdef __HAS_FAST_OPERATIONS
// Returns (x * x).
float32 __float32_flip_sqr_float32(float32 x);

// Returns reciprocal (1 / y).
float32 __float32_flip_reciprocal_float32(float32 y);

// Returns reciprocal of the square root (1 / sqrt(x)).
float32 __float32_flip_invsqrt_float32(float32 x);

// Returns (xy + z).
float32 __float32_flip_fma_float32_float32_float32(float32 x, float32 y, float32 z);

// Returns (xy - z).
float32 __float32_flip_fms_float32_float32_float32(float32 x, float32 y, float32 z);
#endif // __HAS_FAST_OPERATIONS

/* ---------------------------------------------------------------- */
// SPECIFIC VALUES

#define FLIP_NaN   0x7FFFFFFF ///< IEEE coding of Not a Number (one the possible codings).
#define FLIP_ZERO  0x00000000 ///< IEEE coding of +0.
#define FLIP_MZERO 0x80000000 ///< IEEE coding of -0.
#define FLIP_INF   0x7F800000 ///< IEEE coding of +Infinity.
#define FLIP_MINF  0xFF800000 ///< IEEE coding of -Infinity.

/* ---------------------------------------------------------------- */
#endif // __FLIP_H

