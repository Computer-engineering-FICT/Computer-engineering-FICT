struct indStr// ��������� ������� � ������� ���������� ������
{struct keyStr* pKyStr;//�������� �� ������� �������
 struct indStr* pLtPtr;//�������� ����
 struct indStr* pRtPtr;//�������� ������
};
struct hdIxStr
{struct hdTbStr*pHdTb;
 struct indStr*	pBgNdx;// �������� �� ������� ������ �������� �������
 struct indStr*	pRtNdx;// �������� �� ��������� ����� ������ �������� �������
};
struct hdIxStr*crLsIx(struct hdTbStr*p);// ������������ ������� �� ������
void	cvLsBn(struct hdIxStr*p);	// ���������� ������ � ������� ������ 
void	extDnIx1(struct hdIxStr*p, struct keyStr*);// ��������� �������� �� ������� 
void	extDnIx1(struct hdIxStr*p);// ��������� ������� �� ������� 
