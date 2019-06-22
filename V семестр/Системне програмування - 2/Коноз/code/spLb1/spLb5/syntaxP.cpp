#include "stdafx.h"
#include "..\spLb3\token.h"
#include "syntaxP.h"
extern enum tokPrec opPrFC[256];
extern enum tokPrec opPrGC[256];
extern enum tokPrec opPrFP[256];
extern enum tokPrec opPrGP[256];
enum tokPrec *opPrF,*opPrG;
extern char *oprtrC[], *oprtrP[], *oprtrV[],
			*cprC[], *cprP[], *cprV[];
extern char **oprtr, **cpr,
	modeP, // тип роздільника операторних дужок для Паскаля
	modeC, // тип роздільника операторних дужок для С
	modeL; 
void SxAnInit(char nl)
{char i=0;
 switch (nl)
 {case 'P': opPrF=opPrFP; opPrG=opPrGP; modeC=0; 
		modeL=modeP; modeP=1; oprtr=oprtrP; cpr=cprP;
	 break;
 case 'V':
 default:
 case 'C':opPrF=opPrFC; opPrG=opPrGC; modeP=0; 
		modeL=modeC; modeC=1; oprtr=oprtrC; cpr=cprC;
}
}
int nxtProd(struct lxNode*nd,	// вказівник на початок масиву вузлів 
 		  int nR,	// номер кореневого вузла
 		  int nC)	// номер поточного вузла
{int n=nC-1;		// номер попереднього вузла
 enum tokPrec pC = opPrF[nd[nC].ndOp],// передування поточного вузла
	*opPr=opPrG;//F;// nd[nC].prvNd = nd+n;
 while(n!=-1)	// цикл просування від попереднього вузла до кореню
 {if(opPr[nd[n].ndOp]<pC//)// порівняння функцій передувань
		&&nd[n].ndOp</*_ctbz*/_frkz)
 {if(n!=nC-1&&nd[n].pstNd!=0)		// перевірка необхідності вставки
		{nd[nC].prvNd = nd[n].pstNd;	// підготовка зв’язків 
		 nd[nC].prvNd->prnNd=/*nd+*/nC;}	// для вставки вузла
	 if(opPrF[nd[n].ndOp]==pskw&&nd[n].prvNd==0)nd[n].prvNd = nd+nC;
		 else nd[n].pstNd = nd+nC;
	 nd[nC].prnNd=/*nd+*/n;	// додавання піддерева
	 return nR;}
  if(opPrG[nd[n].ndOp]==pC&&
	  (nd[n].ndOp==_brkt||nd[n].ndOp==_ixbr||nd[n].ndOp==_opbr||nd[n].ndOp==_tdbr))
  {nd[n].ndOp=(enum tokType)((nd[n].ndOp-_fork)/2+_frkz);//09.04.07	  
	nd[nC]=nd[n];
   if(nd[nC].prnNd==-1){nR=nC; nd[nR].prnNd=-1;}
   else if(opPrF[nd[nd[nC].prnNd].ndOp]==pskw&&nd[nC].ndOp<_frkz)
	   nd[nd[nC].prnNd].prvNd = nd+nC;
   else if(opPrF[nd[nd[nC].prnNd].ndOp]==pekw&&nd[nC].ndOp==_opbz)
   {nd[nd[nC].prnNd].prvNd =nd+nC;nd[nd[nC].prnNd].pstNd=0;}
	  return nR;}
/*  if(nd[n].ndOp==_brkt||nd[n].ndOp==_ixbr||nd[n].ndOp==_opbr||nd[n].ndOp==_tdbr)
	{nd[nC].prnNd=n; nd[nC].prvNd=nd[n].pstNd; 
	 nd[n].pstNd->prnNd=nC; nd[n].pstNd= nd+nC;
	 return nR;}*/
  n=nd[n].prnNd;
  opPr=opPrG;}	// просування до кореню
//  if(n<=)	else 
  nd[nC].prvNd = nd+nR; nd[nR].prnNd=/*nd+*/nC; nR = nC; nd[nR].prnNd=-1;
return nR;}
int	prCmpr(struct lxNode*nd, int nn, int nr) //компресія для скорочення графа
{int nR, nN=0, nC=0;
do{
	if((nd+nN)->ndOp==_remL||(nd+nN)->ndOp==_rem)
	{if(nd[nN].pstNd>&nd[nN]&&nd[nN].prnNd!=-1)
		{if(nC-nN>1)nd[nN]=nd[nC];
//		 nN++; 
		 nC++; continue;}
	}
//	if(nR<-1){nC++; continue;}
	if(nr==nC)nr=nN;
	if(nd[nC].ndOp==_brkz&&nd[nC].prvNd==0)
	{if(nd[nd[nC].prnNd].prvNd==&nd[nC])
		{nd[nC].pstNd->prnNd=nd[nC].prnNd;
		 nd[nd[nC].prnNd].prvNd=nd[nC].pstNd;}
	 if(nd[nd[nC].prnNd].pstNd==&nd[nC])	// b 02/06/07
		{nd[nC].pstNd->prnNd=nd[nC].prnNd;
		 nd[nd[nC].prnNd].pstNd=nd[nC].pstNd;}// e 02/06/07
		nC++;
	}
	if(nN!=nC)
	{nR=nd[nC].prnNd;
	 nd[nN]=nd[nC];
//зв'язок з батьківським вузлом
	 if(nd[nR].prvNd==&nd[nC])
		 nd[nR].prvNd=&nd[nN];
	 if(nd[nR].pstNd==&nd[nC])
		 nd[nR].pstNd=&nd[nN];
	 if(nd[nN].ndOp>_cnst){
//зв'язок з лівим наступником
	 if(nd[nN].prvNd)
		 nd[nN].prvNd->prnNd=nN;
//зв'язок з правим наступником
	 if(nd[nN].pstNd)
		 nd[nN].pstNd->prnNd=nN;
	 }
//	 if(nR<nN)nd[nN].prnNd=nR;
//	 nd[nR].prvNd
	}
//	 else nC
//}else
	nN++; nC++;
}while(nC<nn);
return nr;
}
