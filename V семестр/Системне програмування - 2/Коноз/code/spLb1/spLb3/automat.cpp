#include "stdafx.h"
#include "automat.h"
//#include <stdio.h>
enum autStat nxtSts[Se+1][sgE+1] =
{{S0,S1,S2,S0,S0},	//для S0
 {S1,S1,S1,S2,Se},	//	S1
 {S1,S2,S2,S2,S0},	//	S2
 {S1,Se,Se,Se,S0},	//	Se
};
enum autStat nxtStat(enum autSgn sgn)
{static enum autStat s=S0;// поточний стан лексеми
 //printf("Se=%d sgE=%d\n",Se,sgE);
 return s=nxtSts[s][sgn];// новий стан лексеми
}
