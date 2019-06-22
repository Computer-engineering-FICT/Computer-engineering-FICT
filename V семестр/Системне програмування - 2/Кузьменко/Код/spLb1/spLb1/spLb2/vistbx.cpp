#include "stdafx.h"
#include "vistbx.h"
#include <stdio.h>
//---------!!!уточнюється за варіантом!!!----------------
// виведення динамічної таблиці
void	prDnTb1(struct hdTbStr*p) //адреса заголовку таблиці 
{printf("Dynamic table: reserved = %d segments;  segment header location = %p\n",
		p->nSgBg, p->frstSg);
 printf("Segment 1: reserved = %d els; els number = %d; segment location = %p\n",
		p->frstSg->nRsEl,p->frstSg->nFlEl);
 prTab(p->frstSg->pRcPtr, 0, p->frstSg->nFlEl-1);
}
// виведення індексованої таблиці
void	prPrIx(struct indStr*pi) //адреса кореню таблиці 
{while (pi){if(pi->pLtPtr)prPrIx(pi->pLtPtr);
		prRow((struct recrd*)pi->pKyStr);
		pi=pi->pRtPtr;}
}
// виведення індексованої таблиці
void	prIxTb1(struct hdIxStr*p) //адреса заголовку таблиці 
{printf("Indexed table: begin location = %p;  root location = %p\n ",
		p->pBgNdx, p->pRtNdx);
 struct hdTbStr*pd = p->pHdTb;
 printf("Dynamic table: reserved = %d segments;  segment header location = %p\n",
		pd->nSgBg, pd->frstSg);
 printf("Segment 1: reserved = %d els; els number = %d; segment location = %p\n",
		pd->frstSg->nRsEl,pd->frstSg->nFlEl);
 struct indStr* pi=p->pRtNdx;
 prPrIx(pi);
}