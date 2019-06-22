#include "stdafx.h"
#include "tables.h"
#include "vistab.h"
#include <string.h>
#include <stdio.h>
#define SizeRc sizeof(struct recrd)

//------------------------------------------------------
// ������� ������ ������� �� ������ �������

// ������ �� ������ �������
struct recrd* selNmb(struct recrd* tb,unsigned short nElm)
// tb - �������, � ��� ���������
// nElm - ����� ��������, ���� ���������
{return &tb[nElm];}

// ��������� �� ������ �������
struct recrd* insNmb(struct recrd*pElm,
					 struct recrd*tb, unsigned short nElm, short *pQnElm)
// ���������:
// - �����, ���� ����� ��������
// - �������, � ��� �������� �����
// - ����, ���� ����� ��������� �����
// - ����� �������
{short n=*pQnElm;
 if(nElm<n)return 0; // ���������� ����� ��� ��������� ����� ???
 while(nElm>n){
	 struct recrd rec={{"",0}};
	 tb[n++]=rec;}
 tb[nElm]=*pElm;
 *pQnElm=nElm+1;
 return &tb[nElm]; 
}

// ��������� �� ������ �������
struct recrd* delNmb(struct recrd*tb,unsigned short nElm)	
{tb[nElm]._del=-1;
 return &tb[nElm]; 
}

// �������� �� ������ �������
struct recrd* updNmb(struct recrd*pElm,
					 struct recrd*tb,unsigned short nElm, short *pQnElm)	
{short n=*pQnElm;
 if(nElm>=n)return 0; // ���� ���������� ������������ ��������� �������
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
struct recrd* selLin(struct keyStr kArg, struct recrd* tb, short ln)
// ln - ����� �������
{while(--ln>=0&&neqKey(&tb[ln], kArg));
 if(ln<0)return 0;
 return &tb[ln];
}

// ��������� �� ������ �������
// �������� �� ����� � ����� ����
struct recrd*insLin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{short n=0;
 while(n<*pQnElm&&tb[n].key.str[0]!=0&&tb[n]._del!=-1)n++;
 if(n==*pQnElm)(*pQnElm)++;
 tb[n]=*pElm;
 return &tb[n];
}

// ��������� �� ������ �������
struct recrd*delLin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{struct recrd*pEl=selLin(pElm->key, tb, *pQnElm);
 if(pEl)pEl->_del=-1;
 return pEl;
}

// �������� �� ������ �������
struct recrd*updLin(struct keyStr kArg, struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{struct recrd*pEl=selLin(kArg, tb, *pQnElm);
 if(pEl)*pEl=*pElm;
 return pEl;
}

// ��������� ��� ������� ������
// ������� ������� ������, ��� �� ������� ��������
struct recrd*pckLin(struct recrd*tb, short*pQnElm)
{short n=0, ln=0; 
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

// ��������� �� ���������� ������� �����
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

// ��������� �����
int cmpSim(char* c1, char* c2)
{unsigned n=0; 
 while(((c1[n]==c2[n])||
	 ((c1[n]=='a')&&(c2[n]=='�'))||
     ((c1[n]=='A')&&(c2[n]=='�'))||
	 ((c1[n]=='B')&&(c2[n]=='�'))||
	 ((c1[n]=='g')&&(c2[n]=='�'))||
     ((c1[n]=='e')&&(c2[n]=='�'))|| 
     ((c1[n]=='E')&&(c2[n]=='�'))|| 
     ((c1[n]=='u')&&(c2[n]=='�'))|| 
     ((c1[n]=='K')&&(c2[n]=='�'))|| 
     ((c1[n]=='M')&&(c2[n]=='�'))||
     ((c1[n]=='o')&&(c2[n]=='�'))|| 
     ((c1[n]=='O')&&(c2[n]=='�'))|| 
     ((c1[n]=='n')&&(c2[n]=='�'))|| 
     ((c1[n]=='p')&&(c2[n]=='�'))|| 
     ((c1[n]=='P')&&(c2[n]=='�'))|| 
     ((c1[n]=='c')&&(c2[n]=='�'))|| 
     ((c1[n]=='C')&&(c2[n]=='�'))|| 
     ((c1[n]=='m')&&(c2[n]=='�'))|| 
     ((c1[n]=='T')&&(c2[n]=='�'))|| 
     ((c1[n]=='Y')&&(c2[n]=='�'))|| 
     ((c1[n]=='x')&&(c2[n]=='�'))|| 
     ((c1[n]=='X')&&(c2[n]=='�'))|| 
     ((c1[n]=='H')&&(c2[n]=='�'))|| 
	 ((c2[n]=='a')&&(c1[n]=='�'))||
     ((c2[n]=='A')&&(c1[n]=='�'))||
	 ((c2[n]=='B')&&(c1[n]=='�'))||
	 ((c2[n]=='g')&&(c1[n]=='�'))||
     ((c2[n]=='e')&&(c1[n]=='�'))|| 
     ((c2[n]=='E')&&(c1[n]=='�'))|| 
     ((c2[n]=='u')&&(c1[n]=='�'))|| 
     ((c2[n]=='K')&&(c1[n]=='�'))|| 
     ((c2[n]=='M')&&(c1[n]=='�'))||
     ((c2[n]=='o')&&(c1[n]=='�'))|| 
     ((c2[n]=='O')&&(c1[n]=='�'))|| 
     ((c2[n]=='n')&&(c1[n]=='�'))|| 
     ((c2[n]=='p')&&(c1[n]=='�'))|| 
     ((c2[n]=='P')&&(c1[n]=='�'))|| 
     ((c2[n]=='c')&&(c1[n]=='�'))|| 
     ((c2[n]=='C')&&(c1[n]=='�'))|| 
     ((c2[n]=='m')&&(c1[n]=='�'))|| 
     ((c2[n]=='T')&&(c1[n]=='�'))|| 
     ((c2[n]=='Y')&&(c1[n]=='�'))|| 
     ((c2[n]=='x')&&(c1[n]=='�'))|| 
     ((c2[n]=='X')&&(c1[n]=='�'))|| 
     ((c2[n]=='H')&&(c1[n]=='�')))
	 &&c1[n]!=0&c2[n]!=0){
	 n++;}
 return n;
}



// ��������� �� ���������� �������
int simKey(struct recrd* el, struct keyStr ks){
 char* s1=(char*)el->key.str;
 char* s2=(char*)ks.str;
 return cmpSim(s1,s2);
}




// ������ �� ������ ������� �� ���������� �������
struct recrd* selLinSim(struct keyStr kArg,
					 struct recrd* tb, short ln)
// ln - ����� �������
{ recrd* res=&tb[0];
  int skey=simKey(&tb[ln], kArg);
  if (skey<0) skey=skey*(-1);
  while(--ln>0)
  {int skeys=simKey(&tb[ln], kArg);
  if (skeys<0) skeys=skeys*(-1);
  if (skeys>skey) {skey=skeys; res=&tb[ln];}}
 if(ln<0)return 0;
 return res;
}


//------------------------------------------------------
// ���������� ��� ��������� ������
struct recrd*srtBin(struct recrd*tb, short ln)
{short n=0, n1;
 struct recrd el;
 for(;n<ln;n++)for(n1=n+1;n1<ln;n1++)
	 if(cmpKey(&tb[n],tb[n1].key)>0)
		{el=tb[n];tb[n]=tb[n1];tb[n1]=el;}
 return tb;
}

// ������ �� �������� �������
struct recrd*selBin(struct keyStr kArg, struct recrd*tb, short ln)
{short i, nD=-1, nU=ln, n=(nD+nU)>>1;
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
					struct recrd*tb, short*pQnElm)
{
short i, nD=-1, nU=*pQnElm, n=(nD+nU)>>1;
 while(i=cmpKey(&tb[n],pElm->key))
	{if(i>0)nU=n;else nD=n;
	 n=(nD+nU)>>1;
// ��� ��������� �������� �������� ��� ����� ����,
	 if(n==nD)
	 {(*pQnElm)++;
// ���������� ������ �������� � ������� �� ���� ����� ������
	 for(i=*pQnElm;i>n;i--)
		tb[i+1]=tb[i];
// �������� ����� ������� �� �������� ����
		tb[i+1]=*pElm;
		 return &tb[i];
	 }
	}
		 return &tb[n];
}					

// ��������� �� �������� �������
struct recrd*delBin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{struct recrd*pr=selBin(pElm->key, tb, *pQnElm);
// ��� ���������� �������� ������� ���� ��� ��������� 
 return pr;
}					

// �������� �� �������� �������
struct recrd*updBin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{struct recrd*pr=selBin(pElm->key, tb, *pQnElm);
// ��� ���������� �������� ��������� ���� ������ ���������� ����
 return pr;
}					
