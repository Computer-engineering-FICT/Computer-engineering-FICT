// spLb4.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "..\spLb3\token.h"
#include "..\spLb3\visgrp.h"
#include "tables.h"
#include "lexan.h"
#include "langio.h"
#include <stdio.h>
#include <string.h>

extern struct recrdKWD *tablKWD;
struct lxNode nodes[200]= // масив приймач вузлів дерева
{{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
};
char file_name[20];
extern enum ltrType ltClsC[256];
extern enum ltrType ltClsP[256];
extern enum tokType dlCdsC[256];
extern enum tokType dlCdsP[256];
extern enum ltrType ltClsC[256];
extern enum ltrType ltClsP[256];
enum ltrType *ltCls=ltClsC;
enum tokType *dlCds=dlCdsC;
int main(int argc, char* argv[])
{int nn=-1;//np,
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
 srtBin(tablKWD, 67);
do{//np=nn;
 nn=LxAnlzr();
}while(nodes[nn].ndOp!=_EOF);
	prLaTxt(nodes,nn);
	printf("\n");
 return 0;
}
