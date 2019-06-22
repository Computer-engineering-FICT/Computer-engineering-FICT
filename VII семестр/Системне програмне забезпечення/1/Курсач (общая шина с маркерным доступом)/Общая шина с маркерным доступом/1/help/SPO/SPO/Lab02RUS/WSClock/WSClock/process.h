#ifndef _PROCESS_H
#define _PROCESS_H

#include <stdio.h>

class PageDescr;

class Process
{
private:
	char amount;
	char active;
public:
	char state;
	unsigned long* pages;
	void init(int n, int acn);
	int selPage();
	void report(FILE* dst);
};

#endif //_PROCESS_H