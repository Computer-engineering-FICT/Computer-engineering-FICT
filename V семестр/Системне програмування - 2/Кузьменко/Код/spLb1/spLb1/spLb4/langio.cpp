#include "stdafx.h"
#include "..\spLb3\token.h"
#include "automat.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_SCNST 1024	// граничний обсяг символьних образів
struct fileInp
{char * src_name;
 FILE * stream;
} include_files[20];
int x=0, y=0, f=0, cl; 
//extern 
unsigned nImBg=0, nImCr=0;		// Початковий та поточний номери образів в буфері
//extern 
char imgBuf[MAX_SCNST];	// буфер вхідних образів
extern struct lxNode nodes[MAX_SCNST];
FILE *fi_progr;
void opFls(char* fn)
{ //search in startup dir
  fi_progr=fopen(fn,"r+b");
  if (!fi_progr) 
    {printf("\nImpossible to open file: %s\n",fn);exit(2);}
  include_files[f].stream=fi_progr;
  include_files[f].src_name=fn;
  f++;
}
FILE *fi_progrC;
void opFlsC(char* fn)
{/* //search in startup dir
	char *ps, s[30]="";
	ps=strcat(s,"..\\spLb9c\\");//"");
	ps=strcat(ps,fn);*/
  fi_progrC=fopen(fn,"wb");
  if (!fi_progrC) 
    {printf("\nImpossible to open file: %s\n",fn);exit(2);}
}
void WriteCod(char*cd)
{fprintf(fi_progrC,cd);
}
char ReadLtr(void)
{static char c=0;
  cl=fgetc(fi_progr);
  if (c==13||c==10)
    {x=0; y++;
	 if(cl==10)cl=fgetc(fi_progr);
    }
  x++;
  c=char(cl);
  if (cl==EOF)c=0; //c=13;
  imgBuf[nImCr++]=c;//cl;
  return c;
}
void lxInit(int lxNmb,enum ltrType cl)
{nodes[lxNmb].x=x;
 nodes[lxNmb].y=y;
 nodes[lxNmb].f=f;
 nodes[lxNmb].ndOp=_nil;
 nodes[lxNmb].prnNd=NULL;
 nodes[lxNmb].prvNd=(struct lxNode *)(imgBuf+nImCr);
 if(cl<nc/*&&nImCr!=0*/)nodes[lxNmb].prvNd=(struct lxNode *)(imgBuf+nImCr-1);
 nodes[lxNmb].pstNd=NULL;
 nodes[lxNmb].dataType=0;
 nodes[lxNmb].resLength=0;
 nodes[lxNmb].stkLength=0;
}
void frmCns(enum autStat s, int lxNmb)
{;
}
void eNeut(int lxNmb)
{;
}
void dGroup(int lxNmb)
{;
}