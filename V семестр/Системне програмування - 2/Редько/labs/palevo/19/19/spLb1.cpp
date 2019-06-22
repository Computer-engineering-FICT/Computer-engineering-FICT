// spLb1.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "tables.h"
#include "vistab.h"
#include <stdlib.h>
#include <stdio.h>
#include <iostream>

using namespace std;

short nTbStud=2, lnTbStud=100;
struct recrd tbStud[100]= {{{"aAaAaA",12},nol},
						    {{"BbBbBb",2},ras}};
struct recrd tstArg={{"aAaAaA",1},dva},
			insArg={{"‡¿‡¿‡¿",111},tri},
			insArg0={{"ffgffg",55},chre},
			insArg1={{"retyheh",8},vsim},
			insArg2={{"njmjmtt",80},vsim,vsim};

int main(int argc, char* argv[])
{struct recrd*pTb; 
 pTb = (struct recrd*)malloc(100*sizeof(struct recrd));
 pTb = new struct recrd[100];
 
 printf("\n----- Test row...\n");
 prRow(&tstArg);
 
 printf("\n----- Table at the beginning\n");
 prTab(&tbStud[0], nTbStud);
 
 printf("\n----- Select by direct address element #0\n");
 prRow(selNmb(tbStud, 0));
 
 printf("\n----- Linear select\n");
 prRow(selLin(tstArg.key, tbStud, 2));
 
 printf("\n----- Inserting row by direct address\n");
 prRow(insNmb(&insArg0,tbStud, 5, &nTbStud));
 printf("          result\n");
 prTab(tbStud,nTbStud);
 
 printf("\n----- Updating row by direct address\n");
 prRow(updNmb(&insArg1,tbStud, 3, &nTbStud));
 printf("          result\n");
 prTab(tbStud,nTbStud);

 printf("\n----- Deleting row by direct address\n");
 prRow(delNmb(tbStud, 1));
 prTab(tbStud, nTbStud);
 
 printf("\n----- Insertion by linear search of empty place\n");
 prRow(insLin(&insArg2, tbStud, &nTbStud));
 prTab(tbStud,nTbStud);

 printf("\n----- Insertion by linear search of empty place\n");
 prRow(insLin(&insArg, tbStud, &nTbStud));
 prTab(tbStud,nTbStud);

 printf("\n----- Deleting by linear search\n");
 prRow(&insArg1);
 prRow(delLin(&insArg1, tbStud, &nTbStud));
 prTab(tbStud, nTbStud);

 printf("\n----- Updating by linear search\n");
 prRow(updLin(insArg.key, &insArg0, tbStud, &nTbStud));
 prTab(tbStud, nTbStud);

 printf("\n----- Packing for linear search\n");
 prRow(pckLin(tbStud, &nTbStud));
 prTab(tbStud, nTbStud);

 printf("\n----- Sorting for binary search\n");
 prRow(srtBin(tbStud, nTbStud));
 prTab(tbStud, nTbStud);

 printf("\n----- Selecting by binary search\n");
 prRow(selBin(insArg2.key, tbStud, nTbStud));
 prTab(tbStud, nTbStud);

 printf("\n----- Inserting by binary search\n");
 prRow(insBin(&insArg1, tbStud, &nTbStud));
 prTab(tbStud, nTbStud);

 printf("\n------ Searching by similar string\n");
 printf("arguement:\n");
 prRow(&insArg1);
 printf("found result:\n");
 prRow(selLinSim(insArg1.key,tbStud,nTbStud));

 printf("\n------ Searching by similar string\n");
 printf("arguement:\n");
 prRow(&insArg);
 printf("found result:\n");
 prRow(selLinSim(insArg.key,tbStud,nTbStud));
 return 0;
}
