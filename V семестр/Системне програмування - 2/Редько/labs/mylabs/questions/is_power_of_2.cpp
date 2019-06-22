// ConsoleApplication1.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "math.h"


bool is_power_of_2(int x)
{
	return (x & (x - 1)) == 0;
}


int _tmain(int argc, _TCHAR* argv[])
{
	int x = 8;
	printf_s(is_power_of_2(8) ? "True\n": "False\n");

	return 0;
}