#include "stdafx.h"
#include "automat.h"

enum autStat nxtSts[Se+1][sgE+1] =
{//	   dlm,rtl
	{S0,S3,S5,S7},	//для S0
	{S1,S5,S4,S2},	//	S1
	{S1,S4,S2,S3},	//	S2
	{S1,S8,S4,S2},	//	S3
	{S1,S6,S5,S5},
	{S1,S4,S5,S4},	//	S5
	{S1,S4,S6,S5},
	{S1,S5,S4,S4},
	{S1,S4,S6,S5},	//	S8
	{Se,Se,Se,Se}	//	Se
};

enum autStat nxtStat(enum autSgn sgn)
{
	static enum autStat s=S0;// поточний стан лексеми
	return s=nxtSts[s][sgn];// новий стан лексеми
}
