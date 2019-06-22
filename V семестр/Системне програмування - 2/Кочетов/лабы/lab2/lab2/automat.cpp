#include "stdafx.h"
#include "automat.h"

enum autStat nxtSts[Se+1][ltr+1] =
{
	{S1, S1},
	{S2, S2},
	{S3, S3},
	{S3, S4},
	{S5, S5},
	{Se, S2},
	{Se, Se}
};

enum autStat nxtStat(enum autSgn sgn)
{
	static enum autStat s=S0;// поточний стан лексеми
	return s=nxtSts[s][sgn];// новий стан лексеми
}
