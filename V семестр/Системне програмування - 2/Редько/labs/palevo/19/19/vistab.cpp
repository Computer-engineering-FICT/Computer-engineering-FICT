#include "stdafx.h"
#include "vistab.h"
#include "tables.h"
#include <stdio.h>
void prClr(enum color cl)
{char* sClr[6]=
	{"violet","blue","green","yellow","orange","red"};
	printf("%s",sClr[cl]);
}
void prRow(struct recrd* rw)
{if(rw==0)printf("is absent\n");
 else if(rw->_del)printf("is deleted\n");
 else printf("%-10s %3u %u\n",
			  rw->key.str,rw->key.nMod,rw->func._f);
}
void prTab(struct recrd* tb, short n)
{printf("  Table:\n");
 short n0=0;
 while(n0<n){prRow(&tb[n0]);n0++;}
}
