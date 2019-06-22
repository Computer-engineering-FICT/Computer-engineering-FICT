#include "stdafx.h"
#include "automat.h"

enum autStat nxtSts[S6+1][ltr+1] =
{
	{S1, S0, S0},
	{S2, S1, S1},
	{S3, S2, S2},
	{S4, S3, S3},
	{S5, S4, S4},
	{S6, S5, S2},
	{S0, S6, S6}
};

enum autStat nxtStat(enum autSgn sgn)
{
	static enum autStat s=S0;// поточний стан лексеми
	return s=nxtSts[s][sgn];// новий стан лексеми
}
