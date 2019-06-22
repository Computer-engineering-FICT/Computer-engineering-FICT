#include "stdafx.h"
#include "vistab.h"
#include "tables.h"

void printRow(struct record *rw)
{
	if(rw == 0)
		printf("is absent\n");
	else 
		if(rw->_del)
			printf("is deleted\n");
		else
			printf("%-10s %3u %5d\n", rw->key.str, rw->key.nMod, rw->func._f.i);
}

void printTable(struct record* rw, int n0, int n1)
{
	printf("  Table:\n");
	while(n0 <= n1)
	{
		printRow(rw + n0);
		n0++;
	}
}
