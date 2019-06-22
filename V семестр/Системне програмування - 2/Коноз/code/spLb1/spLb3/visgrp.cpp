#include "stdafx.h"
#include "visgrp.h"
#include "token.h"
extern char *oprtrC[], *oprtrP[], *oprtrV[],
			*cprC[], *cprP[], *cprV[], **oprtr, **cpr,
	modeP,//=1, // тип роздільника операторних дужок для Паскаля
	modeC,//=0, // тип роздільника операторних дужок для С
	modeL;//=modeC; 
char	mode=0;  // mode=0 режим генерації роздільника
 // mode=1 режим генерації слова
 // mode=2 режим генерації одного вкладеного оператора в С
char fpr[]= {0,0x4f,0x4f,0x4f,0x46,0x11,6,0x12,
				0x13,0x4e,0x12,0x1, 0x4e,0x4e,0x4e,0x4e,
				0x4e,0x4e,0x13,0x4e, 0x4e, 0x9, 0x9, 0x9, 
				0x4e,0x4e,0x4e,0x4e, 
				0x4e,0x4e,0x4e,0x4e, 0x4e,0x4e,0x4e,0x4e, 
				0x4e,0x4e,0x4e,0x4e, 0x4e,0x4e,0x4e,0x4e, 
				0x4e,0x4e,0x4e,0x4e, 0x4e,0x4e,0x4e,0x4e, 
				0x4e,0x4e,0x4e,0x4e, 0x4e,0x4e,0x4e,0x4e, 0x4e,0x4e,
				0x4f,0x4f,0x4f,0x4f, //Verilog+4
				0x4f,0x4f,0x4f,0x4f,  //Verilog+8
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,0x4f, //Verilog+15
				0x4f,0x4f,0x4f,0x4f,   //Verilog+19
				0x4f,0x4f,0x4f,0x4f,0x4f, //Verilog+24
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,0x4f, //Verilog+31
				0x4f,0x4f,0x4f,0x4f, //Verilog+35
				0x4f,0x4f,0x4f,0x4f,0x4f, //Verilog+40
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+46
				0x4e,0x4e, 0x4e,0x4e,0x4e,0x4e, 
				0x4f,0x4f,0x4f,  //Verilog|SQL+3
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f, //P++9
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f, //C++15
				0x4f,0x4f,0x4f,0x4f,0x4f/*raise*/, //C++20
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,	//Verilog+26
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,	//Verilog+32
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+38
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,	//Verilog+44
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,	//Verilog+50
				0x4f,0x4f,0x4f,0x4f,		//Verilog+54
				0x4f,0x4f,0x4f,0x4f,		//Verilog+58
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+64
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+70
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+76
				0x42, 0x2, 0x42,2,0x43,3, 0x44,4,0x45,5,0x46,6,  
				0x1, 0x1, 0x1, 0x2, 0x2, 0x43, 
				0x10,0x10,0x10,0x10, 0x10,0x10,0x10,0x10, 
				0x10,0x10,0x10, 0x3C,0x3C,
				0x3C,0x3C, 0x3E,0x3E,0x3E,0x3E,
				0x1A,0x1A,0x1C,0x1C,0x1A,0x1A, 
				0x20, 0x20, 0x30, 0x30,
				0x3E,0x3E, 0x3A,0x1E,0x1E,0x1C, 0x1C, 
				0x4E,0x4E,0x4E,0x4E,  
				0x11, 0x1C, 0x1C,0x15,	// PV+4 .. _lmts,_eqar,_astar,_trasand,
				0x3C,0x3C,0x3C,0x3C,0x3C,0x3C,0x3C, //V+11 _orR,_andR,_xorR,_norR,_nandR,_nxorR,_xornR
				0x3C,0x3C,0x3C, //V+14 _delay,_event,_events,
				0x16,0x18,0x17,0x17, 0x3C, 
				0x1,0x1, 0x30,0x16,0x18,0x17, 	// %(mod) |(or) &(and) ^(xor)
				0x1E,0x1E,0x13,0x15,	//<<(shl) >>(shr) ||(or) &&(and)  
				0x4E,0x4E,0x30,0x12,
				0x4e,0x4e,0x15,
				0x42,0x42,0x43,0x44,0x45,0x46
				},
	 gpr[]= {0, 0x4f, 0x4f, 0x4f, 6,0x12,6,0x12,
				0x13,0x4e,0x12,0x1, 0x12,0x1,0x4e,0x4e, 
				0x11,0x1,0x1,0x11, 0x11, 0x9, 0x9, 0x9, 
				0x11,0x1,0x1,0x11, 
				0x01,0x01,0x01,0x01, 0x01,0x01,0x01,0x01, 
				0x01,0x01,0x01,0x01, 0x01,0x01,0x01,0x01, 
				0x01,0x01,0x01,0x01, 0x01,0x01,0x01,0x01, 
				0x01,0x01,0x01,0x01, 0x01,0x01,0x01,0x01, 0x01,0x01,
				0x4f,0x4f,0x4f,0x4f, //Verilog+4
				0x4f,0x4f,0x4f,0x4f,  //Verilog+8
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,0x4f, //Verilog+15
				0x4f,0x4f,0x4f,0x4f,   //Verilog+19
				0x4f,0x4f,0x4f,0x4f,0x4f, //Verilog+24
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,0x4f, //Verilog+31
				0x4f,0x4f,0x4f,0x4f, //Verilog+35
				0x4f,0x4f,0x4f,0x4f,0x4f, //Verilog+40
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+46
				0x01,0x01, 0x01,0x01,0x01,0x01, 
				0x4f,0x4f,0x4f,  //Verilog|SQL+3
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f, //P++9
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f, //C++15
				0x4f,0x4f,0x4f,0x4f,0x4f/*raise*/, //C++20
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,	//Verilog+26
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,	//Verilog+32
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+38
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,	//Verilog+44
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,	//Verilog+50
				0x4f,0x4f,0x4f,0x4f,		//Verilog+54
				0x4f,0x4f,0x4f,0x4f,		//Verilog+58
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+64
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+70
				0x4f,0x4f,0x4f,0x4f,0x4f,0x4f,  //Verilog+76
				0x2, 0x2, 2,2,0x3,3, 0x4,4,0x5,5,0x6,6, 
				0x1, 0x1, 0x1, 0x2, 0x2, 0x43, 
				0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 
				0x10,0x10,0x10, 0x3C,0x3C, 
				0x3C,0x3C, 0x3E,0x3E,0x3E,0x3E,
				0x1A,0x1A,0x1C,0x1C,0x1A,0x1A, 
				0x20, 0x20, 0x30, 0x30,
				0x3E,0x3E, 0x34,0x1E,0x1E,0x1C, 0x1C, 
				0x4E,0x4E,0x4E,0x4E, 
				0x11, 0x1C, 0x1C,0x15,	// PV+4 .. _lmts,_eqar,_astar,_trasand,
				0x3C,0x3C,0x3C,0x3C,0x3C,0x3C,0x3C, //V+11 _orR,_andR,_xorR,_norR,_nandR,_nxorR,_xornR
				0x3C,0x3C,0x3C, //V+14 _delay,_event,_events,
				0x16,0x18,0x17,0x17, 0x3C, 
				0x1,0x1, 0x30,0x16,0x18,0x17, 	// %(mod) |(or) &(and) ^(xor)
				0x1E,0x1E,0x13,0x15,	//<<(shl) >>(shr) ||(or) &&(and)  
				0x4e,0x4e,0x30,0x12,
				0x4e,0x4e,0x15,
				0x2,0x2,0x3,0x4,0x5,0x6
				};
void	prOpBr(struct lxNode*rt)//відкриті дужки
{if(rt->ndOp>_inr||rt->ndOp<_if
	||(rt->ndOp>=_to&&rt->ndOp<=_step))
	{printf("%s",oprtr[_brkt]); mode=0;}
else if(mode!=0){printf(" "); mode=0;}
/* else*/ if(!(rt&&rt->ndOp!=_EOS))
	{printf("%s",oprtr[_opbr]); mode=modeL;}
}
void	prClBr(struct lxNode*rt)//закриті дужки
{if(rt->ndOp>_inr||rt->ndOp<_if
	||(rt->ndOp>=_to&&rt->ndOp<=_step))
	{printf("%s",oprtr[_bckt]); mode=0;}
 else if(rt&&rt->ndOp!=_EOS)
		{;/*if(rt->ndOp<_opbr||(rt->ndOp>=_asOr&&rt->ndOp>=_asOr))
			{printf("%s",oprtr[_EOS]); mode=0;}*/}
 else printf("%s%s",oprtr[_EOS],oprtr[_ocbr]);
}
// виведення піддерва лексем
void	prLxTxt(struct lxNode*rt) //корінь піддерева 
{static int mdCnt=0; // лічильники входжень
 struct lxNode* rt0; // робочий вказівник
 char n=0, c, bC=0, opCnt=0;
 if(rt->ndOp<=_cnst)
 {if(rt->ndOp!=_nil)// обробка термінального операнда
	{if(mode==1&&rt->ndOp<begOprtr-8)printf(" ");
	 printf("%s",rt->prvNd);
	 mode=1;
 }	}	// вихід з рекурсії
 else if(cpr[rt->ndOp&(~_lVlu)][0]!=0)
 {while((c=cpr[rt->ndOp&(~_lVlu)][n])!=0)// цикл прогляду шаблона
 {n++;		// просування по шаблону
	 switch(c)	// аналіз літери шаблона
	{case 7: 
		if(mdCnt==0)mdCnt=-1; 
		else while(c!=-1)c=cpr[rt->ndOp&(~_lVlu)][n++];// пропуск шаблона
		c=0; break;
	 case 6: opCnt--;// повернення до першого аргумента
	 case -1: break;
	 case -2: mdCnt=0; break;
	 case 1: /*case 'f':*/ if(mode!=0&&rt->ndOp>=_if
							&&rt->ndOp<begOprtr-8)printf(" ");
		 printf("%s",oprtr[rt->ndOp&(~_lVlu)]); 
		 if(rt->ndOp>=begOprtr-8)mode=0;
		 else mode=1; break;
	 case 'x': case 'y': case 5: case 4:
		if(opCnt)rt0=rt->pstNd;	// вибір аргумента
		else rt0=rt->prvNd;	// перевірка потреби обрамлення
		if(rt0)
		{if(c=='y')bC=fpr[rt->ndOp]>fpr[rt0->ndOp]&&rt0
					&&rt0->ndOp!=_opbz;
		else if(c==5){if(rt0&&rt0->ndOp!=_brkz)bC=1;}
		else if(c==4)bC=0;
		else bC=fpr[rt->ndOp&(~_lVlu)]>=fpr[rt0->ndOp&(~_lVlu)]&&rt0;
		if(bC)prOpBr(rt0);	// обрамлення дужками
		prLxTxt(rt0);		// рекурсивний виклик відтворення
		if(bC)prClBr(rt0);	// обрамлення дужками
		}
	case 'z':opCnt++;		// підготовка наступного аргумента
		break;
	default :printf("%c",c);
	}
//	mdC=mdCnt;
	if(c==-1&&mdCnt!=0)break;
 }}
 else{rt0=rt->prvNd;
	  if(rt0!=NULL&&rt->ndOp!=_remL&&rt->ndOp!=_rem)
		{bC=fpr[rt->ndOp&(~_lVlu)]>fpr[rt0->ndOp&(~_lVlu)];
		 if(bC)prOpBr(rt0);
		 prLxTxt(rt0);
		 if(bC)prClBr(rt0);
		}
	  if(mode==1&&(rt->ndOp&(~_lVlu))<begOprtr-8)printf(" ");
//	  if(rt->ndOp!=_EOS||rt->prvNd->ndOp!=_EOS||rt->pstNd==NULL)
		  printf("%s",oprtr[rt->ndOp&(~_lVlu)]); 
	  if((rt->ndOp&(~_lVlu))>begOprtr-8)mode=0; else mode=1;
	  if(rt->ndOp==_remL||rt->ndOp==_rem)
		printf("%s\n",rt->prvNd); 
	 /* else*/{rt0=rt->pstNd;
	  if(rt0!=NULL)
		{bC=gpr[rt->ndOp&(~_lVlu)]>=gpr[rt0->ndOp&(~_lVlu)]
			&&(rt->ndOp&(~_lVlu))<_frkz;//&&rt0->ndOp<_frkz;//0
		 if(bC)prOpBr(rt0);
		 prLxTxt(rt0);
		 if(bC)prClBr(rt0);
	  }}
	 if((rt->ndOp&(~_lVlu))>=_opbr&&(rt->ndOp&(~_lVlu))<=_bckt)
	 {printf("%s",oprtr[(rt->ndOp&(~_lVlu))+1]); mode=0;}
	 if((rt->ndOp&(~_lVlu))>=_opbz&&(rt->ndOp&(~_lVlu))<=_tdbz)
	 {printf("%s",oprtr[((rt->ndOp&(~_lVlu))-_frkz)*2+_fork+1]); mode=0;}
 }	 return;
}
void	prOpBr(struct lxNode*rt,FILE*f)//відкриті дужки
{if(rt->ndOp>_inr||rt->ndOp<_if
	||(rt->ndOp>=_to&&rt->ndOp<=_step))
	{fprintf(f,"%s",oprtr[_brkt]); mode=0;}
else if(mode!=0){fprintf(f," "); mode=0;}
/* else*/ if(!(rt&&rt->ndOp!=_EOS))
	{fprintf(f,"%s",oprtr[_opbr]); mode=modeL;}
}
void	prClBr(struct lxNode*rt,FILE*f)//закриті дужки
{if(rt->ndOp>_inr||rt->ndOp<_if
	||(rt->ndOp>=_to&&rt->ndOp<=_step))
	{fprintf(f,"%s",oprtr[_bckt]); mode=0;}
 else if(rt&&rt->ndOp!=_EOS)
		{;/*if(rt->ndOp<_opbr||(rt->ndOp>=_asOr&&rt->ndOp>=_asOr))
			{printf("%s",oprtr[_EOS]); mode=0;}*/}
 else fprintf(f,"%s%s",oprtr[_EOS],oprtr[_ocbr]);
}
void	prLxTxt(struct lxNode*rt,FILE*f) //корінь піддерева 
{static int mdCnt=0; // лічильники входжень
 struct lxNode* rt0; // робочий вказівник
 char n=0, c, bC=0, opCnt=0;
 if(rt->ndOp<=_cnst)
 {if(rt->ndOp!=_nil)// обробка термінального операнда
	{if(mode==1&&rt->ndOp<begOprtr-8)fprintf(f," ");
	 fprintf(f,"%s",rt->prvNd);
	 mode=1;
 }	}	// вихід з рекурсії
 else if(cpr[rt->ndOp][0]!=0)
 {while((c=cpr[rt->ndOp][n])!=0)// цикл прогляду шаблона
 {n++;		// просування по шаблону
	 switch(c)	// аналіз літери шаблона
	{case 7: 
		if(mdCnt==0)mdCnt=-1; 
		else while(c!=-1)c=cpr[rt->ndOp][n++];// пропуск шаблона
		c=0; break;
	 case 6: opCnt--;// повернення до першого аргумента
	 case -1: break;
	 case -2: mdCnt=0; break;
	 case 1: /*case 'f':*/ if(mode!=0&&rt->ndOp>=_if
							&&rt->ndOp<begOprtr-8)fprintf(f," ");
		 fprintf(f,"%s",oprtr[rt->ndOp]); 
		 if(rt->ndOp>=begOprtr-8)mode=0;
		 else mode=1; break;
	 case 'x': case 'y': case 5: case 4:
		if(opCnt)rt0=rt->pstNd;	// вибір аргумента
		else rt0=rt->prvNd;	// перевірка потреби обрамлення
		if(rt0)
		{if(c=='y')bC=fpr[rt->ndOp]>fpr[rt0->ndOp]&&rt0
					&&rt0->ndOp!=_opbz;
		else if(c==5){if(rt0&&rt0->ndOp!=_brkz)bC=1;}
		else if(c==4)bC=0;
		else bC=fpr[rt->ndOp]>=fpr[rt0->ndOp]&&rt0;
		if(bC)prOpBr(rt0,f);	// обрамлення дужками
		prLxTxt(rt0,f);		// рекурсивний виклик відтворення
		if(bC)prClBr(rt0,f);	// обрамлення дужками
		}
	case 'z':opCnt++;		// підготовка наступного аргумента
		break;
	default :fprintf(f,"%c",c);
	}
//	mdC=mdCnt;
	if(c==-1&&mdCnt!=0)break;
 }}
 else{rt0=rt->prvNd;
	  if(rt0!=NULL&&rt->ndOp!=_remL&&rt->ndOp!=_rem)
		{bC=fpr[rt->ndOp]>fpr[rt0->ndOp];
		 if(bC)prOpBr(rt0,f);
		 prLxTxt(rt0,f);
		 if(bC)prClBr(rt0,f);
		}
	  if(mode==1&&rt->ndOp<begOprtr-8)fprintf(f," ");
//	  if(rt->ndOp!=_EOS||rt->prvNd->ndOp!=_EOS||rt->pstNd==NULL)
		  fprintf(f,"%s",oprtr[rt->ndOp]); 
	  if(rt->ndOp>begOprtr-8)mode=0; else mode=1;
	  if(rt->ndOp==_remL||rt->ndOp==_rem)
		fprintf(f,"%s\n",rt->prvNd); 
	 /* else*/{rt0=rt->pstNd;
	  if(rt0!=NULL)
		{bC=gpr[rt->ndOp]>=gpr[rt0->ndOp]
			&&rt->ndOp<_frkz&&rt0->ndOp<_frkz;//0
		 if(bC)prOpBr(rt0,f);
		 prLxTxt(rt0,f);
		 if(bC)prClBr(rt0,f);
	  }}
	 if(rt->ndOp>=_opbr&&rt->ndOp<=_bckt)
	 {fprintf(f,"%s",oprtr[rt->ndOp+1]); mode=0;}
	 if(rt->ndOp>=_opbz&&rt->ndOp<=_tdbz)
	 {fprintf(f,"%s",oprtr[(rt->ndOp-_frkz)*2+_fork+1]); mode=0;}
 }	 return;
}
// виведення масиву лексем
void	prLaTxt(struct lxNode*ar, unsigned n) //початок масиву лексем 
{unsigned i=0;
do
{if(ar[i].ndOp<=_cnst||ar[i].ndOp==_remL)
 {if(ar[i].ndOp!=_nil)// обробка термінального операнда
	{if(ar[i].ndOp==_remL)printf("%s",oprtr[ar[i].ndOp]); 
	 if(mode==1&&ar[i].ndOp<begOprtr-8)printf(" ");
	 if(ar[i].ndOp==_remL)printf("%s\n",ar[i].prvNd);
	 else printf("%s",ar[i].prvNd);
	 mode=1;
 }	}	// 
 else 
 {if(mode==1&&ar[i].ndOp<begOprtr-8)printf(" ");
	printf("%s",oprtr[ar[i].ndOp]); 
  if(ar[i].ndOp>begOprtr-8)mode=0; else mode=1;
 }
}while(++i<n);
}