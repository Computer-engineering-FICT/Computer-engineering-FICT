#include <stdio.h>
#include <conio.h>

#include "JFFSdriver.h"

int main()
{
	printf("JFFS emulator\n");
	JFFSdriver::setReady();
	printf("Emulator loading\n");
	JFFSdriver t = JFFSdriver();
	t.setReady();
	t.commandCycle();
	_getch();
	return 0;
}