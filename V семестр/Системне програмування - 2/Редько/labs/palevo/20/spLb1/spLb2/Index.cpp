#include "stdafx.h"
#include <stdlib.h>
#include "index.h"
#include "dyntab.h"
// створення індексу як списку вказівників
struct hdIxStr*crLsIx(struct hdTbStr*p)
{int n0, ln=p->frstSg->nFlEl;
 struct indStr *pCur, *pCurl, **pCurp, **pCurp0;
 struct hdIxStr*pI = (struct hdIxStr*)// заголовок
			malloc(sizeof(struct hdIxStr));
 pI->pHdTb=p;
 pI->pBgNdx = (struct indStr*)	// тип вказівника на сегмент
		malloc(p->nFlEl*ln*		// кількість елементів
				sizeof(struct indStr));
 pI->pRtNdx = NULL;
 pCur = pI->pBgNdx;
 for(n0=0; n0<ln; n0++)	// побудова індексу як списку
	{pCur[n0].pKyStr = &((p->frstSg->pRcPtr+n0)->key);
	 pCur[n0].pRtPtr = NULL;
	 pCur[n0].pLtPtr = NULL;
	 if(n0){pCurl = pI->pRtNdx; pCurp0 = pCurp = &(pI->pRtNdx);
	   while(pCurl)
		{if(cmpKys(pCur[n0].pKyStr,pCurl->pKyStr)<0)
			{pCur[n0].pRtPtr = pCurl;
			 if(pCurp==pCurp0)*pCurp0=pCur+n0;
			 else (*pCurp0)->pRtPtr=pCur+n0;
			 break;}
		 else{pCurp0=pCurp;
			  pCurp=&(pCurl->pRtPtr);
			  pCurl=pCurl->pRtPtr;
		 if(pCurl==0)*pCurp=pCur+n0;}}}
	 else pI->pRtNdx = pCur;
	}
 return pI;
}
// перебудова списку в двійкове дерево
void	cvLsBn(struct hdIxStr*p)
{int n, ln=p->pHdTb->frstSg->nFlEl-1;
 struct indStr *pCur0, *pCur=p->pRtNdx, *pCur1=pCur;
 for(n=0;;n++)
	{pCur0=pCur;
	 pCur=pCur->pRtPtr;
	 if(2*(n+1)>=ln)
	 {pCur->pLtPtr=pCur1;
	  p->pRtNdx=pCur;
	  pCur0->pRtPtr=NULL;
		 break;}};
}
// додавання елементу до індекса 
void	insDnIx1(struct hdIxStr*p, struct keyStr* kIns)
{struct indStr*ps = p->pRtNdx->pRtPtr;// початковий сегмент 
 while(ps)ps=ps->pRtPtr;
 ps->pRtPtr = (struct indStr*)// записи
		malloc(ps->pKyStr->nMod*sizeof(struct indStr));
}
// додавання нового сегменту до індекса ???
void	extDnIx1(struct hdIxStr*p, struct keyStr* kIns)
{struct indStr*ps = p->pRtNdx->pRtPtr;// початковий сегмент 
 while(ps)ps=ps->pRtPtr;
 ps->pRtPtr = (struct indStr*)// записи
		malloc(ps->pKyStr->nMod*sizeof(struct indStr));
}
