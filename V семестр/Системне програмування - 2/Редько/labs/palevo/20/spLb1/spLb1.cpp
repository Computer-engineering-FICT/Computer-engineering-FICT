// spLb1.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "tables.h"
#include "vistab.h"

int nTbStud=2, lnTbStud=100;
struct recrd tbStud[100]=
{{{"Diatlov",88},4.0,0},
{ {"Kutsar",89},3.5,0}};
struct recrd tstArg={{"Diatlov",89},4.0,0},
			insArg={{"Gazizov",89},3.2,0},
			insArg0={{"Gazizov",55},3.5,0},
			insArg1={{"Bilyk",8},4.1,0},
			insArg2={{"Dudko",80},4.2,0};

int main(int argc, char* argv[])
{prRow(&tstArg);
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
 prClr(blue);
 return 0;
}
