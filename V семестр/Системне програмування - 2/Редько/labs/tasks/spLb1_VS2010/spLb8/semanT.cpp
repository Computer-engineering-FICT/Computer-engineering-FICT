#include "stdafx.h"
#include "..\spLb3\token.h"
#include "..\spLb7\seman.h"
#include "interpF.h"
union gnDat *_pd;
_fop *_paddf=&_fadd;
struct recrdSMA	ftTbl[179]=	// таблиця припустимості типів для операцій
{{_if,_ui,32,_ui,32,_v,0},
{_if,_ui,32,_si,32,_v,0},
{_if,_ui,32,_f,32,_v,0},
{_if,_ui,32,_d,64,_v,0},
{_if,_si,32,_ui,32,_v,0},
{_if,_si,32,_si,32,_v,0},
{_if,_si,32,_f,32,_v,0},
{_if,_si,32,_d,64,_v,0},
{_if,_f,32,_ui,32,_v,0},
{_if,_f,32,_si,32,_v,0},
{_if,_f,32,_f,32,_v,0},
{_if,_f,32,_d,64,_v,0},
{_if,_d,64,_ui,32,_v,0},
{_if,_d,64,_si,32,_v,0},
{_if,_d,64,_f,32,_v,0},
{_if,_d,64,_d,64,_v,0},
{_else,_v,0,_ui,32,_v,0},
{_else,_v,0,_si,32,_v,0},
{_else,_v,0,_f,32,_v,0},
{_else,_v,0,_d,64,_v,0},
{_cln,_ui,32,_ui,32,_ui,32},
{_cln,_ui,32,_si,32,_si,32},
{_cln,_ui,32,_f,32,_f,32},
{_cln,_ui,32,_d,64,_d,64},
{_cln,_si,32,_ui,32,_si,32},
{_cln,_si,32,_si,32,_si,32},
{_cln,_si,32,_f,32,_f,32},
{_cln,_si,32,_d,64,_d,64},
{_cln,_f,32,_ui,32,_f,32},
{_cln,_f,32,_si,32,_f,32},
{_cln,_f,32,_f,32,_f,32},
{_cln,_f,32,_d,64,_d,64},
{_cln,_d,64,_ui,32,_d,64},
{_cln,_d,64,_si,32,_d,64},
{_cln,_d,64,_f,32,_d,64},
{_cln,_d,64,_d,64,_d,64},
{_qmrk,_ui,32,_ui,32,_ui,32},
{_qmrk,_ui,32,_si,32,_si,32},
{_qmrk,_ui,32,_f,32,_f,32},
{_qmrk,_ui,32,_d,64,_d,64},
{_qmrk,_si,32,_ui,32,_ui,32},
{_qmrk,_si,32,_si,32,_si,32},
{_qmrk,_si,32,_f,32,_f,32},
{_qmrk,_si,32,_d,64,_d,64},
{_qmrk,_f,32,_ui,32,_ui,32},
{_qmrk,_f,32,_si,32,_si,32},
{_qmrk,_f,32,_f,32,_f,32},
{_qmrk,_f,32,_d,64,_d,64},
{_qmrk,_d,64,_ui,32,_ui,32},
{_qmrk,_d,64,_si,32,_si,32},
{_qmrk,_d,64,_f,32,_f,32},
{_qmrk,_d,64,_d,64,_d,64},
{_asAdd,_ui,32,_ui,32,_ui,32},
{_asAdd,_ui,32,_si,32,_ui,32},
{_asAdd,_si,32,_si,32,_si,32},
{_asAdd,_f,32,_ui,32,_f,32},
{_asAdd,_f,32,_si,32,_f,32},
{_asAdd,_f,32,_f,32,_f,32},
{_asAdd,_f,32,_d,64,_f,32},
{_asAdd,_d,64,_ui,32,_d,32},
{_asAdd,_d,64,_si,32,_d,64},
{_asAdd,_d,64,_f,32,_d,64},
{_asAdd,_d,64,_d,64,_d,64},
{_ass,_ui,32,_ui,32,_ui,32},
{_ass,_ui,32,_si,32,_ui,32},
{_ass,_si,32,_si,32,_si,32},
{_ass,_f,32,_ui,32,_f,32},
{_ass,_f,32,_si,32,_f,32},
{_ass,_f,32,_f,32,_f,32},
{_ass,_f,32,_d,64,_f,32},
{_ass,_d,64,_ui,32,_d,32},
{_ass,_d,64,_si,32,_d,64},
{_ass,_d,64,_f,32,_d,64},
{_ass,_d,64,_d,64,_d,64},
{_dcr,_v,0,_ui,32,_ui,32},
{_dcr,_v,0,_si,32,_si,32},
{_dcr,_ui,32,_v,0,_ui,32},
{_dcr,_si,32,_v,0,_si,32},
{_inr,_v,0,_ui,32,_ui,32},
{_inr,_v,0,_si,32,_si,32},
{_inr,_ui,32,_v,0,_ui,32},
{_inr,_si,32,_v,0,_si,32},
{_lt,_f,32,_f,32,_ui,32},
{_le,_f,32,_f,32,_ui,32},
{_eq,_f,32,_f,32,_ui,32},
{_ne,_ui,32,_ui,32,_ui,32},
{_ne,_f,32,_f,32,_ui,32},
{_ge,_f,32,_f,32,_ui,32},
{_gt,_f,32,_f,32,_ui,32},
{_add,_ui,32,_ui,32,_ui,32},
{_add,_ui,32,_si,32,_si,32},
{_add,_ui,32,_f,32,_f,32},
{_add,_ui,32,_d,32,_d,64},
{_add,_si,32,_ui,32,_si,32},
{_add,_si,32,_si,32,_si,32},
{_add,_si,32,_f,32,_f,32},
{_add,_si,32,_d,32,_d,64},
{_add,_f,32,_ui,32,_f,32},
{_add,_f,32,_si,32,_f,32},
{_add,_f,32,_f,32,_f,32, _paddf},
{_add,_f,32,_d,32,_d,64},
{_add,_d,32,_ui,32,_d,64},
{_add,_d,32,_si,32,_d,64},
{_add,_d,32,_f,32,_d,64},
{_add,_d,32,_d,32,_d,64},
{_sub,_ui,32,_ui,32,_ui,32},
{_sub,_ui,32,_si,32,_si,32},
{_sub,_ui,32,_f,32,_f,32},
{_sub,_ui,32,_d,32,_d,64},
{_sub,_si,32,_ui,32,_si,32},
{_sub,_si,32,_si,32,_si,32},
{_sub,_si,32,_f,32,_f,32},
{_sub,_si,32,_d,32,_d,64},
{_sub,_f,32,_ui,32,_f,32},
{_sub,_f,32,_si,32,_f,32},
{_sub,_f,32,_f,32,_f,32},
{_sub,_f,32,_d,32,_d,64},
{_sub,_d,32,_ui,32,_d,64},
{_sub,_d,32,_si,32,_d,64},
{_sub,_d,32,_f,32,_d,64},
{_sub,_d,32,_d,32,_d,64},
{_mul,_ui,32,_ui,32,_ui,32},
{_mul,_ui,32,_si,32,_si,32},
{_mul,_ui,32,_f,32,_f,32},
{_mul,_ui,32,_d,32,_d,64},
{_mul,_si,32,_ui,32,_si,32},
{_mul,_si,32,_si,32,_si,32},
{_mul,_si,32,_f,32,_f,32},
{_mul,_si,32,_d,32,_d,64},
{_mul,_f,32,_ui,32,_f,32},
{_mul,_f,32,_si,32,_f,32},
{_mul,_f,32,_f,32,_f,32},
{_mul,_f,32,_d,32,_d,64},
{_mul,_d,32,_ui,32,_d,64},
{_mul,_d,32,_si,32,_d,64},
{_mul,_d,32,_f,32,_d,64},
{_mul,_d,32,_d,32,_d,64},
{_div,_ui,32,_ui,32,_ui,32},
{_div,_ui,32,_si,32,_si,32},
{_div,_ui,32,_f,32,_f,32},
{_div,_ui,32,_d,32,_d,64},
{_div,_si,32,_ui,32,_si,32},
{_div,_si,32,_si,32,_si,32},
{_div,_si,32,_f,32,_f,32},
{_div,_si,32,_d,32,_d,64},
{_div,_f,32,_ui,32,_f,32},
{_div,_f,32,_si,32,_f,32},
{_div,_f,32,_f,32,_f,32},
{_div,_f,32,_d,32,_d,64},
{_div,_d,32,_ui,32,_d,64},
{_div,_d,32,_si,32,_d,64},
{_div,_d,32,_f,32,_d,64},
{_div,_d,32,_d,32,_d,64},
{_mod,_ui,32,_ui,32,_ui,32},
{_mod,_ui,32,_si,32,_si,32},
{_mod,_si,32,_ui,32,_si,32},
{_mod,_si,32,_si,32,_si,32},
{_orB,_ui,32,_ui,32,_ui,32},
{_orB,_ui,32,_si,32,_si,32},
{_orB,_si,32,_ui,32,_si,32},
{_orB,_si,32,_si,32,_si,32},
{_andB,_ui,32,_ui,32,_ui,32},
{_andB,_ui,32,_si,32,_si,32},
{_andB,_si,32,_ui,32,_si,32},
{_andB,_si,32,_si,32,_si,32},
{_xorB,_ui,32,_ui,32,_ui,32},
{_xorB,_ui,32,_si,32,_si,32},
{_xorB,_si,32,_ui,32,_si,32},
{_xorB,_si,32,_si,32,_si,32},
{_or,_ui,32,_ui,32,_ui,32},
{_and,_ui,32,_ui,32,_ui,32},
{_ixbz,_ui+cdPtr|cdCns,32,_ui,32,_ui,32},
{_ixbz,_ui+cdPtr|cdCns,32,_si,32,_ui,32},
{_ixbz,_si+cdPtr|cdCns,32,_ui,32,_si,32},
{_ixbz,_si+cdPtr|cdCns,32,_si,32,_si,32},
{_ixbz,_f+cdPtr|cdCns,32,_ui,32,_f,32},
{_ixbz,_f+cdPtr|cdCns,32,_si,32,_f,32},
{_ixbz,_d+cdPtr|cdCns,64,_ui,32,_d,32},
{_ixbz,_d+cdPtr|cdCns,64,_si,32,_d,32},
};
int lnCod[]=			// вектор довжин типів
{0, 0, 0, 0,
 8,16,32,64,
 8,16,32,64,//
 32,64,80,48,
 _lbl,//
 _enm,_str,_unn,
};
enum datType tpLx[]=	// масив кодів типів констант від типів лексем
{_v,	//0 Eu - Некласифікований об'єкт
 _v,	//1 S0 - Роздільник
 _v,	//2 S1g - Знак числової константи
 _ui,	//3 S1c - Ціле число
 _d,	//4 S2c - Число з точкою
 _v,	//5 S1e - Літера "e" або "E"
 _v,	//6 S1q - Знак "-" або "+"
 _f,	//7 S1p - Десяткові цифри порядку
 _v,	//8 S1n - Елементи імені
 _v,	//9 S1s - Літери рядка або символьної константи
 _v,	//10 S1t - Елементи констант, які перетворюються 
 _strn,	//11 S2s - Ознака закінчення константи
 _v,	//12 S2 - Початковий елемент групового роздільника
 _v,	//13 S3 - Наступний елемент групового роздільника
 _ui,	//14?S3c - Ціле число з недесятковою основою
 _v,	//15?S0p - Ознака типу константи
 _v,	//16 Soc- Вісімковий код
 _v,	//17 Scr- Коментар-рядок
 _v,	//18 Scl- Обмежений коментар
 _v,	//19 Ec - Неправильна константа
 _v,	//20 Ep - Неправильна константа з точкою
 _v,	// Eq - Неправильна константа з порядком
 _v,	// En - Неправильне ім'я
 _v	// Eo - Неприпустиме сполучення операцій
};
struct recrdTMD tpLxMd[]=	
// масив кодів та ознак ключових слів типів
{{_v, 0, 0},	//0 _void
 {_v, 0, 0},	//1 _extern
 {_v, 0, 0},	//2 _var
 {_v,cdCns,0},	//3 _const
 {_enm, 0,32},	//4 _enum
 {_str, 0, 0},	//5 _struct/*_record*/
 {_unn, 0, 0},	//6 _union
 {_v,cdReg,0},	//7 _register
 {_ui,0,32},	//8 _unsigned
 {_si,0,32},	//9 _signed
 {_si,0, 8},	//10 _char
 {_si,0,16},	//11 _short 
 {_si,0,32},	//12 _int 
 {_si,0,32},	//13 _long 
 {_si,0,64},	//14 _sint64
 {_ui,0,64},	//15 _uint64
 {_f, 0,32},	//16 _float
 {_d, 0,64},	//17 _double 
};
struct recrdTPD	tpTbl[]=	// таблиця модифікованих типів
{{{_void,_void,_void},_v,0},
{{_enum,_void,_void},_enm,32},
{{_struct,_void,_void},_str,0},
{{_union,_void,_void},_unn,0},
{{_unsigned,_void,_void},_ui,32},
{{_signed,_void,_void},_si,32},
{{_char,_unsigned,_void},_uc,8},
{{_char,_signed,_void},_sc,8},//4
{{_char,_void,_void},_sc,8},
{{_short,_void,_void},_si,16},
{{_short,_unsigned,_void},_ui,16},
{{_short,_signed,_void},_si,16},
{{_int,_void,_void},_si,32},//9
{{_int,_unsigned,_void},_ui,32},
{{_int,_signed,_void},_si,32},
{{_int,_long,_void},_si,32},
{{_long,_void,_void},_si,32},
{{_float,_void,_void},_f,32},//14
{{_double,_void,_void},_d,64},
{{_double,_long,_void},_ld,80},
{{_class,_void,_void},_cls,0},
};