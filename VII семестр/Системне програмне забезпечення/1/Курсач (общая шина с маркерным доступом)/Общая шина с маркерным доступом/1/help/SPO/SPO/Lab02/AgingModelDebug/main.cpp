/*
 * main.cpp
 *
 *  Created on: 05.12.2009
 *      Author: Shieghtun
 */

#include <conio.h>

#include "process.h"
#include "system.h"

int main()
{
	printf("Program model for aging algorithm\n");
	printf("Initialize the system:");
	system model = system();
	model.init();
	model.printReport(NULL, 0);
	_getch();
	model.run(2000);
	model.printReport(NULL, 0);
	_getch();
	return 0;
}
