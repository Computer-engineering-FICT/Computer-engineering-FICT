struct keyStr// ������� ������� ������
{char* str; // ������ ����
 int  nMod;};//---!!!����������� �� ��������!!!---
struct fStr	// ������������� ������� ������
{long double _f;};//f-���� ---!!!����������� �� ��������!!!---
// ---!!!�����: ���� ����, �������� ������������: enum|struct|union!!!---
// ---!!!������ ���� ��'����� ���������� � ����� ����!!!---
struct recrd	// ��������� ����� �������
{struct keyStr key;// �������� ��������� �����
 struct fStr func;// �������� ������������� �������
 char _del;};	// ������ ��������� 
//------------------------------------------------------
// ������� ������ ������� �� ������ �������
// ---!!!�����: ���� ���� ������ ���� ������ � ���������� int nElm!!!---
// ������ �� ������ �������
struct recrd* selNmb(struct recrd*, int nElm);	
// ��������� �� ������ �������
struct recrd* insNmb(struct recrd*pElm,
					 struct recrd*tb, int nElm, int*pQnElm);
// ��������� �� ������ �������
struct recrd* delNmb(struct recrd*, int nElm);	
// �������� �� ������ �������
struct recrd* updNmb(struct recrd*pElm,
					 struct recrd*tb, int nElm, int*pQnElm);	
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
//------------------------------------------------------
// ������ �� ������ �������
struct recrd*selLin(struct keyStr, struct recrd*tb, int ln);
// ��������� �� ������ �������
struct recrd*insLin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// ��������� �� ������ �������
struct recrd*delLin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// �������� �� ������ �������
struct recrd*updLin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// ��������� ��� ������� ������
struct recrd*pckLin(struct recrd*tb, int*pQnElm);
//------------------------------------------------------
// ���������� �� �������� �������
struct recrd*srtBin(struct recrd*, int ln);
// ������ �� �������� �������
struct recrd*selBin(struct keyStr, struct recrd*, int ln);
//---!!! ��������� ����������� �� ��������!!!---
// ��������� �� �������� �������
struct recrd*insBin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// ��������� �� �������� �������
struct recrd*delBin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// �������� �� �������� �������
struct recrd*updBin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
