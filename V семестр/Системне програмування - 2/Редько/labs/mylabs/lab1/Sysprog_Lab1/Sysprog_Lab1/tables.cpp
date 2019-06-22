#include "stdafx.h"
#include "tables.h"
#include <string.h>


struct record emptyElm = {{"", 0}, {0}};

//------------------------------------------------------
// обробка записів таблиць за прямою адресою

// вибірка за прямою адресою
struct record* selectNumber(struct record *tb, unsigned char nElm)
{
	return &tb[nElm];
}

// включення за прямою адресою
struct record* insertNumber(struct record *pElm, struct record *tb, unsigned char nElm, int *pQnElm)	
{
	int n = *pQnElm;
	if(nElm < n)
		return 0;
	while(nElm < n)
		tb[nElm++] = emptyElm;
	tb[nElm++] = *pElm;
	*pQnElm = nElm;
	return &tb[nElm - 1]; 
}

// вилучення за прямою адресою
struct record* deleteNumber(struct record *tb, unsigned char nElm)	
{
	tb[nElm]._del = -1;
	return &tb[nElm]; 
}

// корекція за прямою адресою
struct record *updateNumber(struct record *pElm, struct record *tb, unsigned char nElm, int *pQnElm)	
{
	int n = *pQnElm;
	if(nElm >= n)
		return 0;
	tb[nElm] = *pElm;
	return &tb[nElm]; 
}	

//------------------------------------------------------
// порівняння за відношенням порядку
int neqKey(struct record *el, struct keyString kArg)
{
	return (strcmp(el->key.str, kArg.str) || el->key.nMod != kArg.nMod);
}

// вибірка за лінійним пошуком
struct record* selectLinear(struct keyString kArg, struct record *tb, int ln)
{
	while(--ln >= 0 && neqKey(&tb[ln], kArg));
	if(ln < 0)
		return 0;
	return &tb[ln];
}

// включення за лінійним пошуком
struct record *insertLinear(struct record *pElm, struct record *tb, int *pQnElm)
{
	unsigned long n = 0;
	while(n < (unsigned long)*pQnElm && tb[n].key.str[0] != 0)
		n++;
	if(n == *pQnElm)
		(*pQnElm)++;
	tb[n] = *pElm;
	return &tb[n];
}

// вилучення за лінійним пошуком
struct record *deleteLinear(struct record *pElm, struct record *tb, int *pQnElm)
{
	struct record *pEl = selectLinear(pElm->key, tb, *pQnElm);
	if(pEl)
		pEl->_del=-1;
	return pEl;
}

// корекція за лінійним пошуком
struct record *updateLinear(struct keyString kArg, struct record *pElm, struct record *tb, int *pQnElm)
{
	struct record *pEl = selectLinear(kArg, tb, *pQnElm);
	if(pEl)
		*pEl = *pElm;
	return pEl;
}

// пакування для лінійного пошуку
struct record *packLinear(struct record *tb, int *pQnElm)
{
	int n=0, ln=0; 
	while(n < *pQnElm)
	{
		if(tb[n]._del==0)
		{
			tb[ln] = tb[n];
			ln++;
		} 
		n++;
	} 
	*pQnElm = ln;
	return tb;
}

//------------------------------------------------------
// порівняння рядків
int cmpStr(unsigned char* s1, unsigned char* s2)
{
	unsigned n = 0; 
	while(s1[n] == s2[n] && s1[n] != 0)
		n++;
	return s1[n]-s2[n];
}

// порівняння за відношенням порядку рядкыв
int cmpKey(struct record* el, struct keyString kArg)
{
	int i = cmpStr((unsigned char*)el->key.str,(unsigned char*)kArg.str);
	if(i)
		return i;
	return el->key.nMod - kArg.nMod;
}

// порівняння за відношенням порядку
int cmpKys(struct keyString *k0, struct keyString *kArg)	
{
	int i = cmpStr((unsigned char*)k0->str, (unsigned char*)kArg->str);
	if(i)
		return i;
	return k0->nMod - kArg->nMod;
}

//------------------------------------------------------
// сортування для двійкового пошуку
struct record *sortBinary(struct record *tb, int ln)
{
	int n = 0, n1;
	struct record el;
	for(; n < ln; n++)
		for(n1 = n + 1; n1 < ln; n1++)
			if(cmpKey(&tb[n], tb[n1].key) > 0)
			{
				el = tb[n];
				tb[n] = tb[n1];
				tb[n1] = el;
			}
	return tb;
}

// вибірка за двійковим пошуком
struct record *selectBinary(struct keyString kArg, struct record *tb, int ln)
{
	int i, nD = -1, nU = ln, n = nD + nU/2;
	while(i = cmpKey(&tb[n], kArg))
	{
		if(i > 0)
			nU = n;
		else
			nD = n;
		n = (nD + nU) >> 1;
		if(n == nD)
			return NULL;
	}
	return &tb[n];
}


// включення за двійковим пошуком
struct record *insertBinary(struct record *pElm, struct record *tb, int *pQnElm)
{
	struct record *pr = selectBinary(pElm->key, tb, *pQnElm);
	if(pr)
	{
		struct functionString s = pElm->func;
		pr->func = s;
		return pr;
	}
	// При відсутності елементу звільнити для нього місце,
	// просунувши останні елементи в таблиці на одне заипс вперед
	// Записати новий елемент на звільнене місце
	int n;
	if(pr == NULL)
		for(n = *pQnElm; n > 0; n--)
			tb[n] = tb[n - 1];
	tb[n] = *pElm;
	return &tb[n];
}

// вилучення за двійковим пошуком
struct record *deleteBinary(struct record *pElm, struct record*tb, int*pQnElm)
{
	struct record *pr = selectBinary(pElm->key, tb, *pQnElm);
	// при знаходженні елементу помітити його для вилучення 
	if(pr)
		 pr->_del=-1;
	return pr;
}

// корекція за двійковим пошуком
struct record *updateBinary(struct keyString kArg, struct record *pElm, struct record *tb, int *pQnElm)
{
	// при знаходженні елементу заповнити його новими значеннями полів
	struct record *pr = selectBinary(kArg, tb, *pQnElm);
	pr->func = pElm->func;
	pr->key = pElm->key;
	pr->_del = pElm->_del;
	return pr;	
}
