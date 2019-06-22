#include "stdafx.h"
#include "..\spLb3\token.h"
#include "seman.h"
struct recrdSMA	ftTbl[]=	// ������� ������������ ���� ��� ��������
{{_ass,_ui,32,_si,32,_ui,32},
{_dcr,_v,0,_ui,32,_ui,32},
{_add,_ui,32,_ui,32,_ui,32},
{_mul,_si,32,_ui,32,_si,32},
{_mul,_si,32,_si,32,_si,32},
{_ixbz,_si+cdPtr|cdCns,32,_ui,32,_si,32},
};
int lnCod[]=			// ������ ������ ����
{0, 0, 0, 0,
 8,16,32,64,
 8,16,32,64,//
 32,64,80,48,
 _lbl,//
 _enm,_str,_unn,
};
enum datType tpLx[]=	// ����� ���� ���� �������� �� ���� ������
{_v,	//0 Eu - ���������������� ��'���
 _v,	//1 S0 - ���������
 _v,	//2 S1g - ���� ������� ���������
 _ui,	//3 S1c - ֳ�� �����
 _f,	//4 S2c - ����� � ������
 _v,	//5 S1e - ˳���� "e" ��� "E"
 _v,	//6 S1q - ���� "-" ��� "+"
 _f,	//7 S1p - �������� ����� �������
 _v,	//8 S1n - �������� ����
 _v,	//9 S1s - ˳���� ����� ��� ��������� ���������
 _v,	//10 S1t - �������� ��������, �� �������������� 
 _strn,	//11 S2s - ������ ��������� ���������
 _v,	//12 S2 - ���������� ������� ��������� ����������
 _v,	//13 S3 - ��������� ������� ��������� ����������
 _ui,	//14?S3c - ֳ�� ����� � ������������ �������
 _v,	//15?S0p - ������ ���� ���������
 _v,	//16 Soc- ³������� ���
 _v,	//17 Scr- ��������-�����
 _v,	//18 Scl- ��������� ��������
 _v,	//19 Ec - ����������� ���������
 _v,	//20 Ep - ����������� ��������� � ������
 _v,	// Eq - ����������� ��������� � ��������
 _v,	// En - ����������� ��'�
 _v	// Eo - ������������ ���������� ��������
};
struct recrdTMD tpLxMd[]=	
// ����� ���� �� ����� �������� ��� ����
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
struct recrdTPD	tpTbl[]=	// ������� ������������� ����
{{{_void,_void,_void},_v,0},
{{_void,_extern,_void},_v+cdExt,0},
{{_void,_const,_void},_v+cdCns,0},
{{_void,_register,_void},_v+cdReg,0},
{{_void,_auto,_void},_v+cdAut,0},
{{_void,_static,_void},_v+cdStt,0},
{{_enum,_void,_void},_enm,32},
{{_enum,_extern,_void},_enm+cdExt,32},
{{_enum,_const,_void},_enm+cdCns,32},
{{_enum,_register,_void},_enm+cdReg,32},
{{_enum,_auto,_void},_enm+cdAut,32},
{{_enum,_static,_void},_enm+cdStt,32},
{{_struct,_void,_void},_str,0},
{{_struct,_extern,_void},_str+cdExt,0},
{{_struct,_const,_void},_str+cdCns,0},
{{_struct,_register,_void},_str+cdReg,0},
{{_struct,_auto,_void},_str+cdAut,0},
{{_struct,_static,_void},_str+cdStt,0},
{{_union,_void,_void},_unn,0},
{{_union,_extern,_void},_unn+cdExt,0},
{{_union,_const,_void},_unn+cdCns,0},
{{_union,_register,_void},_unn+cdReg,0},
{{_union,_auto,_void},_unn+cdAut,0},
{{_union,_static,_void},_unn+cdStt,0},
{{_unsigned,_void,_void},_ui,32},
{{_unsigned,_extern,_void},_ui+cdExt,32},
{{_unsigned,_const,_void},_ui+cdCns,32},
{{_unsigned,_register,_void},_ui+cdReg,32},
{{_unsigned,_auto,_void},_ui+cdAut,32},
{{_unsigned,_static,_void},_ui+cdStt,32},
{{_signed,_void,_void},_si,32},
{{_signed,_extern,_void},_si+cdExt,32},
{{_signed,_const,_void},_si+cdCns,32},
{{_signed,_register,_void},_si+cdReg,32},
{{_signed,_auto,_void},_si+cdAut,32},
{{_signed,_static,_void},_si+cdStt,32},
{{_char,_unsigned,_void},_uc,8},
{{_char,_unsigned,_extern},_uc+cdExt,8},
{{_char,_unsigned,_const},_uc+cdCns,8},
{{_char,_unsigned,_register},_uc+cdReg,8},
{{_char,_unsigned,_auto},_uc+cdAut,8},
{{_char,_unsigned,_static},_uc+cdStt,8},
{{_char,_signed,_void},_sc,8},//4
{{_char,_signed,_extern},_sc+cdExt,8},//4
{{_char,_signed,_const},_sc+cdCns,8},//4
{{_char,_signed,_register},_sc+cdReg,8},//4
{{_char,_signed,_auto},_sc+cdAut,8},//4
{{_char,_signed,_static},_sc+cdStt,8},//4
{{_char,_void,_void},_sc,8},
{{_char,_extern,_void},_sc+cdExt,8},
{{_char,_const,_void},_sc+cdCns,8},
{{_char,_register,_void},_sc+cdReg,8},
{{_char,_auto,_void},_sc+cdAut,8},
{{_char,_static,_void},_sc+cdStt,8},
{{_short,_void,_void},_si,16},
{{_short,_extern,_void},_si+cdExt,16},
{{_short,_const,_void},_si+cdCns,16},
{{_short,_register,_void},_si+cdReg,16},
{{_short,_auto,_void},_si+cdAut,16},
{{_short,_static,_void},_si+cdStt,16},
{{_short,_unsigned,_void},_ui,16},
{{_short,_unsigned,_extern},_ui+cdExt,16},
{{_short,_unsigned,_const},_ui+cdCns,16},
{{_short,_unsigned,_register},_ui+cdReg,16},
{{_short,_unsigned,_auto},_ui+cdAut,16},
{{_short,_unsigned,_static},_ui+cdStt,16},
{{_short,_signed,_void},_si,16},
{{_short,_signed,_extern},_si+cdExt,16},
{{_short,_signed,_const},_si+cdCns,16},
{{_short,_signed,_register},_si+cdReg,16},
{{_short,_signed,_auto},_si+cdAut,16},
{{_short,_signed,_static},_si+cdStt,16},
{{_int,_void,_void},_si,32},//9
{{_int,_extern,_void},_si+cdExt,32},//9
{{_int,_const,_void},_si+cdCns,32},//9
{{_int,_register,_void},_si+cdReg,32},//9
{{_int,_auto,_void},_si+cdAut,32},//9
{{_int,_static,_void},_si+cdStt,32},//9
{{_int,_unsigned,_void},_ui,32},
{{_int,_unsigned,_extern},_ui+cdExt,32},
{{_int,_unsigned,_const},_ui+cdCns,32},
{{_int,_unsigned,_register},_ui+cdReg,32},
{{_int,_unsigned,_auto},_ui+cdAut,32},
{{_int,_unsigned,_static},_ui+cdStt,32},
{{_int,_signed,_void},_si,32},
{{_int,_signed,_extern},_si+cdExt,32},
{{_int,_signed,_const},_si+cdCns,32},
{{_int,_signed,_register},_si+cdReg,32},
{{_int,_signed,_auto},_si+cdAut,32},
{{_int,_signed,_static},_si+cdStt,32},
{{_int,_long,_void},_si,32},
{{_int,_long,_extern},_si+cdExt,32},
{{_int,_long,_const},_si+cdCns,32},
{{_int,_long,_register},_si+cdReg,32},
{{_int,_long,_auto},_si+cdAut,32},
{{_int,_long,_static},_si+cdStt,32},
{{_long,_void,_void},_si,32},
{{_long,_extern,_void},_si+cdExt,32},
{{_long,_const,_void},_si+cdCns,32},
{{_long,_register,_void},_si+cdReg,32},
{{_long,_auto,_void},_si+cdAut,32},
{{_long,_const,_void},_si+cdStt,32},
{{_float,_void,_void},_f,32},//14
{{_float,_extern,_void},_f+cdExt,32},//14
{{_float,_const,_void},_f+cdCns,32},//14
{{_float,_register,_void},_f+cdReg,32},//14
{{_float,_auto,_void},_f+cdAut,32},//14
{{_float,_static,_void},_f+cdStt,32},//14
{{_double,_void,_void},_d,64},
{{_double,_extern,_void},_d+cdExt,64},
{{_double,_const,_void},_d+cdCns,64},
{{_double,_register,_void},_d+cdReg,64},
{{_double,_auto,_void},_d+cdAut,64},
{{_double,_static,_void},_d+cdStt,64},
{{_double,_long,_void},_ld,80},
{{_double,_long,_extern},_ld+cdExt,80},
{{_double,_long,_const},_ld+cdCns,80},
{{_double,_long,_register},_ld+cdReg,80},
{{_double,_long,_auto},_ld+cdAut,80},
{{_double,_long,_static},_ld+cdStt,80},
{{_class,_void,_void},_cls,0},
{{_class,_extern,_void},_cls+cdExt,0},
{{_class,_const,_void},_cls+cdCns,0},
{{_class,_register,_void},_cls+cdReg,0},
{{_class,_auto,_void},_cls+cdAut,0},
{{_class,_static,_void},_cls+cdStt,0},
{{_class,_volatile,_void},_cls+cdVlt,0},
};
