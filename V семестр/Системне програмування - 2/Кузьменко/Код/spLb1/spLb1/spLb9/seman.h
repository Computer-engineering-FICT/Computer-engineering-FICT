/*enum lngType
{_V,_EX,_VR,_CNS,_ENM,_STR/*_record/,_UNN,_REG,//
 _UI,_SG,_SC,_HI,_SI,_LI,_SI64,_UI64,//
 _F,_D,_L,_LBL,_AU,_ST,_VL,_TP,_SZOF,//
 _REAL,_ARR,_SET,_FILE,_OBJ,_STRN, _CU,
 //
};*/
/* ������������
#define cdPtr  0x20000	// ��� ��������� 1-�� ����
#define cdCns  0x8000	// ��� ������������ ���� �����
#define cdArr  0x10000	// ��� ����� ���� ������ 
#define cdCna  0x18000	// ��� ������������ ������
#define cdReg  0x10000000	// ��� ����������� ���� �����
#define cdExt  0x20000000	// ��� ���������� ���� �����
#define cdStt  0x30000000	// ��� ���������� ���� �����
#define cdAut  0x40000000	// ��� ������������� ���� �����
#define msMod  0xffff8000	// ����� ������������ ����
#define msStp  0x00007fff	// ����� ����������� ����*/
#define lnFPtr 32	// ������� ��������� ��������
#define lnNPtr 32	// ������� ��������� � �������
// ������������
#define cdPtr  0x00100000	// ��� ��������� 1-�� ����
#define msPtr  0xfff00000	// ����� ���� ���������
#define cdCns  0x00080000	// ��� ������������ ���� �����
#define cdArr  0x00108000	// ��� ����� ���� ������ 
#define cdCna  0x00188000	// ��� ������ ��������
#define cdReg  0x00010000	// ��� ����������� ���� �����
#define cdStt  0x00020000	// ��� ���������� ���� �����
#define cdAut  0x00030000	// ��� ������������� ���� ����� 
#define cdExt  0x00040000	// ��� ���������� ���� �����
#define cdVlt  0x00070000	// ��� ����������� ���� ����� 
#define msUTp  0x00000fff	// ����� ������ ���� �����������
#define msStp  0x00007fff	// ����� ����������� ����
enum datType
{_v,					// ������� ��� �����
 _uc=4,_us,_ui,_ui64,// ��������� ��� ��� �����
 _sc=8,_ss,_si,_si64,	// ��������� ��� � ������
 _geq = 0x0ffe,		// ��������� ��� ��� ������
 _gen = 0x0fff,		// ��������� (��������) ���
 _enm = 0x1000,		// ������������� ���� enum
 _f=0x1ff0,_d,_ld,_rea,		// ��� � ��������� ������
 _str = 0x2000,		// ��������� ���� /*_record*/,
 _unn = 0x3000,		// ���� �ᒺ����� union
 _cls = 0x4000,		// ���� �����
 _obj = 0x5000,		// ���� �ᒺ��� 
 _fun = 0x6000,		// ������������ ����
 _ctp = 0x7000,		// ����� ���� ���� Pascal
 _lbl,_strn,				// ����
					// ���� ��������� ����
 _fl, _tp, _vl, _vr,	//
};
struct recrdTMD	// ��������� ����� ������� ������� ����
{enum datType tpLx;// �������� ��������� �����
 unsigned	 md;	// �����������
 unsigned	 ln;	// ������ ��� �������� ������� ����� ����
};
struct recrdTPD	// ��������� ����� ������� ������������� ����
{enum tokType kTp[3];// �������� ��������� �����
 int dTp;//enum datType �������� ������������� �������
 int  ln;	// ������ ������� ����� ����
};
// ������ �� �������� �������
struct recrdTPD*selBin(enum tokType kArg[3], struct recrdTPD*tb, int ln);
// ��������� �����
int cmpStr(enum tokType s1[3], enum tokType s2[3]);
union gnDat
{int	_id;
 short	_sd;
 char	_cd;
 float	_fd;
 double	_dd;
 __int64 _i8;
};
typedef union gnDat _fop(union gnDat*,union gnDat*); 
struct recrdSMA	// ��������� ����� ������� ������������ ���� ��� ��������
{enum tokType oprtn;
 int	oprd1, ln1;
 int	oprd2, ln2;
 int	res, lnRes;
 char	*assCd;
};
struct recrdSMA*selBin(struct recrdSMA *kArg, struct recrdSMA*tb, int ln);
int cmpStr(struct recrdSMA *s1, struct recrdSMA *s2);
//---!!! ������� ����� ������������ � ������������!!!---
enum datType SmAnDcl(int tpCod, struct lxNode * nd);
//enum datType
int SmAnlzr(struct lxNode * nd,	// �������� �� ������� ������ ����� 
 		  int nR);	// ����� ���������� �����
