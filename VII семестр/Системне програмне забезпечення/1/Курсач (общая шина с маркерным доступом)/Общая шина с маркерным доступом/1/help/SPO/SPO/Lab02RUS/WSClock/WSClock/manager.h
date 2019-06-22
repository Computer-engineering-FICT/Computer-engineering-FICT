#ifndef _MANAGER_H
#define _MANAGER_H

#include "process.h"

class PageDescr
{
public:
	unsigned long processId;
	unsigned long pageData;
};

class Manager
{
private:
	int amp;
	Process* prs;
	int cwMax;
	int cellsWrite;
	int* cells;
	PageDescr* pages;
	int ampages;
	int currPage;
public:
	void init();
	void printReport(int n, FILE* dst);
	void step();
};

#endif //_MANAGER_H