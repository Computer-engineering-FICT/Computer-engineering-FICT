// Macros.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "limits.h"

#define MIN(a, b)  (((a) < (b)) ? (a) : (b))


int _tmain(int argc, _TCHAR* argv[])
{

	int min = 0;
	min = 0 - MIN (1, 2&2);
	printf("%d\n", min);
	return 0;
}

