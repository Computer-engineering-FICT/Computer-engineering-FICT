#include "stdafx.h"
#include "automat.h"
#include "tables.h"
#include "..\spLb3\parsC.cpp"
//char
enum tokType dlCdsC[256]= 
{_EOF,_nil,_nil,_nil, _nil,_nil,_nil,_nil, 
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,	//16
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil,	//32
 _nil,_xmrk,_nil,_nil/*#*/, _nil/*$*/,_mod,_andB,_nil,
 _brkt,_bckt,_mul,_add, _comma,_sub,_fldDt,_div,	//48
 _nil,_nil,_nil,_nil, _nil,_nil,_nil,_nil, 
 _nil,_nil,_cln,_EOS, _lt,_ass,_gt,_qmrk,// 64
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
enum ltrType ltClsC[256] = 
{dlmaux,nc,nc,nc,nc,nc,nc,nc, nc,dlmaux,dlmeormr,nc,nc,dlmeormr,nc,nc, //16
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc,	//32
 dlmaux,dlmgrop,ltrstrlm,dlmunop,
 ltrnmelm,dlmgrop,dlmgrop,ltrstrlm,
 dlobrct,dlcbrct,dlmgrop,ltrsign,
 dlmunop/*dlmbrlst*/,ltrsign,dldot,dlmgrop,	//48
 dgt,dgt,dgt,dgt,dgt,dgt,dgt,dgt, 
 dgt,dgt,dlmgrop,dlmunop/*dlmbrlst*/,dlmgrop,dlmgrop,dlmgrop,dlmunop,// 64
 dlmunop,ltrhxdgt,ltrhxdgt,ltrhxdgt, ltrhxdgt,ltrexplt,ltrhxdgt,ltrnmelm,
 ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm, ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm,//80
 ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm, ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm,
 ltrtpcns/*ltrnmelm*/,ltrnmelm,ltrnmelm,dlobrct, ltrtrnfm,dlcbrct,dlmgrop,ltrnmelm,//96
 dlmunop,ltrhxdgt,ltrhxdgt,ltrhxdgt, ltrhxdgt,ltrexplt,ltrhxdgt,ltrnmelm,
 ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm, ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm,//112
 ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm, ltrnmelm,ltrnmelm,ltrnmelm,ltrnmelm,
 ltrtpcns/*ltrnmelm*/,ltrnmelm,ltrnmelm,dlobrct, dlmgrop,dlcbrct,dlmunop/*dlmgrop*/,nc,//128
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc,	//144
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc,	//160
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc,	//176
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc,	//192
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc,	//208
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc,	//224
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc,	//240
 nc,nc,nc,nc,nc,nc,nc,nc, nc,nc,nc,nc,nc,nc,nc,nc	//256
//...
};
enum autStat nxtStsC[Eo+1][ltrcode+1] =	// for C/C++
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
struct recrdKWD tablKWDC[67]=
{{oprtrC[_ne],_ne,1},	{oprtrC[_asMod],_asMod,1},
{oprtrC[_and],_and,1},	{oprtrC[_asAnd],_asAnd,1},
{oprtrC[_asMul],_asMul,1},{oprtrC[_inr],_inr,1},
{oprtrC[_asAdd],_asAdd,1},{oprtrC[_dcr],_dcr,1},
{oprtrC[_asSub],_asSub,1},{oprtrC[_fldPt],_fldPt,1},
{oprtrC[_rem],_rem,1},{oprtrC[_remL],_remL,1},// 10
{oprtrC[_asDiv],_asDiv,1},{oprtrC[_shLft],_shLft,1},
{oprtrC[_asShl],_asShl,1},{oprtrC[_le],_le,1},
{oprtrC[_eq],_eq,1},{oprtrC[_ge],_ge,1},		// 16
{oprtrC[_shRgt],_shRgt,1},{oprtrC[_asShr],_asShr,1},
{oprtrC[_asXor],_asXor,1},{oprtrC[_auto],_auto,1},// 20 подвыйна двокрапка
{oprtrC[_break],_break,1},
{oprtrC[_switch],_switch},	{oprtrC[_catch],_catch,6},
{oprtrC[_char],_char,1},	{oprtrC[_class],_class,2},		
{oprtrC[_const],_const,1},	{oprtrC[_continue],_continue,1},
{oprtrC[_default],_default,1},{oprtrC[_delete],_delete,2},
{oprtrC[_repeat],_repeat,1},{oprtrC[_double],_double,1},
{oprtrC[_else],_else,1},
{oprtrC[_enum],_enum},		{oprtrC[_extern],_extern},
{oprtrC[_float],_float},	{oprtrC[_for],_for},		
{oprtrC[_friend],_friend},	{oprtrC[_goto],_goto},	
{oprtrC[_if],_if},			{oprtrC[_int],_int},	
{oprtrC[_sint64],_sint64},	{oprtrC[_long],_long},	
{oprtrC[_new],_new},		{oprtrC[_private],_private},	
{oprtrC[_protected],_protected},{oprtrC[_public],_public},	
{oprtrC[_register],_register},{oprtrC[_return],_return},
{oprtrC[_short],_short},	{oprtrC[_signed],_signed},	
{oprtrC[_sizeof],_sizeof},	{oprtrC[_static],_static},
{oprtrC[_struct],_struct},	{oprtrC[_case],_case,1},
{oprtrC[_throw],_throw},	{oprtrC[_tryC],_tryC},
{oprtrC[_typedef],_typedef},{oprtrC[_union],_union},
{oprtrC[_unsigned],_unsigned},{oprtrC[_virtual],_virtual},
{oprtrC[_void],_void},		{oprtrC[_volatile],_volatile},
{oprtrC[_whileP],_whileP},
{oprtrC[_asOr],_asOr,1},{oprtrC[_or],_or,1},	
};