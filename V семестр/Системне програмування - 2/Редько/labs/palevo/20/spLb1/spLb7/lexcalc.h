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
{d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,	// �0 �������� �����
 ltrhxdgtS=0x10, xZ,	// �1 ����� - �������������� �����
 xA=0x1a,xB,xC,xD,xE,xF,	// ����� - ������������� �����
 ltrexpltS=0x2e,	// �2 ����� - ������ ����������
 ltrtpcnsS=0x30,	// �3 ����� - ��������� ���� ���������
 cO=0x36,cH=0x38,
 cB=0x4b,cD=0x4d,// �4 ����� - ���������� ���� ���������/ ������������� �����
 ltrnmelmS=0x50,	// �4 �����, �� ��������� ����� � ������
 ltrstrlmS=0x60,	// �5 ����� ��� ��������� �����
 ltrtrnfmS=0x68,	// �6 ������ ������� ������������� ���� �����
 ltrcnslmS=0x70,	// �7 ����� ��� ��������� ��������
 dlmund=0x80,	// �8 ������� ���������� ���� ���������� _
 dlmauxS=0x90,	// �9 ������� ���������� ���� ��������
 dldotS=0xa0,	// �10 ����� �� ��������� �� ����� ��������
// ltrstrl1=0xb0,	// �11 ������ ������� ��������
 ncS=0xb0,		// �7 �������������� ����� 
 ltrsignS=0xc0,	// �12 ���� ����� ��� �������
 ltrsignm=0xcf,	// �12 ���� ����� ��� �������
 dlmgrop1,dlmgrop2,dlmgrop3,dlmgrop4,dlmgrop5,// ���������� ������� ��������� ����������
 dlmgrop6,dlmgrop7,dlmgrop8,dlmgrop9,dlmgrop10,
 dlmunopS=0xdf,	// �13 ���������� ��������
// dlmbrlst,	// �13 ���������� �������� ������
// dlobrct,	// �14 ������ �����
// dlcbrct,	// �15 ������ �����
 ltrcodeS=256 //�16 ������ ��������� ���������
};
int convInt(unsigned nc, unsigned char aSS, unsigned char sSS, unsigned nb);
int /*LexNode::*/ convNum(struct lxNode * nd	//, �������� �� ������� ������ ����� 
// 		  unsigned n, int disp, enum ltrType ltrCls[256]
							);

