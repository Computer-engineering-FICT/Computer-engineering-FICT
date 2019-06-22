// spLb1.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "tables.h"
#include "vistab.h"
#include <stdlib.h>

int nTbStud=2, lnTbStud=100;
struct recrd tbStud[100]= // static table defintion
{{{"Diatlov",88},4,0},	// 1st record ititialization
{ {"Kutsar",89},3.5,0}};// 2nd record ititializaton
struct recrd tstArg={{"Diatlov",89},40,0},	// appending element intialization
			insArg={{"Gazizov",89},32,0},	// appending element intialization
			insArg0={{"Gazizov",55},3,0},	// appending element intialization
			insArg1={{"Bilyk",8},41,0},		// appending element intialization
			insArg2={{"Dudko",80},4.2,0};	// appending element intialization

int main(int argc, char* argv[])
{struct recrd*pTb;
 double b = 3.14, d = 2.78, x = 0.5;
 long a=4, c =9, f, n = 1;
  _asm{
	  fild a
	  fadd b
	  fild c
	  fmul d
	  fsub ;// f = a + b - c * d;
	  fistp f
//	add eax,pTbsin(x)
	  fld	x	////	  fld1	// 2n +1
	  fld	x
	  fmul	x
	  fld	x
l:	  fmul	st,st(1)
      inc	n
	  fidiv n
      inc	n
	  fidiv n
	  fadd	st(2),st
	  cmp	n,10
	  jl	l
	  fincstp
	  fincstp
	  fstp	f
	}
 f = a + b - c * d;
 pTb = (struct recrd*)malloc(100*sizeof(struct recrd));
/* pTb = new struct recrd[100];
 prRow(&tstArg);
 prRow(selNmb(tbStud, 1));
 prRow(selLin(tstArg.key, tbStud, 2));
 prRow(insNmb(&insArg,tbStud, 3, &nTbStud));
 prTab(tbStud, 0, nTbStud-1);
 prRow(updNmb(&insArg1,tbStud, 2, &nTbStud));
 prRow(delNmb(tbStud, 1));
 prTab(tbStud, 0, nTbStud-1);
 prRow(insLin(&insArg2, tbStud, &nTbStud));
 prTab(tbStud, 0, nTbStud-1);
 prRow(delLin(&insArg1, tbStud, &nTbStud));
 prTab(tbStud, 0, nTbStud-1);
 prRow(updLin(insArg.key, &insArg0, tbStud, &nTbStud));
 prTab(tbStud, 0, nTbStud-1);
 prRow(pckLin(tbStud, &nTbStud));
 prTab(tbStud, 0, nTbStud-1);
 prRow(srtBin(tbStud, nTbStud));
 prTab(tbStud, 0, nTbStud-1);
 prRow(selBin(insArg2.key, tbStud, nTbStud));
 prTab(tbStud, 0, nTbStud-1);
 prRow(insBin(&insArg1, tbStud, &nTbStud));
 prTab(tbStud, 0, nTbStud-1);
 prClr(blue);*/
 return 0;
}
