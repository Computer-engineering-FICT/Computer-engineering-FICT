/*
 * system.cpp
 *
 *  Created on: 05.12.2009
 *      Author: Shieghtun
 */

#include <math.h>
#include <stdlib.h>

#include "system.h"

int system::processAmount;
int system::physPages;
int system::swapPages;
pageDescriptor* system::operativeMemory;
pageDescriptor* system::swap;
process* system::managed;


void system::init()
{
	printf("Initialize overall model:\n");
	printf("Amount of pages in physical memory of model is 32\n");
	physPages = 32;
	operativeMemory = new pageDescriptor[32];
	int i;
	for (i = 0; i < 32; i++)
	{
		operativeMemory[i].memUsing = 0;
		operativeMemory[i].page = NULL;
	}
	printf("Input amount of processes: \n");
	scanf("%d", &processAmount);
	managed = new process[processAmount];
	swapPages = 0;
	for (i = 0; i < processAmount; i++)
	{
		managed[i].init();
		swapPages += managed[i].pages;
	}
	swapPages -= 32;
	if (swapPages > 0)
	{
		swap = new pageDescriptor[swapPages];
		for (i = 0; i < swapPages; i++)
		{
			swap[i].memUsing = 0;
			swap[i].page = NULL;
		}
	}
	else swapPages = 0;
}

void system::printReport(FILE* dst, int processId)
{
	int i = 0;
	if (processId != 0)
		for (i = 0; i < processAmount; i++)
			managed[i].stateDump(dst);
	else
		managed[processId].stateDump(dst);
}

void system::run(int steps)
{
	int processId;
	int i;
	for (i = 0; i < steps; i++)
	{
		processId = (int)floor(rand()*((float)processAmount)/RAND_MAX);
		printf("Process # %d\n", processId);
		void** page = managed[processId].selectPage();
		if ((((unsigned long)(*page)) & 0xfffffff8) == NULL)
			loadPage(page);
		else if((((unsigned long)(*page))&0x00000004) == 0)
			reloadPage(page);
		else
			callPage(page);
		*page = (void*)((unsigned long)*page | 0x00000004);
	}
}

void system::callPage(void** page)
{
	int i;
	for (i = 0; i < 32; i++)
	{
		operativeMemory[i].memUsing = operativeMemory[i].memUsing >> 1;
	}
	pageDescriptor* p = (pageDescriptor*)((unsigned long)(*((void**)page)) & 0xfffffff8)
		;
	(*p).memUsing = (*p).memUsing | 0x80000000;
	printf("Call used\n");
}

void system::loadPage(void** page)
{
	bool loaded = false;
	int i;
	for (i = 0; ((i < 32) && !loaded); i++)
		if (operativeMemory[i].page == NULL)
		{
			*page = (void*)&(operativeMemory[i]);
			operativeMemory[i].page = page;
			operativeMemory[i].memUsing = 0x80000000;
			loaded = true;
		}
	for(i = 0; ((i < swapPages) && !loaded); i++)
		if (swap[i].page == NULL)
		{
			int place = findPlace();
			swap[i].page = operativeMemory[place].page;
			*(operativeMemory[place].page) = (void*)&(swap[i]);
			swap[i].memUsing = 0;
			operativeMemory[place].page = page;
			operativeMemory[place].memUsing = 0x80000000;
			loaded = true;
		}
	printf("Load page used");
}

void system::reloadPage(void** page)
{
	pageDescriptor* t = (pageDescriptor*)*page;
	(*t).page = NULL;
	printf("Reload used and ");
	loadPage(page);
}

int system::findPlace()
{
	int i;
	int res = 0;
	for(i = 1; i < 32; i++)
		if (operativeMemory[i].memUsing < operativeMemory[res].memUsing)
		{
			operativeMemory[res].memUsing = operativeMemory[i].memUsing;
			res = i;
		}
	return res;
}
