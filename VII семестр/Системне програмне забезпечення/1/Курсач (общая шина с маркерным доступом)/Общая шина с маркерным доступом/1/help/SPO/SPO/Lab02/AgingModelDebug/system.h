/*
 * system.h
 *
 *  Created on: 05.12.2009
 *      Author: Shieghtun
 */

#ifndef SYSTEM_H_
#define SYSTEM_H_

#include "process.h"

class pageDescriptor
{
private:
public:
	void** page;
	unsigned long memUsing;
};

class system
{
private:
	static int physPages;
	static int swapPages;
	static int processAmount;
	static pageDescriptor* operativeMemory;
	static pageDescriptor* swap;
	static process* managed;
	static void loadPage(void** page);
	static void reloadPage(void** page);
	static void callPage(void** page);
	static int findPlace();
public:
	static void init();
	static void run(int steps);
	static void printReport(FILE* dst, int processId);
};

#endif /* SYSTEM_H_ */
