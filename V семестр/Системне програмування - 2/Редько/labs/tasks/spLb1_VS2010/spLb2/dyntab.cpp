#include "stdafx.h"
#include <stdlib.h>
#include "dyntab.h"
struct hdTbStr*crDnTb( //������ ����������� �������� 
					  int nLm, int nBg, int nSc)
{struct hdTbStr*p = (struct hdTbStr*)// ���������
					malloc(sizeof(struct hdTbStr));
 p->nSgLm = nLm;
// � ������ ����������� �������� ���� ����������� ��������
 p->nSgBg = 1;
 p->nSgSc = nSc;
 p->frstSg = (struct sgTbStr*)// �������
					malloc(sizeof(struct sgTbStr));
 p->frstSg->nRsEl = nLm*nBg;
 p->frstSg->nFlEl = 0;
 p->frstSg->pNxtSg = NULL;
 p->frstSg->pRcPtr = (struct recrd*)// ������
			malloc(p->frstSg->nRsEl*sizeof(struct recrd));
 return p;
}
void	extDnTb1(struct hdTbStr*p) //������ ����������� �������� 
{struct sgTbStr*ps = p->frstSg;
 while(ps)ps=ps->pNxtSg;
 ps->pNxtSg = (struct sgTbStr*)// �������
					malloc(sizeof(struct sgTbStr));
 ps->nRsEl = p->nSgLm*p->nSgSc;
 ps->nFlEl = 0;
 ps->pNxtSg = NULL;
 ps->pRcPtr = (struct recrd*)// ������
				malloc(ps->nRsEl*sizeof(struct recrd));
}
void	impDnTb(struct hdTbStr* p, //������ ����������� �������� 
				struct recrd* tb, int n)
{/*int np = 0;
 while(p->pNxtSg->nRsEl<n-np)
	 do{p->pNxtSg->pRcPtr[np]=tb[np];
		np++}while(np<p->pNxtSg->nRsEl);*/
 p->nFlEl = n;
 p->frstSg->nFlEl = n;
 while(n--)p->frstSg->pRcPtr[n]=tb[n];
}
void	insDnTb(struct hdTbStr* p, //������ ����������� �������� 
				struct recrd* tb, int n)
{p->nFlEl += n;
 p->frstSg->nFlEl += n;
 while(n--)p->frstSg->pRcPtr[p->frstSg->nFlEl+n]=tb[n];
}