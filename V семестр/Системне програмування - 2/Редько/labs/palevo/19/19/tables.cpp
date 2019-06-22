#include "stdafx.h"
#include "tables.h"
#include "vistab.h"
#include <string.h>
#include <stdio.h>
#define SizeRc sizeof(struct recrd)

//------------------------------------------------------
// обробка записів таблиць за прямою адресою

// вибірка за прямою адресою
struct recrd* selNmb(struct recrd* tb,unsigned short nElm)
// tb - таблиця, з якої виключаємо
// nElm - номер елементу, який виключаємо
{return &tb[nElm];}

// включення за прямою адресою
struct recrd* insNmb(struct recrd*pElm,
					 struct recrd*tb, unsigned short nElm, short *pQnElm)
// Аргументи:
// - рядок, який треба включити
// - таблиця, в яку включити рядок
// - місце, після якого поставити рядок
// - розмір таблиці
{short n=*pQnElm;
 if(nElm<n)return 0; // заборонити заміну вже існуючого рядка ???
 while(nElm>n){
	 struct recrd rec={{"",0}};
	 tb[n++]=rec;}
 tb[nElm]=*pElm;
 *pQnElm=nElm+1;
 return &tb[nElm]; 
}

// вилучення за прямою адресою
struct recrd* delNmb(struct recrd*tb,unsigned short nElm)	
{tb[nElm]._del=-1;
 return &tb[nElm]; 
}

// корекція за прямою адресою
struct recrd* updNmb(struct recrd*pElm,
					 struct recrd*tb,unsigned short nElm, short *pQnElm)	
{short n=*pQnElm;
 if(nElm>=n)return 0; // якщо намагаємось відкорегувати неіснуючий елемент
 tb[nElm]=*pElm;
 return &tb[nElm]; 
}	

//------------------------------------------------------
// порівняння за відношенням порядку
int neqKey(struct recrd* el, struct keyStr kArg)
{return (strcmp(el->key.str, kArg.str)||
		 el->key.nMod != kArg.nMod);
}

// вибірка за лінійним пошуком
struct recrd* selLin(struct keyStr kArg, struct recrd* tb, short ln)
// ln - розмір таблиці
{while(--ln>=0&&neqKey(&tb[ln], kArg));
 if(ln<0)return 0;
 return &tb[ln];
}

// включення за лінійним пошуком
// включаємо на перше ж вільне місце
struct recrd*insLin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{short n=0;
 while(n<*pQnElm&&tb[n].key.str[0]!=0&&tb[n]._del!=-1)n++;
 if(n==*pQnElm)(*pQnElm)++;
 tb[n]=*pElm;
 return &tb[n];
}

// вилучення за лінійним пошуком
struct recrd*delLin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{struct recrd*pEl=selLin(pElm->key, tb, *pQnElm);
 if(pEl)pEl->_del=-1;
 return pEl;
}

// корекція за лінійним пошуком
struct recrd*updLin(struct keyStr kArg, struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{struct recrd*pEl=selLin(kArg, tb, *pQnElm);
 if(pEl)*pEl=*pElm;
 return pEl;
}

// пакування для лінійного пошуку
// усуваємо видалені логічно, але не фізично елементи
struct recrd*pckLin(struct recrd*tb, short*pQnElm)
{short n=0, ln=0; 
 while(n<*pQnElm)
 {if(tb[n]._del==0){tb[ln]=tb[n]; ln++;} n++;} 
 *pQnElm=ln;
 return tb;
}

//------------------------------------------------------
// порівняння рядків
int cmpStr(unsigned char* s1, unsigned char* s2)
{unsigned n=0; 
 while(s1[n]==s2[n]&&s1[n]!=0)n++;
 return s1[n]-s2[n];
}

// порівняння за відношенням порядку рядків
int cmpKey(struct recrd* el, struct keyStr kArg)
{int i=cmpStr((unsigned char*)el->key.str,
			  (unsigned char*)kArg.str);
 if(i)return i;
 return el->key.nMod - kArg.nMod;
}

// порівняння за відношенням порядку
int cmpKys(struct keyStr *k0, struct keyStr *kArg)	
{int i=cmpStr((unsigned char*)k0->str,
			  (unsigned char*)kArg->str);
 if(i)return i;
 return k0->nMod - kArg->nMod;
}

// порівняння рядків
int cmpSim(char* c1, char* c2)
{unsigned n=0; 
 while(((c1[n]==c2[n])||
	 ((c1[n]=='a')&&(c2[n]=='а'))||
     ((c1[n]=='A')&&(c2[n]=='А'))||
	 ((c1[n]=='B')&&(c2[n]=='В'))||
	 ((c1[n]=='g')&&(c2[n]=='д'))||
     ((c1[n]=='e')&&(c2[n]=='е'))|| 
     ((c1[n]=='E')&&(c2[n]=='Е'))|| 
     ((c1[n]=='u')&&(c2[n]=='и'))|| 
     ((c1[n]=='K')&&(c2[n]=='К'))|| 
     ((c1[n]=='M')&&(c2[n]=='М'))||
     ((c1[n]=='o')&&(c2[n]=='о'))|| 
     ((c1[n]=='O')&&(c2[n]=='О'))|| 
     ((c1[n]=='n')&&(c2[n]=='п'))|| 
     ((c1[n]=='p')&&(c2[n]=='р'))|| 
     ((c1[n]=='P')&&(c2[n]=='Р'))|| 
     ((c1[n]=='c')&&(c2[n]=='с'))|| 
     ((c1[n]=='C')&&(c2[n]=='С'))|| 
     ((c1[n]=='m')&&(c2[n]=='т'))|| 
     ((c1[n]=='T')&&(c2[n]=='Т'))|| 
     ((c1[n]=='Y')&&(c2[n]=='У'))|| 
     ((c1[n]=='x')&&(c2[n]=='х'))|| 
     ((c1[n]=='X')&&(c2[n]=='Х'))|| 
     ((c1[n]=='H')&&(c2[n]=='Н'))|| 
	 ((c2[n]=='a')&&(c1[n]=='а'))||
     ((c2[n]=='A')&&(c1[n]=='А'))||
	 ((c2[n]=='B')&&(c1[n]=='В'))||
	 ((c2[n]=='g')&&(c1[n]=='д'))||
     ((c2[n]=='e')&&(c1[n]=='е'))|| 
     ((c2[n]=='E')&&(c1[n]=='Е'))|| 
     ((c2[n]=='u')&&(c1[n]=='и'))|| 
     ((c2[n]=='K')&&(c1[n]=='К'))|| 
     ((c2[n]=='M')&&(c1[n]=='М'))||
     ((c2[n]=='o')&&(c1[n]=='о'))|| 
     ((c2[n]=='O')&&(c1[n]=='О'))|| 
     ((c2[n]=='n')&&(c1[n]=='п'))|| 
     ((c2[n]=='p')&&(c1[n]=='р'))|| 
     ((c2[n]=='P')&&(c1[n]=='Р'))|| 
     ((c2[n]=='c')&&(c1[n]=='с'))|| 
     ((c2[n]=='C')&&(c1[n]=='С'))|| 
     ((c2[n]=='m')&&(c1[n]=='т'))|| 
     ((c2[n]=='T')&&(c1[n]=='Т'))|| 
     ((c2[n]=='Y')&&(c1[n]=='У'))|| 
     ((c2[n]=='x')&&(c1[n]=='х'))|| 
     ((c2[n]=='X')&&(c1[n]=='Х'))|| 
     ((c2[n]=='H')&&(c1[n]=='Н')))
	 &&c1[n]!=0&c2[n]!=0){
	 n++;}
 return n;
}



// порівняння за відношенням схожості
int simKey(struct recrd* el, struct keyStr ks){
 char* s1=(char*)el->key.str;
 char* s2=(char*)ks.str;
 return cmpSim(s1,s2);
}




// вибірка за лінійним пошуком за відношенням схожості
struct recrd* selLinSim(struct keyStr kArg,
					 struct recrd* tb, short ln)
// ln - розмір таблиці
{ recrd* res=&tb[0];
  int skey=simKey(&tb[ln], kArg);
  if (skey<0) skey=skey*(-1);
  while(--ln>0)
  {int skeys=simKey(&tb[ln], kArg);
  if (skeys<0) skeys=skeys*(-1);
  if (skeys>skey) {skey=skeys; res=&tb[ln];}}
 if(ln<0)return 0;
 return res;
}


//------------------------------------------------------
// сортування для двійкового пошуку
struct recrd*srtBin(struct recrd*tb, short ln)
{short n=0, n1;
 struct recrd el;
 for(;n<ln;n++)for(n1=n+1;n1<ln;n1++)
	 if(cmpKey(&tb[n],tb[n1].key)>0)
		{el=tb[n];tb[n]=tb[n1];tb[n1]=el;}
 return tb;
}

// вибірка за двійковим пошуком
struct recrd*selBin(struct keyStr kArg, struct recrd*tb, short ln)
{short i, nD=-1, nU=ln, n=(nD+nU)>>1;
 while(i=cmpKey(&tb[n],kArg))
	{if(i>0)nU=n;else nD=n;
	 n=(nD+nU)>>1;
	 if(n==nD)return NULL;
	}
 return &tb[n];
}

// Увага: складіть коди для функцій з наступними заголовками
//---!!! реалізації дописуються за варіантом!!!---
// включення за двійковим пошуком
struct recrd*insBin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{
short i, nD=-1, nU=*pQnElm, n=(nD+nU)>>1;
 while(i=cmpKey(&tb[n],pElm->key))
	{if(i>0)nU=n;else nD=n;
	 n=(nD+nU)>>1;
// При відсутності елементу звільнити для нього місце,
	 if(n==nD)
	 {(*pQnElm)++;
// просунувши останні елементи в таблиці на одне заипс вперед
	 for(i=*pQnElm;i>n;i--)
		tb[i+1]=tb[i];
// Записати новий елемент на звільнене місце
		tb[i+1]=*pElm;
		 return &tb[i];
	 }
	}
		 return &tb[n];
}					

// вилучення за двійковим пошуком
struct recrd*delBin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{struct recrd*pr=selBin(pElm->key, tb, *pQnElm);
// при знаходженні елементу помітити його для вилучення 
 return pr;
}					

// корекція за двійковим пошуком
struct recrd*updBin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, short*pQnElm)
{struct recrd*pr=selBin(pElm->key, tb, *pQnElm);
// при знаходженні елементу заповнити його новими значеннями полів
 return pr;
}					
