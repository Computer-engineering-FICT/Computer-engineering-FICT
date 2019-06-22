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