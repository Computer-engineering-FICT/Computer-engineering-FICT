#include "stdafx.h"
#include "Function1.h"

 DWORD WINAPI StartFunctionOne(CONST LPVOID lpParam) {
	int sizeOfArrays = 100;
	int* a, *b, *c, *d;
	int** md, **me;
	Methods methods(sizeOfArrays);

	b = methods.fillVectorOfOne();
	c = methods.fillVectorOfOne();
	d = methods.fillVectorOfOne();
	md = methods.fillMatrixOfOne();
	me = methods.fillMatrixOfOne();

	a = methods.sumOfVectors(methods.sumOfVectors(b, c), methods.matrixToVector(methods.multMatrix(methods.vectorToMatrixOnRow(d), methods.multMatrix(md, me))));
	printf("Function 1 started\n");
	CONST HANDLE hMutex = (CONST HANDLE)lpParam;
	WaitForSingleObject(hMutex, INFINITE);
		
		methods.putVector(a);
		printf("Function 1 ended\n");
	ReleaseMutex(hMutex);
	ExitThread(0);
}