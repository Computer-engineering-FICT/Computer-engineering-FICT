#include "stdafx.h"
#include "Function2.h"

DWORD WINAPI StartFunctionTwo(CONST LPVOID lpParam) {
	int sizeOfArrays = 100;
	int** mf, **mg, **mk, **ml;
	Methods methods(sizeOfArrays);

	mg = methods.fillMatrixOfOne();
	mk = methods.fillMatrixOfOne();
	ml = methods.fillMatrixOfOne();

	mf = methods.sumOfMatrix(methods.transMatrix(mg), methods.multMatrix(mk, ml));

	printf("Function 2 started\n");
	CONST HANDLE hMutex = (CONST HANDLE)lpParam;
	WaitForSingleObject(hMutex, INFINITE);
		
		methods.putMatrix(mf);
		printf("Function 2 ended\n");
	ReleaseMutex(hMutex);
	ExitThread(0);
}