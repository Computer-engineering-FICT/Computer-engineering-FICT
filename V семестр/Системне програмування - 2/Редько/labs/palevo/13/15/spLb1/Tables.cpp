#include "stdafx.h"
#include "tables.h"
#include <string.h>
struct recrd emptyElm={"",0,0.0};
//------------------------------------------------------
// ������� ������ ������� �� ������ �������
// ---!!!�����: ���� ���� ������ ���� ������ � ���������� int nElm!!!---
// ������ �� ������ �������
struct recrd* selNmb(struct recrd*tb, int nElm)
{return &tb[nElm]; 
}
// ��������� �� ������ �������
struct recrd* insNmb(struct recrd*pElm,
					 struct recrd*tb, int nElm, int *pQnElm)	
{int n=*pQnElm;
 if(nElm<n)return 0;
 while(nElm<n)tb[nElm++]=emptyElm;
 tb[nElm++]=*pElm;
 *pQnElm=nElm;
 return &tb[nElm-1]; 
}
// ��������� �� ������ �������
struct recrd* delNmb(struct recrd*tb, int nElm)	
{tb[nElm]._del=-1;
 return &tb[nElm]; 
}
// �������� �� ������ �������
struct recrd* updNmb(struct recrd*pElm,
					 struct recrd*tb, int nElm, int *pQnElm)	
{int n=*pQnElm;
 if(nElm>=n)return 0;
 tb[nElm]=*pElm;
 return &tb[nElm]; 
}	
//------------------------------------------------------
// ��������� �� ���������� �������
int neqKey(struct recrd* el, struct keyStr kArg)
{return (strcmp(el->key.str, kArg.str)||
		 el->key.nMod != kArg.nMod);
}
// ������ �� ������ �������
struct recrd* selLin(struct keyStr kArg,
					 struct recrd* tb, int ln)
{while(--ln>=0&&neqKey(&tb[ln], kArg));
 if(ln<0)return 0;
 return &tb[ln];
}
// ��������� �� ������ �������
struct recrd*insLin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm)
{int n=0;
 while(n<*pQnElm&&tb[n].key.str[0]!=0)n++;
 if(n==*pQnElm)(*pQnElm)++;
 tb[n]=*pElm;
 return &tb[n];
}
// ��������� �� ������ �������
struct recrd*delLin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm)
{struct recrd*pEl=selLin(pElm->key, tb, *pQnElm);
 if(pEl)pEl->_del=-1;
 return pEl;
}
// �������� �� ������ �������
struct recrd*updLin(struct keyStr kArg, struct recrd*pElm,
					struct recrd*tb, int*pQnElm)
{struct recrd*pEl=selLin(kArg, tb, *pQnElm);
 if(pEl)*pEl=*pElm;
 return pEl;
}
// ��������� ��� ������� ������
struct recrd*pckLin(struct recrd*tb, int*pQnElm)
{int n=0, ln=0; 
 while(n<*pQnElm)
 {if(tb[n]._del==0){tb[ln]=tb[n]; ln++;} n++;} 
 *pQnElm=ln;
 return tb;
}
//------------------------------------------------------
// ��������� �����
int cmpStr(unsigned char* s1, unsigned char* s2)
{unsigned n=0; 
 while(s1[n]==s2[n]&&s1[n]!=0)n++;
 return s1[n]-s2[n];
}
// ��������� �� ���������� ������� ������
int cmpKey(struct recrd* el, struct keyStr kArg)
{int i=cmpStr((unsigned char*)el->key.str,
			  (unsigned char*)kArg.str);
 if(i)return i;
 return el->key.nMod - kArg.nMod;
}
// ��������� �� ���������� �������
int cmpKys(struct keyStr *k0, struct keyStr *kArg)	
{int i=cmpStr((unsigned char*)k0->str,
			  (unsigned char*)kArg->str);
 if(i)return i;
 return k0->nMod - kArg->nMod;
}
//------------------------------------------------------
// ���������� ��� ��������� ������
struct recrd*srtBin(struct recrd*tb, int ln)
{int n=0, n1;
 struct recrd el;
 for(;n<ln;n++)for(n1=n+1;n1<ln;n1++)
	 if(cmpKey(&tb[n],tb[n1].key)>0)
		{el=tb[n];tb[n]=tb[n1];tb[n1]=el;}
 return tb;
}
// ������ �� �������� �������
struct recrd*selBin(struct keyStr kArg, struct recrd*tb, int ln)
{int i, nD=-1, nU=ln, n=nD+nU>>1;
 while(i=cmpKey(&tb[n],kArg))
	{if(i>0)nU=n;else nD=n;
	 n=(nD+nU)>>1;
	 if(n==nD)return NULL;
	}
 return &tb[n];
}
// �����: ������� ���� ��� ������� � ���������� �����������
//---!!! ��������� ����������� �� ��������!!!---
// ��������� �� �������� �������
struct recrd*insBin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm)
{struct recrd*pr=selBin(pElm->key, tb, *pQnElm);
// ��� ��������� �������� �������� ��� ����� ����,
// ���������� ������ �������� � ������� �� ���� ����� ������
// �������� ����� ������� �� �������� ����
 return pr;
}					
// ��������� �� �������� �������
struct recrd*delBin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm)
{struct recrd*pr=selBin(pElm->key, tb, *pQnElm);
// ��� ���������� �������� ������� ���� ��� ��������� 
 return pr;
}					
// �������� �� �������� �������
struct recrd*updBin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, int*pQnElm)
{struct recrd*pr=selBin(pElm->key, tb, *pQnElm);
// ��� ���������� �������� ��������� ���� ������ ���������� ����
 return pr;
}					
