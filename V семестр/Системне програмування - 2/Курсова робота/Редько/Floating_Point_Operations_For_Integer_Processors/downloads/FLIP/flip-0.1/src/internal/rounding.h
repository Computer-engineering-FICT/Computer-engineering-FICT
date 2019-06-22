#ifndef __FLIP_INTERNAL_ROUNDING_H
#define __FLIP_INTERNAL_ROUNDING_H

/* ---------------------------------------------------------------- */
/** 
\file internal/rounding.h
\brief FLIP internal definitions for rounding.
*/
/* ---------------------------------------------------------------- */

/** 
\brief \b Round the mantissa \a xMant according to the current rounding mode and \a xSign.

\param xMant is the 26-bit mantissa (1.X...X|XX) including guard and round bits (32-bit unsigned integer).
\param xSign represents sign of the result (32-bit unsigned integer).

*/

// For round to nearest 1 is added to guard bit and least significant bit
// of the mantissa (not the sticky bit) is corrected if there is a tie.
// For rounding towards +inf and -inf 1 is added both to guard and sticky bits
// correction is done using the sign bit.

inline static 
bits32 _flip_round( bits32 xMant, bits32 xSign )
{
  bits32 _rnd;
  _rnd = xMant & 0x3;

  if (flip_rnd_mode == FLIP_RN)
    {
      // round to nearest
      xMant = ( ( ( xMant + 0x2 ) >> 2 ) & ( ( ~( _rnd & 0x2 ) >> 1 ) | _rnd ) );
    }
  else
    if (flip_rnd_mode == FLIP_RU)
      {
	// round to +infinity
	xMant = ( xMant >> 2 ) + ( ( ( _rnd + 0x3 ) >> 2 ) & ( ~xSign >> 31 ) );
      }
    else
      if (flip_rnd_mode == FLIP_RD)
	{
	  // round to -infinity
	  xMant = ( xMant >> 2 ) + ( ( ( _rnd + 0x3 ) >> 2 ) & ( xSign >> 31 ) );
	}
      else
	if (flip_rnd_mode == FLIP_RZ)
	  {
	    // round to zero
	    xMant = ( xMant >> 2 );
	  }
	else
	  {
	    // other cases throw error ??? FIXME
	  }
  
  return xMant;
}

/* ---------------------------------------------------------------- */
#endif // __FLIP_INTERNAL_ROUDING_H

