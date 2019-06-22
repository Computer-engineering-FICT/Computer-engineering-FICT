#include "stdafx.h"
//#include "interp.h"
#include "..\spLb3\token.h"
#include "..\spLb3\visgrp.h"
#include "..\spLb4\index.h"
#include "..\spLb4\langio.h"
#include "..\spLb5\syntaxP.h"
#include "seman.h"
#include "codgen.h"
#include <stdio.h>
#include <string.h>
extern struct lxNode nodes[MAX_NODES];
extern unsigned bcnst32_buf[MAX_UCNST];
extern int nInBg, nInCr;
extern struct indStrUS ndxNds[50];
extern struct recrdSMA	ftImp;
extern struct recrdSMA	ftTbl[635];
extern _fop *_paddf;
//#define iMode 0		// первинний режим
#define iMode 1		// табличний режим
//#define iMode 2		// режим Асемблера
/*void*	StIntrp(struct lxNode * nd,	// вказівник на корінь дерева вузлів 
 		  int nR)	// номер кореневого вузла
{//void *vp1, *vp2;	// розподіл памяті з кореню дерева, але можна зайти з таблиці
 if(nd->ndOp==_nam||nd->ndOp>=_EOS)

}*/
union gnDat acc32; 
int cc, jmpNmb=0;
union gnDat stk[32];
char sCom[128]="";
unsigned char sPtr=0;
void push(union gnDat d)
{stk[sPtr++]=d;
}
void pop(union gnDat *pd)
{*pd=stk[--sPtr];
}
unsigned nLcCr=0;
void clDtLst(struct lxNode * nd, int tp, unsigned *pD)
{if(nd->ndOp==_comma)
	{clDtLst(nd->prvNd, tp, pD);
	 switch(tp)
		{case _f: /*cnvTo_f(nd->pstNd->dataType,
				 (union gnDat *)(pD+nLcCr),(union gnDat *)nd->pstNd->pstNd);*/ break;//
		 case _ui: case _si: /*cnvTo_i(nd->dataType,
				 (union gnDat *)(pD+nLcCr),(union gnDat *)nd->pstNd->pstNd)*/;
		}nLcCr++;//
}else if(nd->ndOp==_srcn)
	{switch(tp)
		{case _f: /*cnvTo_f(nd->dataType,
				 (union gnDat *)(pD+nLcCr),(union gnDat *)nd->pstNd);*/ break;//
		 case _ui: case _si: /*cnvTo_i(nd->dataType,
				 (union gnDat *)(pD+nLcCr),(union gnDat *)nd->pstNd)*/;
		}nLcCr++;//
	}
}
struct lxNode *trmGrdt(struct lxNode * nd)
{if(nd->ndOp!=_nam)return trmGrdt(nd->prvNd);
 return nd;
}
void prAss(struct lxNode * nd)
{prLxTxt(nd);
 if(nd->prvNd->dataType>=_f)printf(" => %7.3g ->",acc32._fd);
 else printf(" => %7d ->",acc32._id);
 prLxTxt(nd->prvNd);printf("\n");
}
short nBgCkl[128];// номери міток початків вкладених циклів
char dfnFlg=0,*lblForHd="", nbNst=0,
	 hxNmb[17]="0123456789ABCDEF";
void cnvLb(char*lb, int nj)
{int n=4; //=jmpNmb++;
	for(;n>0;n--)
	{lb[n]=hxNmb[nj%16];
	 nj/=16;}
}
void EpCdGen(struct lxNode * nd)	// вказівник на корінь дерева вузлів);
{WriteCod("}\nreturn 0;\n}");
}
extern FILE *fi_progrC;
void dclCdGen(struct lxNode * nd)	// вказівник на корінь дерева вузлів 
{if(nd->ndOp>=_void&&nd->ndOp<_fork)prLxTxt(nd,fi_progrC);
 else if(nd->ndOp==_EOS)
 {if(nd->prvNd)dclCdGen(nd->prvNd);
  if(nd->prvNd->ndOp>=_void&&nd->prvNd->ndOp<_fork)WriteCod(";\n");
  if(nd->pstNd)dclCdGen(nd->pstNd);
 }
}
void PrCdGen(struct lxNode * nd,char*fn)	// вказівник на корінь дерева вузлів);
{opFlsC(fn);
 WriteCod("// spLb9c.cpp: Визначає вхідну точку для консольної прикладної програми.\n");
 WriteCod("//\n\n#include \"stdafx.h\"\n\n\n");
 WriteCod("int main(int argc, char* argv[])\n{");
 dclCdGen(nd);
 WriteCod(";\n_asm{");
}
union gnDat* SmCdGen(struct lxNode * nd,	// вказівник на корінь дерева вузлів 
 		  int incR)	// кількість повторень
{union gnDat *vp1, *vp2; 
 char//*name, 
	 *sOp1="", *sOp2="", lbl0[6]="_0000", lbl1[6]="_0000", lbl2[6]="_0000";
 int lcLbl;
 struct lxNode *nt;
// struct indStrUS *pRtNdx;
 if(nd->ndOp>=_void&&nd->ndOp<=_fork)
	return &acc32;	//термінали описів
 else if(nd->ndOp>_cnst&&nd->ndOp!=_remL)//>=_EOS
	{
	if(nd->ndOp>=_void&&nd->ndOp<_fork)dfnFlg=1;
	if(dfnFlg!=0&&nd->prvNd&&nd->ndOp==_ass)
	 {vp1=SmCdGen(nd->prvNd,1);
		if(nd->pstNd->ndOp==_tdbz)
		{nt=trmGrdt(nd->prvNd); nLcCr=0;
			clDtLst(nd->pstNd->pstNd,nt->dataType&0x7FF, 
				(unsigned*)nt->pstNd);
//			if(nd->prvNd->ndOp==_ixbz)return vp2;
		}/*else{
//			vp1=SmIntrp(nd->prvNd,1);
			vp2=SmCdGen(nd->pstNd,1);
			sOp2=(char*)(nd->prvNd->prvNd);
			if(nd->prvNd->dataType>=_f)
				{if(nd->pstNd!=0&&nd->pstNd->dataType<_f)
					{sOp1="eax";
					 if(nd->pstNd->dataType<=_cnst)
						sOp1=(char*)(nd->pstNd->pstNd);
						sprintf(sCom,"\n\tpush\t%s\n\tfild\tdword ptr[esp]",sOp1);
						WriteCod(sCom);
						sprintf(sCom,"\n\tadd\tesp,4\n\tfstp\t%s",sOp2);
					}else
				 sprintf(sCom,"\n\tfstp\t%s",sOp2);
			}else{
				if(nd->pstNd->dataType<_f) 
				 sprintf(sCom,"\n\tmov\t%s,eax",sOp2);
			else sprintf(sCom,"\n\tfistp\t%s",sOp2);}}
				 WriteCod(sCom);
		prAss(nd);*/
		return &acc32;}
//	sOp2="";
	if(nd->prvNd!=0&&nd->ndOp!=_ixbz
		 &&((nd->ndOp&(~_lVlu))>_ass||(nd->ndOp&(~_lVlu))<=_qmrk))
	 {if(nd->prvNd->ndOp<=_cnst)sOp2=(char*)(nd->prvNd->prvNd);
		else sOp2="";//if(sOp2==0)sOp2=""; 
	  if(nd->ndOp==_whileP)
		{nBgCkl[nbNst++]=jmpNmb;
		 if(nd->prvNd->ndOp==_repeat)
			{//cnvLb(lbl0,jmpNmb);
			 nd->ndOp=_whileN;}
		 else {cnvLb(lbl0,jmpNmb++);//,
				sOp1=lbl0;
				sprintf(sCom,"\n%s:",sOp1);
				WriteCod(sCom);}
	  }else if(nd->ndOp==_for)
	  {nBgCkl[nbNst++]=jmpNmb;
	   cnvLb(lbl0,jmpNmb++);//,
		lblForHd=lbl0;
	  }
	  else sOp1="";
	  if(nd->prvNd->ndOp>_cnst)
	  {vp1=SmCdGen(nd->prvNd,1);
	   if(*lblForHd!=0&&nd->ndOp==_EOS&&(nd->prvNd==0||nd->prvNd->ndOp>=_comma)
		   &&(nd->pstNd==0||nd->pstNd->ndOp>=_comma))
	   {sprintf(sCom,"\n%s:",lblForHd);
				WriteCod(sCom);}
	  }
	  else if(nd->pstNd!=0&&(nd->ndOp&_lVlu)==0)
		{if((nd->prvNd->dataType&(cdCns-1))<_f||nd->prvNd->dataType>=cdPtr)
		 {if((nd->pstNd->dataType&(cdCns-1))<_f||nd->ndOp<_cln)
			{if(nd->prvNd->dataType&cdArr)sprintf(sCom,"\n\tlea\teax,%s",sOp2);
				else sprintf(sCom,"\n\tmov\teax,%s",sOp2);
			 if(nd->ndOp!=_div&&nd->ndOp!=_mul&&nd->ndOp!=_mod) sOp1="eax,";
			}else 
			 sprintf(sCom,"\n\tfild\t%s",sOp2);
		 }else if((nd->prvNd->dataType&msStp)>=_f)
			 sprintf(sCom,"\n\tfld\t%s",sOp2);
		 WriteCod(sCom); sOp2="";
	 		}
	 }
	if(nd->ndOp==_repeat)
	{cnvLb(lbl0,jmpNmb++);//,
		sOp1=lbl0;
		sprintf(sCom,"\n%s:",sOp1);
		WriteCod(sCom); 
		if(nodes[nodes[nd->prnNd].prnNd].pstNd->ndOp==_whileP)
			 nodes[nodes[nd->prnNd].prnNd].pstNd->ndOp=_whileN;
	}
	if(nd->pstNd)
	 {if((nd->ndOp&(~_lVlu))>_ass&&nd->ndOp<=_frkz&&nd->prvNd
		&&nd->prvNd->ndOp>_cnst&&nd->pstNd->ndOp>_cnst)
		{if(nd->prvNd!=0&&(nd->prvNd->dataType&msStp)<_f)
			{sprintf(sCom,"\n\tpush\teax");
				 WriteCod(sCom);
		 if((nd->pstNd->dataType&msStp)>=_f)
		  {sprintf(sCom,"\n\tfild\t[esp]\n\tadd esp,4");
				 WriteCod(sCom);
			}}}
//		push(acc32);
		if(nd->pstNd!=0&&(nd->ndOp>_fork&&nd->ndOp!=_qmrk&&nd->ndOp!=_cln
			/*||nd->ndOp==_whileN*/)
			/*&&nd->ndOp!=_if&&nd->ndOp!=_else*/)
			{if(nd->pstNd->ndOp>_cnst)
				{vp2=SmCdGen(nd->pstNd,1);
				 if(*lblForHd!=0&&nd->ndOp==_EOS&&(nd->prvNd==0||nd->prvNd->ndOp>=_comma)
					&&(nd->pstNd==0||nd->pstNd->ndOp>=_comma))
				   {cnvLb(lbl0,nBgCkl[nbNst-1]+1);
					sprintf(sCom,"\n\ttest\teax,eax\n\tjz\t%s",lbl0);
					WriteCod(sCom);
					lblForHd="";
				 }
				 if((nd->ndOp&(~_lVlu))<=_ass&&(nd->ndOp&(~_lVlu))>_qmrk
					&&(((nd->prvNd->dataType&msStp)>=_f&&(nd->pstNd->dataType&msStp)<_f)
					||((nd->prvNd->ndOp&_lVlu)!=0)&&nd->prvNd->pstNd!=0
						&&nd->prvNd->pstNd->ndOp>_ass))
					{sprintf(sCom,"\n\tpush\teax",sOp2);
					 //\n\tfild\t[esp]\n\tadd\tesp,4
					 WriteCod(sCom); sOp2="[esp]";}
				}
			 else if((nd->ndOp&(~_lVlu))<=_ass&&(nd->ndOp&(~_lVlu))>_qmrk)
				{sOp2=(char*)(nd->pstNd->prvNd); 
				 if((nd->pstNd->dataType&msStp)<_f)
				 {if((nd->prvNd->dataType&msStp)<_f)
					{sprintf(sCom,"\n\tmov\teax,%s",sOp2);
					 if(nd->ndOp!=_div&&nd->ndOp!=_mul&&nd->ndOp!=_mod)
						 sOp1="eax,";
					}/*else -11.07.07
					 sprintf(sCom,"\n\tfild\t%s",sOp2);*/
				 }/*else if((nd->prvNd->dataType&msStp)>=_f)
			 sprintf(sCom,"\n\tfld\t%s",sOp2);
			 WriteCod(sCom); sOp2="";*/
	}	}	}
	else if(nd->ndOp==_brkz)//||nd->ndOp==_whileN)
	{vp2=SmCdGen(nd->pstNd,1);
		return &acc32;
	}
	if(/*(nd->ndOp&(~_lVlu))==_ixbz||*/(nd->ndOp&_lVlu)!=0&&nd->prvNd->ndOp>_cnst)
	 {vp1=SmCdGen(nd->prvNd,1);//vp2->_id);
//	  if(nodes[nd->prnNd].pstNd->ndOp==_tdbz)
	}
//вирівнювання типів
	if(nd->ndOp>=_void&&nd->ndOp<_fork)
	{dfnFlg=0;
		return NULL;
	}
	if(dfnFlg!=0||(nd->ndOp>=_eosP&&nd->ndOp<=_EOS))
		return NULL;
	*sCom=0;
/*	if(nd->prvNd&&nd->prvNd->ndOp<=_cnst)
		sOp2=(char*)(nd->prvNd->prvNd); */
	if((nd->dataType&msStp)<_f&&nd->prvNd!=0&&(nd->prvNd->dataType&msStp)<_f
			 &&nd->pstNd!=0&&(nd->pstNd->dataType&msStp)>=_f&&(nd->ndOp&(~_lVlu))>_gt)//>_ass)
		 {sOp1="eax";
		  if(nd->prvNd->dataType<=_cnst)sOp1=sOp2;
			 sprintf(sCom,"\n\tpush\t%s\n\tfild\t[esp]\n\tadd\tesp,4",sOp1);
				 WriteCod(sCom); sOp1="";
	}else /*if((nd->dataType&msStp&msStp)>=_f&&nd->pstNd!=0
			 &&(nd->pstNd->dataType&msStp)<_f 
			 &&(nd->ndOp&(~_lVlu))>=_asOr&&(nd->ndOp&(~_lVlu))<=_ass)//Shl)
		 {//sOp1="eax";//10.07.07
		  if(nd->prvNd->dataType<=_cnst){sOp1=sOp2;
		  sprintf(sCom,"\n\tpush\t%s",sOp1);
		  WriteCod(sCom); sOp1="[esp]";}
	}else*/ if(nd->ndOp>_ass&&nd->ndOp<=_frkz&&nd->prvNd
		&&nd->prvNd->ndOp>_cnst&&nd->pstNd->ndOp>_cnst)
		  {if((nd->pstNd->dataType&msStp)<_f){
			   if(nd->prvNd!=0&&(nd->prvNd->dataType&msStp)<_f)
				{sOp2=",eax";}
			   if((nd->prvNd->dataType&msStp)>=_f)
				   WriteCod("\n\tpush\teax");
			   else if(nd->ndOp==_div||nd->ndOp==_mul||nd->ndOp==_mod)
					{WriteCod("\n\txchg\teax,[esp]");sOp2="";}
			   sOp1="[esp]";
	}}else if((nd->dataType&msStp)<_f&&nd->prvNd!=0&&(nd->prvNd->dataType&msStp)<_f
		&&nd->pstNd!=0&&(nd->pstNd->dataType&msStp)<_f&&(nd->ndOp&_lVlu)==0)
			{if(nd->ndOp!=_div&&nd->ndOp!=_mul&&nd->ndOp!=_mod
			 &&nd->ndOp!=_shRgt&&nd->ndOp!=_shLft)
			sOp1="eax,";else sOp1="";}//\t
	  else if(nd->prvNd==0&&nd->pstNd!=0&&nd->pstNd->ndOp<=_cnst)
		  sOp2=(char*)(nd->pstNd->prvNd);
	if((nd->ndOp>_cnst&&nd->ndOp<_with&&nd->ndOp!=_whileN)
		||nd->ndOp==_qmrk||nd->ndOp==_cln)
		{lcLbl=jmpNmb++; cnvLb(lbl1,lcLbl);//,
		 sOp1=lbl1;}
	if(nd->ndOp==_break)
		{cnvLb(lbl0,nBgCkl[nbNst-1]+1);
		 sOp1=lbl0;
		}
	if(nd->ndOp==_continue)
		{cnvLb(lbl0,nBgCkl[nbNst-1]);
		 sOp1=lbl0;
		}
	if(nd->ndOp==_for||nd->ndOp==_whileN)
		{cnvLb(lbl1,nBgCkl[nbNst-1]); sOp1=lbl1; 
		 cnvLb(lbl0,nBgCkl[nbNst-1]+1); sOp2=lbl0;
		 vp2=SmCdGen(nd->pstNd,1);
		 nbNst--;
		}
	// сюди вставляти потрібні операції
		 ftImp.oprd1=0; ftImp.ln1=0;
		 ftImp.oprd2=0; ftImp.ln2=0;
	if(nd->prvNd){ftImp.oprd1=nd->prvNd->dataType&(~cdCns); 
			 ftImp.ln1=nd->prvNd->resLength;}
	if(nd->pstNd){ftImp.oprd2=nd->pstNd->dataType&(~cdCns); 
			 ftImp.ln2=nd->pstNd->resLength;}
	ftImp.oprtn=nd->ndOp;
	struct recrdSMA*
			 pftImp = selBin(&ftImp, ftTbl, 635);
	if(pftImp)
		 {//sOp2="";
/*		  if(nd->pstNd!=0&&nd->pstNd->ndOp<=_cnst)
			  sOp2=(char*)(nd->pstNd->prvNd);*/
		  strcpy(sCom, pftImp->assCd);
		  if((nd->ndOp&(~_lVlu))>_qmrk&&(nd->ndOp&(~_lVlu))<=_ass)
		  {if(!strcmp(sOp1,"[esp]")) sOp2=sOp1;
			else if(((nd->pstNd->dataType&msStp)<_f&&(nd->dataType&msStp)<_f)
				||(nd->pstNd->dataType&msPtr))sOp2="eax";
			  sOp1=(char*)(nd->prvNd->prvNd);//???
			if((nd->prvNd->dataType&msStp)<_f&&(nd->pstNd->dataType&msStp)<_f
				&&(nd->ndOp==_asDiv||nd->ndOp==_asMod))
				sOp2=sOp1;
			if(nd->ndOp&_lVlu)sOp1="[eax]";
		  }
		  else if((nd->ndOp&(~_lVlu))==_ixbz)
		  {sOp2=(char*)(nd->prvNd->prvNd);
			if(nd->pstNd->ndOp<=_cnst)
			   sOp1=(char*)(nd->pstNd->prvNd);
			else sOp1="eax";
		  }
		  else if((nd->ndOp>=_dcr&&nd->ndOp<=_inr)
			  /*||nd->ndOp==_shRgt||nd->ndOp==_shLft*/)
			{ if(nd->pstNd)sOp1=sOp2=(char*)(nd->pstNd->prvNd);
				else sOp1=sOp2=(char*)(nd->prvNd->prvNd);}
		  else if(/*((nd->ndOp>_EOF&&nd->ndOp<=_neB)
			  ||(nd->ndOp>=_mod&&nd->ndOp<=_in))*/
			  (nd->ndOp==_shRgt||nd->ndOp==_shLft)
			  &&nd->pstNd&&nd->pstNd->ndOp<=_cnst)
			   sOp1=(char*)(nd->pstNd->prvNd);
		  else if(((nd->ndOp>_EOF&&nd->ndOp<=_neB)
			  ||(nd->ndOp>=_mod&&nd->ndOp<=_in))		  
			  &&nd->pstNd&&nd->pstNd->ndOp<=_cnst)
			   sOp2=(char*)(nd->pstNd->prvNd);
		 sprintf(sCom, pftImp->assCd,sOp1,sOp2,sOp1);
		 WriteCod(sCom);
		 if(nd->ndOp<=_ass&&nd->ndOp>_qmrk) prAss(nd);
//			acc32=pftImp->pintf(vp1,vp2);/*_paddf*/
	  if(nd->pstNd!=0&&nd->ndOp>_ass&&nd->ndOp<=_frkz&&nd->prvNd
		&&nd->prvNd->ndOp>_cnst&&nd->pstNd->ndOp>_cnst&&(nd->dataType&msStp)<_f
		&&nd->ndOp!=_div&&nd->ndOp!=_mul&&nd->ndOp!=_mod)
				WriteCod("\n\tpop\teax");
	  else if(!strcmp(sOp1,"[esp]")||!strcmp(sOp2,"[esp]")) 
			{sprintf(sCom,"\n\tadd\tesp,4");
				WriteCod(sCom);}
	}
	if(nd->ndOp==_if||nd->ndOp==_cln||nd->ndOp==_else||nd->ndOp==_qmrk
		||nd->ndOp==_whileP||nd->ndOp==_repeat)
//		&&cc!=0)
		{if(nd->pstNd!=0)
			{if(nd->pstNd->ndOp>_cnst)
				vp2=SmCdGen(nd->pstNd,1);
			 else 
			 {if((nd->pstNd->dataType&msStp)<_f)
				sprintf(sCom,"\n\tmov\teax,%s",(char*)(nd->pstNd->prvNd));
			 else sprintf(sCom,"\n\tfld\t%s",(char*)(nd->pstNd->prvNd));
				WriteCod(sCom);}
			 }
		 if(nd->ndOp==_whileP)
		 {sprintf(sCom,"\n\tjmp\t%s",lbl0);
				WriteCod(sCom);}
		 sOp1=""; lbl2[0]=0;
		 if((nd->ndOp==_if&&nodes[nd->prnNd].ndOp==_else)||nd->ndOp==_qmrk)
		 {sOp1="\n\tjmp\t"; lbl2[0]='_';
		  cnvLb(lbl2,lcLbl+1);}
		 if(nd->ndOp!=_repeat)
		 {sprintf(sCom,"%s%s\n%s:",sOp1,lbl2,lbl1); lbl2[0]='_';
			WriteCod(sCom);}}
//		 cnvLb(lbl0,++jmpNmb);//,
			return vp1=(union gnDat*)nd->pstNd;
 }else if(nd->ndOp==_srcn)//_cnst
		 {return vp1=(union gnDat*)nd->pstNd;
 }/*else if(nd->ndOp==_whileP)//_cnst
 {do{
	 vp1=SmCdGen(nd->prvNd->pstNd,1);
	 if(vp1->_id)vp2=SmCdGen(nd->pstNd,1);
	 else return vp1;
 }while(vp1->_id);  
 }*/
	return &acc32;
}