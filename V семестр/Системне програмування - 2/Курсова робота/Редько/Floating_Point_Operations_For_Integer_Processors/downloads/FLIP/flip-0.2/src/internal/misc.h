#ifndef __FLIP_INTERNAL_MISC_H
#define __FLIP_INTERNAL_MISC_H

/* ---------------------------------------------------------------- */
/** 
\file internal/misc.h
\brief FLIP internal miscellaneous definitions.
*/
/* ---------------------------------------------------------------- */


/** 
\brief This function gives 0 or 1 that will eventually be added to the previous exponent.

\param xMant is the 26-bit mantissa (1.X...X|XX) including guard and round bits (32-bit unsigned integer).
\param xSign represents sign of the result (32-bit unsigned integer).
\param cst_shift is a 32-bit integer constant which gives the shift amount.

\warning 
The parameter cst_shift is always 26 when computing only with normalized operands
but it may be equal to 25 or 26 when denormalized numbers are included.

*/

// The mantissa 1.11...1|11 changes to 10.00...0|00 after rounding and hence
// requires normalization. So we add 2 or 3 depending on the rounding mode to
// mantissa and shift by the value of cst_shift. The 1 generated at 27th
// position indicates an update of exponent and so 1 is returned.

#ifdef __HAS_ROUNDING_MODES

inline static 
bits32 _flip_detect_exp_update( bits32 xMant, bits32 xSign, bits32 cst_shift )
{
  bits32 _r;

  if (flip_rnd_mode == FLIP_RN)
    {
      // round to nearest
      _r = ( ( xMant + 0x2 ) >> cst_shift );
    }
  else  // For rounding towards +inf and -inf sign bit is also required.
    if (flip_rnd_mode == FLIP_RU)
      {
	// round to +infinity
	_r = ( ( ( xMant + 0x3 ) >> cst_shift ) & ( ~xSign >> 31 ) );
      }
    else
      if (flip_rnd_mode == FLIP_RD) 
	{
	  // round to -infinity
	  _r = ( ( ( xMant + 0x3 ) >> cst_shift ) & ( xSign >> 31 ) );
	}
      else
	if (flip_rnd_mode == FLIP_RZ)
	  {
	    // round to zero
	    _r = 0;
	  }
	else
	  {
	    // other cases throw error ??? FIXME
	  }

  return _r;
}

/* ---------------------------------------------------------------- */

/** 
\brief This function packs final exponent and mantissa into a 32-bit unsigned integer after checking for overflow.

\param xMant is the 24-bit rounded mantissa (32-bit unsigned integer).
\param xBExp is computed exponent (32-bit signed integer).
\param xSign represents sign of the result (32-bit unsigned integer).

*/

// This function makes xBExp = 255 if xBExp >= 255, else it resumes it 
// to its original value. All the mantissa bit are changed to 0 if 
// there is an overflow to represent mantissa part of infinity.

inline static
bits32 _flip_overflow_join( bits32 xMant, sbits32 xBExp, bits32 xSign )
{
  sbits32 _overflow;

  _overflow = xBExp - 255;
  xMant = xMant & ( _overflow >> 31 );
  xBExp = ( xBExp | ~( _overflow >> 31 ) ) & 0xFF;

  xMant = ( xBExp << _FLIP_MANT_SIZE ) | ( xMant & 0x007FFFFF );   // Joins the exponent part with the mantissa part.

  if (flip_rnd_mode == FLIP_RN)
    {
      // round to nearest
      return xMant;
    }
  else  // For rounding towards +inf and -inf sign bit is also required.
    if (flip_rnd_mode == FLIP_RU)
      {
	// round to +infinity
	xMant = xMant - ( ( xSign >> 31 ) & ~( _overflow >> 31 ) );
      }
    else
      if (flip_rnd_mode == FLIP_RD) 
	{
	  // round to -infinity
	  xMant = xMant - ( ( ~xSign >> 31 ) & ~( _overflow >> 31 ) );
	}
      else
	if (flip_rnd_mode == FLIP_RZ)
	  {
	    // round to zero
	    xMant = xMant - ( ( xBExp + 1 ) >> 8 );
	  }
	else
	  {
	    // other cases throw error ??? FIXME
	  }


  return xMant;
}

/* ---------------------------------------------------------------- */

/** 
\brief This function gives exponent and mantissa packed into a 32-bit unsigned integer assuming there is an underflow.

\param xSign represents sign of the result (32-bit unsigned integer).

\warning
For rounding towards +inf and -inf the result can be 0 or the smallest 
normalized number depending on the sign.
*/

inline static
bits32 _flip_underflow( bits32 xSign )
{
  bits32 _rMan;

  if (flip_rnd_mode == FLIP_RN)
    {
      // round to nearest
      _rMan = 0;
    }
  else  // For rounding towards +inf and -inf sign bit is also required.
    if (flip_rnd_mode == FLIP_RU)
      {
	// round to +infinity
	_rMan = ( ( 1 - ( xSign >> 31 ) ) << _FLIP_MANT_SIZE );
      }
    else
      if (flip_rnd_mode == FLIP_RD) 
	{
	  // round to -infinity
	  _rMan = xSign >> _FLIP_EXP_SIZE;
	}
      else
	if (flip_rnd_mode == FLIP_RZ)
	  {
	    // round to zero
	    _rMan = 0;
	  }
	else
	  {
	    // other cases throw error ??? FIXME
	  }

  return _rMan;
}

#else // Default mode is round-to-nearest.

inline static 
bits32 _flip_detect_exp_update( bits32 xMant, bits32 xSign, bits32 cst_shift )
{
  bits32 _r;


      // round to nearest
  _r = ( ( xMant + 0x2 ) >> cst_shift );

  return _r;
}

/* ---------------------------------------------------------------- */

/** 
\brief This function packs final exponent and mantissa into a 32-bit unsigned integer after checking for overflow.

\param xMant is the 24-bit rounded mantissa (32-bit unsigned integer).
\param xBExp is computed exponent (32-bit signed integer).
\param xSign represents sign of the result (32-bit unsigned integer).

*/

// This function makes xBExp = 255 if xBExp >= 255, else it resumes it 
// to its original value. All the mantissa bit are changed to 0 if 
// there is an overflow to represent mantissa part of infinity.

inline static
bits32 _flip_overflow_join( bits32 xMant, sbits32 xBExp, bits32 xSign )
{
  sbits32 _overflow;

  _overflow = xBExp - 255;
  xMant = xMant & ( _overflow >> 31 );
  xBExp = ( xBExp | ~( _overflow >> 31 ) ) & 0xFF;

  xMant = ( xBExp << _FLIP_MANT_SIZE ) | ( xMant & 0x007FFFFF );   // Joins the exponent part with the mantissa part.

      // round to nearest
      return xMant;
}

/* ---------------------------------------------------------------- */

/** 
\brief This function gives exponent and mantissa packed into a 32-bit unsigned integer assuming there is an underflow.

\param xSign represents sign of the result (32-bit unsigned integer).

\warning
For rounding towards +inf and -inf the result can be 0 or the smallest 
normalized number depending on the sign.
*/

inline static
bits32 _flip_underflow( bits32 xSign )
{
  bits32 _rMan;
      // round to nearest
  _rMan = 0;

  return _rMan;
}

#endif // __HAS_ROUNDING_MODES

/* ---------------------------------------------------------------- */

/** 
\brief This function returns one of the NaNs already defined, whenever there is an invalid operation.

*/
inline static
float32 _flip_declare_nan( void )
{
  return FLIP_NaN;
}

/* ---------------------------------------------------------------- */
/** 
\brief This function returns +inf or -inf after appending the sign.

\param xSign represents sign of the result (32-bit unsigned integer).
*/

inline static 
float32 _flip_declare_infinity( bits32 xSign )
{
  return xSign | 0x7F800000;   // Result is infinity.
}

/* ---------------------------------------------------------------- */
/** 
\brief This function returns +0 or -0.

\param xSign represents sign of the result (32-bit unsigned integer).
*/

inline static 
float32 _flip_declare_zero( bits32 xSign )
{
  return xSign;  // Result is zero.
}


/* ---------------------------------------------------------------- */
#endif // __FLIP_INTERNAL_MISC_H

