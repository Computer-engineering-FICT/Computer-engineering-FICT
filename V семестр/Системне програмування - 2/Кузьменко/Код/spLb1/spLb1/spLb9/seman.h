/*enum lngType
{_V,_EX,_VR,_CNS,_ENM,_STR/*_record/,_UNN,_REG,//
 _UI,_SG,_SC,_HI,_SI,_LI,_SI64,_UI64,//
 _F,_D,_L,_LBL,_AU,_ST,_VL,_TP,_SZOF,//
 _REAL,_ARR,_SET,_FILE,_OBJ,_STRN, _CU,
 //
};*/
/* модифікатори
#define cdPtr  0x20000	// код покажчика 1-го рівня
#define cdCns  0x8000	// код константного типу даних
#define cdArr  0x10000	// код даних типу масиву 
#define cdCna  0x18000	// код константного масиву
#define cdReg  0x10000000	// код регістрового типу даних
#define cdExt  0x20000000	// код зовнішнього типу даних
#define cdStt  0x30000000	// код статичного типу даних
#define cdAut  0x40000000	// код автоматичного типу даних
#define msMod  0xffff8000	// маска модифікаторів типів
#define msStp  0x00007fff	// маска стандартних типів*/
#define lnFPtr 32	// довжина покажчика сегмента
#define lnNPtr 32	// довжина покажчика у сегменті
// модифікатори
#define cdPtr  0x00100000	// код покажчика 1-го рівня
#define msPtr  0xfff00000	// маска рівня покажчика
#define cdCns  0x00080000	// код константного типу даних
#define cdArr  0x00108000	// код даних типу масиву 
#define cdCna  0x00188000	// код масиву констант
#define cdReg  0x00010000	// код регістрового типу даних
#define cdStt  0x00020000	// код статичного типу даних
#define cdAut  0x00030000	// код автоматичного типу даних 
#define cdExt  0x00040000	// код зовнішнього типу даних
#define cdVlt  0x00070000	// код примусового типу даних 
#define msUTp  0x00000fff	// маска номера типу користувача
#define msStp  0x00007fff	// маска стандартних типів
enum datType
{_v,					// порожній тип даних
 _uc=4,_us,_ui,_ui64,// стандартні цілі без знака
 _sc=8,_ss,_si,_si64,	// стандартні цілі зі знаком
 _geq = 0x0ffe,		// загальний тип для рівності
 _gen = 0x0fff,		// загальний (довільний) тип
 _enm = 0x1000,		// перенумеровані типи enum
 _f=0x1ff0,_d,_ld,_rea,		// дані з плаваючою точкою
 _str = 0x2000,		// структурні типи /*_record*/,
 _unn = 0x3000,		// типи об’єднань union
 _cls = 0x4000,		// типи класів
 _obj = 0x5000,		// типи об’єктів 
 _fun = 0x6000,		// функціональні типи
 _ctp = 0x7000,		// умовні типи мови Pascal
 _lbl,_strn,				// мітки
					// інші стандартні типи
 _fl, _tp, _vl, _vr,	//
};
struct recrdTMD	// структура рядка таблиці базових типів
{enum datType tpLx;// примірник структури ключа
 unsigned	 md;	// модифікатор
 unsigned	 ln;	// базова або гранична довжина даних типу
};
struct recrdTPD	// структура рядка таблиці модифікованих типів
{enum tokType kTp[3];// примірник структури ключа
 int dTp;//enum datType примірник функціональної частини
 int  ln;	// базова довжина даних типу
};
// вибірка за двійковим пошуком
struct recrdTPD*selBin(enum tokType kArg[3], struct recrdTPD*tb, int ln);
// порівняння рядків
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
struct recrdSMA	// структура рядка таблиці припустимості типів для операцій
{enum tokType oprtn;
 int	oprd1, ln1;
 int	oprd2, ln2;
 int	res, lnRes;
 char	*assCd;
};
struct recrdSMA*selBin(struct recrdSMA *kArg, struct recrdSMA*tb, int ln);
int cmpStr(struct recrdSMA *s1, struct recrdSMA *s2);
//---!!! функції етапів проектування і настроювання!!!---
enum datType SmAnDcl(int tpCod, struct lxNode * nd);
//enum datType
int SmAnlzr(struct lxNode * nd,	// вказівник на початок масиву вузлів 
 		  int nR);	// номер кореневого вузла
