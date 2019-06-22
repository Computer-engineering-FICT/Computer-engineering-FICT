#include "process.h"

#include <math.h>
#include <stdlib.h>

void Process::init(int n, int acn)
{
	amount = n;
	active = acn;
	pages = new unsigned long[amount];
	for (int i = 0; i < amount; i++)
		pages[i] = 0;
}

int Process::selPage()
{
	int res = 0;
	if ((((float)rand())/RAND_MAX) < 0.9)
		res = (int)floor(((float)(rand()*active))/RAND_MAX);
	else 
		res = active + (int)floor(((float)(rand()*(amount - active)))/RAND_MAX);
	return res;
}

void Process::report(FILE *dst)
{
	char* msg;
	for (int i = 0; i < amount; i++)
	{
		msg = "";
		if (pages[i] == 0)
			msg = "Pages wasn't called\n";
		else 
			if (pages[i] == 2)
				msg = "Pages was swapped\n";
			else
				msg = "Page is in memory now\n";
		printf(msg);
		if (dst != NULL) 
			fputs(msg, dst);
	}
}