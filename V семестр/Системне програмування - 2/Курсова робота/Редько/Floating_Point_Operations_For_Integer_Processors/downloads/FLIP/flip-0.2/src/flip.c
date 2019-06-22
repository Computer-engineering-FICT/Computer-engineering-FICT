/* ---------------------------------------------------------------- */
/** 
\file flip.c
\brief Code of the simple user-level defintions.
*/
/* ---------------------------------------------------------------- */

#include "flip.h"

/* ---------------------------------------------------------------- */
/// GLOBAL VARIABLE INITIALIZATION

/// Set default rounding mode to rounding to nearest.
flip_rnd_mode_t flip_rnd_mode = FLIP_RN;

/// Set default value in the execption register.
flip_execption_t flip_status  = FLIP_EXPT_OK;

inline void flip_set_rnd_mode(flip_rnd_mode_t rnd)
{
  // FIXME strict value checking (ifdef condition testing)
  flip_rnd_mode = rnd;
}

/* ---------------------------------------------------------------- */


