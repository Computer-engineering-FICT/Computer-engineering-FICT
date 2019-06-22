#include "stdafx.h"
#include "..\spLb3\token.h"
#include "tables.h"
#include "index.h"
#include <stdlib.h>
// порівняння рядків
// порівняння терміналів за відношенням порядку
int cmpTrm(struct lxNode*k0,struct lxNode*kArg)//cmpKys
{int i=cmpStr((unsigned char*)k0->prvNd,
			  (unsigned char*)kArg->prvNd);
 if(i)return i;
 return k0->stkLength - kArg->stkLength; // порівняння номерів модулів
}
unsigned nNdxNds=0;
struct indStrUS ndxNds[50]={{NULL,NULL,NULL,0}}, 
		*pRtNdx=ndxNds, nilNds={NULL,NULL,NULL,0};
// вибірка через пошук за двійковим деревом
struct indStrUS*selBTr(struct lxNode*kArg,struct indStrUS*rtTb)
{int df;
 while(df=cmpTrm(kArg,rtTb->pKyStr))
	if(df>0){if(rtTb->pRtPtr)rtTb=rtTb->pRtPtr;
			 else break;}
	else{if(rtTb->pLtPtr)rtTb=rtTb->pLtPtr;
		else break;}
 rtTb->dif=df;
 return rtTb;
}
// включення через пошук за двійковим деревом
struct indStrUS*insBTr(struct lxNode*pElm,struct indStrUS*rtTb)
{struct indStrUS*pInsNod;//,*pNod;
 if(rtTb->pKyStr==NULL)
 {rtTb->pKyStr=pElm;
  return rtTb;
 }
// if(rtTb->pKyStr->ndOp==_nil)rtTb->pKyStr=pElm;
 else{pInsNod=selBTr(pElm,rtTb);
	  if(pInsNod->dif)
	  {ndxNds[++nNdxNds]=nilNds; 
	   if(pInsNod->dif<0)pInsNod=pInsNod->pLtPtr=ndxNds+nNdxNds;
	   else pInsNod=pInsNod->pRtPtr=ndxNds+nNdxNds;
	   ndxNds[nNdxNds].pKyStr=pElm;
	  }
	}
 return pInsNod;
}
