#define FPWR 0x04000000
#define FMIN 0x02000000
union ui64_t
{unsigned __int64 ui64;
  double fi64;
  struct{unsigned __int32 lo32;
		 unsigned __int32 hi32;
  } s64;
 };
enum ltrTypeS
{d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,	// с0 дес€тков≥ цифри
 ltrhxdgtS=0x10, xZ,	// с1 л≥тера - ш≥стнадц€ткова цифра
 xA=0x1a,xB,xC,xD,xE,xF,	// л≥тери - ш≥стнадц€тков≥ цифри
 ltrexpltS=0x2e,	// с2 л≥тера - ознака експоненти
 ltrtpcnsS=0x30,	// с3 л≥тера - визначник типу константи
 cO=0x36,cH=0x38,
 cB=0x4b,cD=0x4d,// с4 л≥тери - визначники типу константи/ ш≥стнадц€тков≥ цифри
 ltrnmelmS=0x50,	// с4 л≥тери, €к≥ припустим≥ т≥льки в ≥менах
 ltrstrlmS=0x60,	// с5 л≥тери дл€ обмеженн€ р€дк≥в
 ltrtrnfmS=0x68,	// с6 ознаки початку перекодуванн€ л≥тер р€дк≥в
 ltrcnslmS=0x70,	// с7 л≥тери дл€ обмеженн€ констант
 dlmund=0x80,	// с8 допом≥жн≥ розд≥льники типа п≥дкреслень _
 dlmauxS=0x90,	// с9 допом≥жн≥ розд≥льники типа пропуск≥в
 dldotS=0xa0,	// с10 точка €к розд≥льник та л≥тера констант
// ltrstrl1=0xb0,	// с11 ознаки початку констант
 ncS=0xb0,		// с7 некласиф≥кован≥ л≥тери 
 ltrsignS=0xc0,	// с12 знак числа або пор€дку
 ltrsignm=0xcf,	// с12 знак числа або пор€дку
 dlmgrop1,dlmgrop2,dlmgrop3,dlmgrop4,dlmgrop5,// початковий елемент групового розд≥льника
 dlmgrop6,dlmgrop7,dlmgrop8,dlmgrop9,dlmgrop10,
 dlmunopS=0xdf,	// с13 розд≥льники операц≥й
// dlmbrlst,	// с13 розд≥льники елемент≥в списк≥в
// dlobrct,	// с14 в≥дкрит≥ дужки
// dlcbrct,	// с15 закрит≥ дужки
 ltrcodeS=256 //с16 ознака можливост≥ кодуванн€
};
int convInt(unsigned nc, unsigned char aSS, unsigned char sSS, unsigned nb);
int /*LexNode::*/ convNum(struct lxNode * nd	//, вказ≥вник на початок масиву вузл≥в 
// 		  unsigned n, int disp, enum ltrType ltrCls[256]
							);

