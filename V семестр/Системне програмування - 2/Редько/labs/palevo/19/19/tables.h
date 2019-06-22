struct keyStr // ������� ������� ������
{char* str; // ������ ����
 unsigned short nMod;}; // ���� ��� ����� ������ - �� ��������

 enum tu {nol,ras,dva,tri,chre,pt,sht,sim,vsim};

struct fStr	// ������������� ������� ������
{enum tu _f;};

struct recrd  // ��������� ����� �������
{struct keyStr key;  // �������� ��������� �����
 struct fStr func;  // �������� ������������� �������
 char _del;};	// ������ ���������
 
//------------------------------------------------------
// ������� ������ ������� �� ������ �������
//
// ������ �� ������ �������
struct recrd* selNmb(struct recrd*, unsigned short nElm);
	
// ��������� �� ������ �������
struct recrd* insNmb(struct recrd*pElm,
					 struct recrd*tb,unsigned short nElm, short*pQnElm);

// ��������� �� ������ �������
struct recrd* delNmb(struct recrd*,unsigned short nElm);	

// �������� �� ������ �������
struct recrd* updNmb(struct recrd*pElm,
					 struct recrd*tb,unsigned short nElm, short*pQnElm);	

//------------------------------------------------------
// ��������� �� ���������� ��������
 int neqKey(struct recrd*, struct keyStr);	

 // ��������� �����
 int cmpStr(unsigned char* s1, unsigned char* s2);

 // ��������� �� ���������� �������
 int cmpKey(struct recrd*, struct keyStr);	

 // ��������� �� ���������� �������
 int cmpKys(struct keyStr*, struct keyStr*);	

 // ��������� �� ���������� �������
 int simKey(struct recrd*, struct keyStr);	

// ������ �� ������ ������� �� ���������� �������
struct recrd* selLinSim(struct keyStr,
					 struct recrd*, short ln);

 //------------------------------------------------------
// ������ �� ������ �������
struct recrd*selLin(struct keyStr, struct recrd*tb, short ln);

// ��������� �� ������ �������
struct recrd*insLin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// ��������� �� ������ �������
struct recrd*delLin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// �������� �� ������ �������
struct recrd*updLin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// ��������� ��� ������� ������
struct recrd*pckLin(struct recrd*tb, short*pQnElm);

//------------------------------------------------------
// ���������� �� �������� �������
struct recrd*srtBin(struct recrd*, short ln);

// ������ �� �������� �������
struct recrd*selBin(struct keyStr, struct recrd*, short ln);

// ��������� �� �������� �������
struct recrd*insBin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// ��������� �� �������� �������
struct recrd*delBin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// �������� �� �������� �������
struct recrd*updBin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, short*pQnElm);
