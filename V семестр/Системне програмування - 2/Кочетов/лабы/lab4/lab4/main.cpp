#include "stdafx.h"
#include "token.h"
#include "visgrp.h"
#include "tables.h"
#include "lexan.h"
#include "syntaxP.h"
#include "langio.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern struct recrdKWD tablKWD[];
extern struct lxNode nodes[MAX_NODES]; // масив-приймач вузлів дерева
extern enum ltrType ltClsC[256];
extern enum ltrType ltClsP[256];
extern enum tokType dlCdsC[256];
extern enum tokType dlCdsP[256];
extern enum ltrType ltClsC[256];
extern enum ltrType ltClsP[256];
enum ltrType *ltCls=ltClsC;
enum tokType *dlCds=dlCdsC;
char file_name[20];

int main(int argc, char* argv[])
{int nn=-1, nr=0, nc=1; //np,
 if (argc>1)
    {strcpy(file_name,argv[1]);
	 printf("Processing file -- %s\n",file_name);}
 else
    {printf("Please enter file Name: ");
	 scanf("%s",file_name);
	 strcat(file_name,".h");
	}
 opFls(file_name);
 LxAnInit('C');
do{//np=nn;
 nn=LxAnlzr();
}while(nodes[nn].ndOp!=_EOF);
	prLaTxt(nodes,nn);
	printf("\n");
	SxAnInit('C');
	nr=0; nc=1; nodes[0].prnNd=-1;
	do nr=nxtProd(nodes,nr,nc);
	while(++nc<nn);
	// конверсія до семантичної обробки
	prLxTxt(nodes+nr);
	printf("\n");
	system("pause");
	return 0;
}
