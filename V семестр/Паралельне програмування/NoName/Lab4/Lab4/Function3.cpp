#include "stdafx.h"
#include "Function3.h"

DWORD WINAPI StartFunctionThree(CONST LPVOID lpParam) {
	int sizeOfArrays = 100;
	int* t, *p, *s;
	int** mo, **mr, **ms;
	Methods methods(sizeOfArrays);
	s = methods.fillVectorOfOne();
	p = methods.fillVectorOfOne();

	mo = methods.fillMatrixOfOne();
	mr = methods.fillMatrixOfOne();
	ms = methods.fillMatrixOfOne();

	t = methods.sumOfVectors(methods.matrixToVector(methods.multMatrix(mo, methods.vectorToMatrixOnColumn(p))), methods.matrixToVector(methods.multMatrix(methods.multMatrix(mr, ms), methods.vectorToMatrixOnColumn(s))));

	printf("Function 3 started\n");
	CONST HANDLE hMutex = (CONST HANDLE)lpParam;
	WaitForSingleObject(hMutex, INFINITE);
		
		methods.putVector(t);
		printf("Function 3 ended\n");
	ReleaseMutex(hMutex);
	ExitThread(0);
}
