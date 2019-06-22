#include "stdafx.h"
#include "vistab.h"
#include "tables.h"
#include <stdio.h>
//---------!!!уточнюється за варіантом!!!----------------
void prClr(enum color cl)
{char* sClr[6]=
	{"violet","blue","green","yellow","orange","red"};
	printf("%s",sClr[cl]);
}
//---------!!!уточнюється за варіантом!!!----------------
void prRow(struct recrd* rw)
{if(rw==0)printf("is absent\n");
 else if(rw->_del)printf("is deleted\n");
 else printf("%-10s %3u %5.3f\n",
			  rw->key.str,rw->key.nMod,rw->func._f);
}
void prTab(struct recrd* rw, int n0, int n1)
{printf("  Table:\n");
 while(n0<=n1){prRow(rw+n0);n0++;}
}
