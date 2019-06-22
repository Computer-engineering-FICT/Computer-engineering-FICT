#include "stdafx.h"
#include "automat.h"
#include "langio.h"
#include "..\spLb3\token.h"
#include "tables.h"
#include "index.h"
#include <stdlib.h>
extern enum ltrType *ltCls;	// ����������� ��� ����� �� ������
extern enum autStat nxtStsC[Eo+1][ltrcode+1];
extern enum autStat nxtStsP[Eo+1][ltrcode+1];
extern char *oprtrC[], *oprtrP[], *oprtrV[],
			*cprC[], *cprP[], *cprV[];
char **oprtr, **cpr;
char modeP=0, // ��� ���������� ����������� ����� ��� �������
	 modeC=1, // ��� ���������� ����������� ����� ��� �
	 modeL; 
extern int x, y, f;
extern unsigned	nImBg, nImCr;	// ���������� �� �������� ������ ������ � �����
extern char imgBuf[];	// ����� ������� ������
extern enum tokType *dlCds;
extern enum ltrType *ltCls;
unsigned nNode=0;
extern struct lxNode nodes[100];
extern unsigned nNdxNds;
extern struct indStrUS *pRtNdx, ndxNds[50];
struct recrdKWD *tablKWD;
extern struct recrdKWD tablKWDC[67];
extern struct recrdKWD tablKWDP[67];
enum autStat //*nxtStsR=&nxtStsC[0][0],
			nxtSts[Eo+1][ltrcode+1];//=&nxtStsR;//(enum autStat**)nxtStsC;
void LxAnInit(char nl)
{char i=0;
 switch (nl)
 {case 'P':modeL=modeP; 
	 oprtr=oprtrP, cpr=cprP;
	 tablKWD = tablKWDP;
	 for(i=0;i<=Eo;i++)for(char j=0;j<=ltrcode;j++)
		 nxtSts[i][j]=nxtStsP[i][j];
	 break;
 case 'V':
 default:
 case 'C':modeL=modeC; 
	 oprtr=oprtrC, cpr=cprC;
	 tablKWD = tablKWDC;
	 for(i=0;i<=Eo;i++)for(char j=0;j<=ltrcode;j++)
		 nxtSts[i][j]=nxtStsC[i][j];
}
}
// ������� ���������� ������ ������� �������
int cntMdB=0;
int LxAnlzr(void)
{//static int lxNmb=0;
 static enum autStat s=S0, sP; // �������� �� ��������� ���� �������
 enum autStat SP; 
 static enum ltrType c;	// ���� ������� �����
 static char l=1;		// ������� ����� (������� ���������)
 struct recrdKWD* pRt;
 int s1, c1; 
 char l1, l0;		// ������� �����
 lxInit(nNode,c);
 do {SP=
	 sP=s; l1=l;	// �����'���������� �����
  	 l0=l=ReadLtr();	// ������� �����
  	 c1=c=ltCls[l];	// ���������� ����� �����
	 if(s==Scl&&c!=dlmeorml)continue;
	 s=nxtSts[s][c];//[c<dlmaux?c:dlmaux];// ���� �������
	 s1=s;
	 if(s==Scr)continue;
	 if((sP==S2||sP==S3)&&(c>nc&&c<dlmeormr))
	 {// ����� � ������� �������� ����������
		 imgBuf[nImCr]=0;
	  pRt=selBin(imgBuf+nImBg, tablKWD, 67);
	  if(pRt!=NULL)
		{nodes[nNode].ndOp=pRt->func;
		 if(pRt->func==_remL)
			{s=Scr; nodes[nNode].pstNd=(struct lxNode *)(imgBuf+nImCr);
			continue;}
		 if(pRt->func==_rem)
			{s=Scl;} continue;
		 break;}else
		 {if(sP!=S3)
		 {nodes[nNode].ndOp=/*(enum tokType)*/dlCds[l1];
		  if(nodes[nNode-1].ndOp>_cnst&&nodes[nNode-1].ndOp!=_bckt
			&&nodes[nNode-1].ndOp!=_scbr)// �������� ��������
			{if(nodes[nNode].ndOp==_add)nodes[nNode].ndOp=_addU;
			 if(nodes[nNode].ndOp==_sub)nodes[nNode].ndOp=_subU;
			 if(nodes[nNode].ndOp==_mul)nodes[nNode].ndOp=_refU;
			 if(nodes[nNode].ndOp==_andB)nodes[nNode].ndOp=_ptrU;
			}
		  imgBuf[nImBg]=imgBuf[nImBg+1]; 
		  nodes[nNode].prvNd=NULL;
		 }else{imgBuf[nImBg]=imgBuf[nImBg+1]; nImCr--;}
		  nImCr--; 
		  sP=S0; 
		  s=nxtSts[sP][c];//[c<dlmaux?c:dlmaux];// ���� �������
		  return nNode++;
		 }
	 }
    s1=s;}while(s!=S0&&s!=S2&&!((sP==S0||sP==S2||sP==S3)&&s<S2));	// �������� ���� �������
	s1=sP;
  switch(sP)
  {case Scr: case Scl: 
	imgBuf[nImCr++]=0;
//	((char*)(nodes[nNode].prvNd))--;
	nImBg=nImCr; 
	break;
   case S2:
   case S0:
/*	if(s==S0)
//		dGroup(nNode);// ����� �������� ����������
		{//imgBuf[nImBg]=l1;
		imgBuf[++nImCr]=0;//nImCr++;
	   }*/
	if(nodes[nNode].ndOp!=_nil)
		{nImCr=nImBg; l=' '; return nNode++;}
//	if(sP!=S0)
	nodes[nNode].ndOp=/*(enum tokType)*/dlCds[l1];//dlCds[l1];
	if(nodes[nNode-1].ndOp>_cnst&&nodes[nNode-1].ndOp!=_bckt
		&&nodes[nNode-1].ndOp!=_scbr)// �������� ��������
	{if(nodes[nNode].ndOp==_add)nodes[nNode].ndOp=_addU;
	 if(nodes[nNode].ndOp==_sub)nodes[nNode].ndOp=_subU;
	 if(nodes[nNode].ndOp==_mul)nodes[nNode].ndOp=_refU;
	 if(nodes[nNode].ndOp==_andB)nodes[nNode].ndOp=_ptrU;
	}
	if(nodes[nNode].ndOp==_opbr&&(nodes[nNode-1].ndOp==_ass||cntMdB))
		{cntMdB++;nodes[nNode].ndOp=_tdbr;}
	if(nodes[nNode].ndOp==_ocbr&&cntMdB)
		{nodes[nNode].ndOp=_tcbr;cntMdB--;}
	if(nodes[nNode].ndOp!=_nil)
//		&&imgBuf[nImBg]==)
		{nodes[nNode].prvNd=NULL; 
		 if(nImBg+1!=nImCr)
//		 if(dlCdsC[l0]!=_nil||ltClsC[l0]==dlmaux||ltClsC[l0]==dlmeormr)
		 {imgBuf[nImBg]=imgBuf[nImBg+1]; 
		 if(s!=S0){nImCr--;
			imgBuf[nImBg]=imgBuf[nImCr];nImCr=nImBg+1;}// 04.07.07
		 else nImCr=nImBg;}
		 return nNode++;}
	else if(ltCls[imgBuf[nImBg]]==dlmaux/*&&ltClsC[imgBuf[nImBg]]>nc*/)
	{imgBuf[nImBg]=imgBuf[nImBg+1]; 
		nImCr--;}
	return nNode;
   case S1n:// ����� �������� ��� �� ����
		 imgBuf[nImCr-1]=0;
	// ����� � ������� ������;
		 if(*(imgBuf+nImBg)==13)nImBg++;
		pRt=selBin(imgBuf+nImBg, tablKWD, 67);
		if(pRt){nodes[nNode].ndOp=pRt->func;
	// ���� ��������
		nodes[nNode].prvNd=NULL;
		nImCr=nImBg; 
		if(c!=dlmeormr&&c!=dlmaux)imgBuf[nImCr++]=l;
		return nNode++;}
	// ���� �� ��������
	nodes[nNode].ndOp=_nam;
	insBTr(nodes+nNode,pRtNdx);
	nImBg=nImCr; 
	if(c!=dlmeormr&&c!=dlmaux)imgBuf[nImCr++]=l;
	break;
   default:	// �� ����� �� �������������� �������
   case Eu: case Ec: case Ep: case Eq: case En: case Eo:// ������� �������
	eNeut(nNode);		// �������� �������
   case S1c: case S2c: case S1p: case S2s:	// ���������� ��������
	imgBuf[nImCr-1]=0;
	nodes[nNode].resLength=sP;//	frmCns(sP, nNode); break;
	nodes[nNode].ndOp=_srcn; nodes[nNode].dataType=sP;
	insBTr(nodes+nNode,pRtNdx);
	nImBg=nImCr; 
	if(c!=dlmeormr&&c!=dlmaux)imgBuf[nImCr++]=l;
	break;
   case S3: nImCr=nImBg;
	nodes[nNode].prvNd=NULL; 
	imgBuf[nImBg]=imgBuf[nImBg+2];
	s1=s;
	if(s!=S0)nImCr=nImBg+1;//else nImCr--;
  }
  return nNode++;
}
 