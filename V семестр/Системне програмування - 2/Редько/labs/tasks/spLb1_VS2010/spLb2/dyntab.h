#include "..\tables.h"
struct sgTbStr // ��������� ��������
{int	nRsEl;   //	������� �������������� ��������
 int	nFlEl;   //	������� ������������ ��������
 struct sgTbStr*pNxtSg;//������ ���������� ��������
 struct recrd* pRcPtr; //�������� �� ���� ������
};
struct hdTbStr // ��������� �������� �������
{int	nSgLm; // �������� ������� �������� ��������
 int	nSgBg; // ������� ����������� ��������
 int	nSgSc;	// ������� ���������� ��������
 int	nFlEl;	// ������� ���������� ��������
 struct sgTbStr* frstSg;//������ ����������� ��������
};
// ��������� �������� �������
struct	hdTbStr*crDnTb(int nLm, int nBg, int nSc);
// ��������� ������� �������� ������� �� �������� �������
void	impDnTb(struct hdTbStr*p,	//������ ��������� ������� 
				struct recrd*tb, int n);//������ � ������� �������
//---!!! ��������� ����������� �� ��������!!!---
// ������ �������� � �������� �������
void	selDnTb(struct hdTbStr*p,	//������ ��������� ������� 
				struct recrd*r);	//������ �������� ��� �������
// ������� �������� �� �������� �������
void	insDnTb(struct hdTbStr*p,	//������ ��������� �������  
				struct recrd*r);	//������ �������� ��� �������
// ��������� �������� � �������� �������
void	delDnTb(struct hdTbStr*p,	//������ ��������� �������  
				struct recrd*r);	//������ �������� ��� �������
// �������� �������� �������� �������
void	updDnTb(struct keyStr, struct hdTbStr*p,	//������ ��������� ������� 
				struct recrd*r);	//������ �������� ��� �������
// ���������� �������� �������
void	extDnTb(struct hdTbStr*p); //������ ��������� ������� 
