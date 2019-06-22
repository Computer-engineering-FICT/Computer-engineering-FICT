#include <math.h>
#include <stdlib.h>

#include "manager.h"

void Manager::init()
{
	printf("Input amount of processes\n");
	scanf("%d", &amp);
	//printf("\n");
	prs = new Process[amp];
	int t1;
	int t2;
	ampages = 0;
	for (int i = 0; i < amp; i++)
	{
		printf("Input amount of pages for process %d\n", i);
		scanf("%d", &t1);
		printf("Input amount of active pages for process %d\n", i);
		scanf("%d", &t2);
		prs[i].init(t1, t2);
		ampages =+ t1;
	}
	printf("Input maximum amount of pages to write \n");
	scanf("%d", &cwMax);
	cells = new int[cwMax];
	pages = new PageDescr[ampages];
	currPage = 0;
}

void Manager::printReport(int n, FILE *dst)
{
	prs[n].report(dst);
}

void Manager::step()
{
	//select process
	int pId = (int)floor((float)((amp*rand()))/RAND_MAX);
	int pageId = prs[pId].selPage();
	bool done = false;
	cellsWrite = 0;
	int endCycle = currPage;
	do
	{
		if ((prs[pId].pages[pageId] & 0xfffffffc) != 0)
		{
			pages[(prs[pId].pages[pageId] >> 2)].pageData = 
				pages[(prs[pId].pages[pageId] >> 2)].pageData | 0x00000003; // mark as dirty
			printf("Called already loaded page, marked dirty\n");
			done = true;
		}
		else 
		{
			if ((pages[currPage].pageData & 0x00000001) != 0)
				pages[currPage].pageData = pages[currPage].pageData & 0xfffffffe;
			else
				// R == 0;
			{
				if ((pages[currPage].pageData & 0x00000002) == 0)
				{
					if (pages[currPage].processId < amp)
						prs[(pages[currPage].processId)].pages[(pages[currPage].pageData >> 2)] = 2;
					pages[currPage].processId = pId;
					pages[currPage].pageData = (pageId << 2) | 0x00000003;
					prs[pId].pages[pageId] = currPage;
					printf("Page was refreshed\n");
					done = true;
				}
				else 
				{
					if (cellsWrite < cwMax)
						cells[cellsWrite++] = currPage;
				}
			}
		}
		currPage = (currPage + 1) % ampages;
	}
	while ((done == false) && (currPage != endCycle));
	for (int i = 0; i < cellsWrite; i++)
		pages[cells[i]].pageData = pages[cells[i]].pageData & 0xfffffffd;
	do
	{
		if ((prs[pId].pages[pageId] & 0xfffffffc) != 0)
		{
			pages[(prs[pId].pages[pageId] >> 2)].pageData = 
				pages[(prs[pId].pages[pageId] >> 2)].pageData | 0x00000003; // mark as dirty
			printf("Called already loaded page, marked dirty\n");
			done = true;
		}
		else 
		{
			if ((pages[currPage].pageData & 0x00000001) != 0)
				pages[currPage].pageData = pages[currPage].pageData & 0xfffffffe;
			else
				// R == 0;
			{
				if ((pages[currPage].pageData & 0x00000002) == 0)
				{
					if (pages[currPage].processId < amp)
						prs[pages[currPage].processId].pages[(pages[currPage].pageData >> 2)] = 2;
					pages[currPage].processId = pId;
					pages[currPage].pageData = (pageId << 2) | 0x00000003;
					prs[pId].pages[pageId] = currPage;
					printf("Page was refreshed\n");
					done = true;
				}
				else 
				{
					if (cellsWrite < cwMax)
						cells[cellsWrite++] = currPage;
				}
			}
		}
		currPage = (currPage + 1) % ampages;
	}
	while (done == false);
}