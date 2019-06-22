#include "stdafx.h"
#include "tables.h"
#include <string.h>
// порівняння рядків
int cmpStr(unsigned char* s1, unsigned char* s2)
{unsigned n=0; 
 while(s1[n]==s2[n]&&s1[n]!=0)n++;
 return s1[n]-s2[n];
}
// порівняння за відношенням порядку
int cmpKys(char *k0, char *kArg)	
{int i=cmpStr((unsigned char*)k0,
			  (unsigned char*)kArg);
 //if(i)
	 return i;
}
//------------------------------------------------------
// вибірка за двійковим пошуком
struct recrdKWD*selBin(char* kArg, struct recrdKWD*tb, int ln)
{int i, nD=-1, nU=ln, n=(nD+nU)>>1;
 while(i=cmpKys(tb[n].key,kArg))
	{if(i>0)nU=n;else nD=n;
	 n=(nD+nU)>>1;
	 if(n==nD)return NULL;
	}
 return &tb[n];
}
// сортування для двійкового пошуку
struct recrdKWD*srtBin(struct recrdKWD*tb, int ln)
{int n=0, n1;
 struct recrdKWD el;
 for(;n<ln;n++)for(n1=n+1;n1<ln;n1++)
	 if(cmpKys(tb[n].key,tb[n1].key)>0)
		{el=tb[n];tb[n]=tb[n1];tb[n1]=el;}
 return tb;
}
