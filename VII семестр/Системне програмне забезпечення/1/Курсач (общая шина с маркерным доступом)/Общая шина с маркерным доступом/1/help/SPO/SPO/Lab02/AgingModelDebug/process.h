/*
 * process.h
 *
 *  Created on: 04.12.2009
 *      Author: Shieghtun
 */

#ifndef PROCESS_H_
#define PROCESS_H_

#include <stdio.h>
#include <conio.h>

class process
{
private:
	void** pageDescryptors;
public:
	int pages;
	int activePages;
	void init();
	void** selectPage();
	void stateDump(FILE* dst);
};

#endif /* PROCESS_H_ */
