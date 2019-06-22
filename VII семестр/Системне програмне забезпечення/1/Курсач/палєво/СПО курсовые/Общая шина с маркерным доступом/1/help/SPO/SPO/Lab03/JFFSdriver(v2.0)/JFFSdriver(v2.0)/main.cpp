#include <conio.h>
#include <stdio.h>

#include "AM_File.h"
#include "AreaManager.h"
#include "FM_File.h"
#include "FileManager.h"

//#define FILE_MANAGER_TEST

int main()
{
#ifdef FILE_MANAGER_TEST
	printf("Testing FileManager: \n");
	FileManager tst = FileManager();
	tst.addFile(1, 5, 6);
	tst.checkActual(1, 6);
	tst.incLinks(1);
	tst.addFile(2, 10, 3);
	tst.decLinks(2);
	tst.open(1);
	tst.write(1, 0, 5, "some", 1);
	printf(tst.read(1, 1, 4));
#endif //FILE_MANAGER_TEST
#ifdef FM_FILE_TEST
	printf("Testing FM_File: \n");
	FM_File tst = FM_File();
	tst.setSize(10);
	if (tst.open())
		printf("File open success\n");
	if (tst.open())
		printf("File DoubleOpen success\n");
	char* toWrite = "012345678";
	tst.write(0, 10, toWrite);
	printf("First read: \n");
	printf(tst.read(2, 8));
	tst.close();
	char* t2 = tst.read(2, 8);
	if (t2 != NULL)
	{
		printf("Second read: \n");
		printf(t2);
	}
#endif //FM_FILE_TEST
#ifdef AM_FILE_TEST
	printf("Testing single AM_File: ");
	AM_File tst = AM_File();
	tst.id = 0;
	tst.next = NULL;
	tst.setSize(5);
	tst.setActual(1, 0, 3);
	tst.setActual(2, 3, 2);
	for (int i = 0; i < 4; i++)
		if (tst.checkActual(i))
			printf("Command %u is actual\n", i);
		else
			printf("Command %u is not actual\n", i);
#endif //AM_FILE_TEST
#ifdef AREAMGR_TEST
	printf("Testing AreaManager: \n");
	AreaManager tstMgr = AreaManager();
	tstMgr.addFile(1, 30, 2);
	if (tstMgr.checkActual(1, 2))
		printf("Command 2 is Actual\n");
	else
		printf("Something flies\n");
	tstMgr.setSize(1, 20);
	tstMgr.setActual(1, 3, 0, 10);
	if (tstMgr.checkActual(1, 3))
		printf("Command 3 is Actual\n");
	else
		printf("Something flies\n");
	if (tstMgr.checkActual(1, 2))
		printf("Command 2 is Actual\n");
	else
		printf("Something flies\n");
	if (tstMgr.checkActual(1, 5))
		printf("Command 5 is Actual\n");
	else
		printf("Something flies\n");
	tstMgr.addFile(3, 30, 5);
	if (tstMgr.checkActual(3, 5))
		printf("Command 5 is Actual\n");
	else
		printf("Something flies\n");
#endif //AREAMGR_TEST
	_getch();
}