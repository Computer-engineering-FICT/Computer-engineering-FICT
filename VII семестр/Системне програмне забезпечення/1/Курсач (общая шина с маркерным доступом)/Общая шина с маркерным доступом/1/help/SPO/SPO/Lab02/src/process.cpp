/*
 * process.cpp
 *
 *  Created on: 05.12.2009
 *      Author: Shieghtun
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#include "process.h"

void process::init()
{
	printf("Configure next process\n");
	printf("Input amount of overall pages, used by process\n");
	scanf("%d", &pages);
	printf("Input amount of active pages");
	scanf("%d", &activePages);
	pageDescryptors = (void**)calloc(pages, 4);
}

void** process::selectPage()
{
	if (((rand()*(float)1.0)/RAND_MAX) > 0.9)
	{
		return &(pageDescryptors[(int)floor((rand()*(float)activePages)/RAND_MAX)]);
	}
	else
	{
		return &(pageDescryptors[((int)floor((rand()*(float)(pages - activePages))/RAND_MAX))
		                         + activePages]);
	}
}

void process::stateDump(FILE* dst) //fputs don't take list of variables redo all this
{
	int i = 0;
	char msg[255];
	char tmp[20];
	for(i = 0; i < pages; i++)
	{
		// fputs don't take list of variables redo all this
		strcpy(msg, "Page ");
		strcpy(tmp, "");
		_itoa(i, tmp, 10);
		strcat(msg, tmp);
		if (pageDescryptors[i] != NULL)
		{
			strcat(msg, "was activated");// may be troubles coz may be nonlinear reflection
			if ((((unsigned int)(pageDescryptors[i])) & 0x00000004) == 0)
				strcat(msg, " but now swapped.\n");
			else
				strcat(msg, " and now is in physical memory.\n");
		}
		else
			strcat(msg, "was not activated\n");
		printf(msg);
		_getch();
		if (dst!=NULL)
		{
			fprintf(dst, msg);
		}
	}
}
