#include <conio.h>

#include "process.h"
#include "manager.h"

int main()
{
	printf("WSClock modelling program\n");
	Manager master = Manager();
	master.init();
	master.printReport(0, NULL);
	_getch();
	for (int i = 0; i < 3000; i++)
		master.step();
	_getch();
	master.printReport(0, NULL);
	_getch();
}