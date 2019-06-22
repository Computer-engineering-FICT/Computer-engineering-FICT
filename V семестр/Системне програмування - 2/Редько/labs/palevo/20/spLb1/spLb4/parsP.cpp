#include "stdafx.h"
#include "automat.h"
#include "tables.h"
#include "..\spLb3\parsP.cpp"
//char
enum tokType dlCdsP[256]= 
{_EOF,_nil,_nil,_nil, _nil,_nil,_nil,_nil, 
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,	//16
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,	//32
 _nil,_xmrk,_nil,_nil/*#*/, _nil/*$*/,_mod,_andB,_nil,
 _brkt,_bckt,_mul,_add, _comma,_sub,_fldDt,_div,	//48
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil, 
 _nil,_nil,_cln,_EOS, _lt,_eq,_gt,_qmrk,// 64
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//80
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_ixbr, _nil,_scbr,_xorB,_nil,//96
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//112
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_opbr, _orB,_ocbr,_invB,_nil,//128
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//144
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//160
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//176
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//192
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//208
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//224
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//240
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,//256
};
enum ltrType ltClsP[256] = 
{dlmaux,nc,nc,nc,nc,nc,nc,nc, nc,dlmaux,dlmeormr,nc,nc,dlmeormr,nc,nc, //16
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc,	//32
 dlmaux,dlmunop/*dlmgrop*/,ltrstrlm,dlmunop,
 ltrnmelm,dlmunop,dlmunop/*dlmgrop*/,ltrstrlm,
 dlmunop/*dlobrct*/,dlmunop/*dlcbrct*/,dlmunop,dlmgrop/*dlmunop до семантики*/,
 dlmunop/*dlmbrlst*/,dlmgrop,dlmunop/*dlmgrop*/,dlmgrop,	//48
 dgt,dgt,dgt,dgt,dgt,dgt,dgt,dgt, 
 dgt,dgt,dlmgrop,dlmunop/*dlmbrlst*/,dlmgrop,dlmunop,dlmgrop,dlmunop,// 64
 dlmunop,ltrhxdgt,ltrhxdgt,ltrhxdgt, ltrhxdgt,ltrexplt,ltrhxdgt,ltrnmelm,
 ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm, ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm,//80
 ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm, ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm,
 ltrtpcns/*ltrnmelm*/,ltrnmelm,ltrnmelm,dlmunop, ltrtrnfm,dlmunop,dlmunop,ltrnmelm,//96
 dlmunop,ltrhxdgt,ltrhxdgt,ltrhxdgt, ltrhxdgt,ltrexplt,ltrhxdgt,ltrnmelm,
 ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm, ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm,//112
 ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm, ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm,
 ltrtpcns/*ltrnmelm*/,ltrnmelm,ltrnmelm,dlmunop, dlmunop/*dlmgrop*/,dlmunop,dlmunop/*dlmgrop*/,nc//,128
//...
};
enum autStat nxtStsP[Eo+1][ltrcode+1] =	// for C/C++
{{Eu,Eu,Eu,Eu,Eu, Eu,Eu,Eu,S0,S2, S0,S2,S0,S0,S0, S0,S0,S0},		//0 для Eu
 {S1c,S1n,S1n,S1n,S1n, S1s,Soc,Eu,S0,S2, S0,S2,S0,S0,S0, S0,S0,S0},	//1 для S0 -> S0c
 {S1c,Ec,Ec,Ec,Ec, Ec,Soc,Eu,S2c,S2, S0,S2,S0,S0,S0, S0,S0,S0},		//2 для S1g
 {S1c,S1e,Ec,Ec,Ec, Ec,Soc,Eu,S2c,S2, S0,S2,S0,S0,S0, S0,S0,S0},	//3 для S1c
 {S2c,S1e,Ec,Ec,Ec, Ec,Soc,Eu,Ec,S2, S0,S2,S0,S0,S0, S0,S0,S0},		//4 для S2c
 {S1p,Ec,Ec,Ec,Ec, Ec,Soc,Eu,S0,S1q, S0,S2,S0,S0,S0, S0,S0,S0},		//5 для S1e
 {S1p,Ec,Ec,Ec,Ec, Ec,Soc,Eu,Ec,Ec, S0,S2,S0,S0,S0, S0,S0,S0},		//6 для S1q
 {S1p,Ec,Ec,Ec,Ec, Ec,Soc,Eu,S0,S2, S0,S2,S0,S0,S0, S0,S0,S0},		//7 для S1p
 {S1n,S1n,S1n,S1n,S1n, En,S1n,En,S0,S2, S0,S2,S0,S0,S0, S0,S0,S0},	//8 для S1n
 {S1s,S1s,S1s,S1s,S1s, S2s,S1t,S1s,S1s,S1s, S1s,S1s,S1s,S1s,S1s, S1s,S1s,S1s},//9 для S1s 
 {S1t,Ec,S1s,S1s,S1s, S2s,S1s,Ec,S0,S2, S0,S2,S0,S0,S0, S0,S0,S0},	//10 для S1t 
 {S1s,Ec,S1s,S1s,S1s, S1s,S1t,Ec,S0,S2, S0,S2,S0,S0,S0, S0,S0,S0},	//11 для S2s 
 {S1c,S1n,S1n,S1n,S1n, S1s,Soc,Eu,S0,S3, S0,S3,S0,S0,S0, S0,S0,S0},	//12 для S2 - Початковий елемент групового роздільника
 {S1c,S1n,S1n,S1n,S1n, S1s,Soc,Eu,S0,S3, S0,S3,S0,S0,S0, S0,S0,S0},	//13 для S3 - Наступний елемент групового роздільника
 {S0p,Ec,Ec,S0p,Ec,Ec,Ec,Ec, S0,S0,S0},			//14 для S3c 
 {S3c,Ec,Ec,S3c,Ec,Ec,Ec,Ec, S0,S0,S0},			//15 для S0p 
 {Soc,S3c,S3c,Ec,Ec,Ec,Ec,Eu, S2c,S0,S0},		//16 для Soc- Вісімковий код
 {Scr,Scr,Scr,Scr,Scr, Scr,Scr,Scr,Scr,Scr, Scr,Scr,Scr,Scr,Scr, Scr,S0,Scr},//17 для Scr- Коментар-рядок
 {Scl,Scl,Scl,Scl,Scl, Scl,Scl,Scl,Scl,Scl, Scl,Scl,Scl,Scl,Scl, Scl,Scl,Scl},	// для Scl
 {Ec,Ec,Ec,Ec,Ec,Ec,Ec,Ec, S0,S0,S0},			// для Ec 
 {Ep,Ep,Ep,Ep,Ep,Ep,Ec,Ec, S0,S0,S0},			// для Ep 
 {Eq,Eq,Eq,Eq,Eq,Eq,Eq,Ec, S0,S0,S0},			// для Eq
 {En,En,Eq,Eq,Eq,Eq,Eq,Ec, S0,S0,S0},			// для En
 {Eo,Eo,Eo,Eq,Eq,Eq,Eq,Ec, S0,S0,S0}			// для Eo...
};
struct recrdKWD tablKWDP[67]=
{{oprtrP[_ass],_ass,1},//{"zz",_asSub,1},	
{oprtrP[_ne],_ne,1},	
{oprtrP[_fldPt],_fldPt,1},
{oprtrP[_rem],_rem,1},{oprtrP[_remL],_remL,1},// 10
{oprtrP[_le],_le,1},
{oprtrP[_eq],_eq,1},{oprtrP[_ge],_ge,1},		// 16
{oprtrP[_and],_and,1},	
{oprtrP[_opbr],_opbr,1},
{oprtrP[_break],_break,1},
{oprtrP[_case],_case,1},	{oprtrP[_catch],_catch,6},
{oprtrP[_char],_char,1},	{oprtrP[_class],_class,2},		
{oprtrP[_const],_const,1},	{oprtrP[_continue],_continue,1},
{oprtrP[_delete],_delete,2},
{oprtrP[_loop],_loop,1},
{oprtrP[_double],_double,1},
{oprtrP[_downto],_downto,1},
{oprtrP[_else],_else,1},
{oprtrP[_ocbr],_ocbr},		{oprtrP[_extern],_extern},
{oprtrP[_float],_float},	{oprtrP[_for],_for},		
{oprtrP[_friend],_friend},	{oprtrP[_goto],_goto},	
{oprtrP[_if],_if},			{oprtrP[_int],_int},	
{oprtrP[_sint64],_sint64},	{oprtrP[_long],_long},	
{oprtrP[_new],_new},		
{oprtrP[_or],_or,1},	
{oprtrP[_private],_private},	
{oprtrP[_protected],_protected},{oprtrP[_public],_public},	
{oprtrP[_register],_register},
{oprtrP[_repeat],_repeat,1},
{oprtrP[_return],_return},
{oprtrP[_signed],_signed},	{oprtrP[_sizeof],_sizeof},
{oprtrP[_short],_short},	{oprtrP[_static],_static},
{oprtrP[_struct],_struct},	{oprtrP[_switch],_switch},
{oprtrP[_then],_then},		//{oprtrP[_throw],_throw},	
{oprtrP[_to],_to,1},
{oprtrP[_tryC],_tryC},
{oprtrP[_typedef],_typedef},{oprtrP[_union],_union},
{oprtrP[_unsigned],_unsigned},
{oprtrP[_untilN],_untilN,1},
{oprtrP[_virtual],_virtual},
{oprtrP[_void],_void},		{oprtrP[_volatile],_volatile},
{oprtrP[_whileP],_whileP},
{"zz",_asDiv,1},
{"zz",_asShl,1},{"zz",_asXor,1},
{"zz",_asMod,1},{"zz",_asAnd,1},
{"zz",_asMul,1},{"zz",_inr,1},
{"zz",_asAdd,1},{"zz",_dcr,1},
{"zz",_asOr,1},
};