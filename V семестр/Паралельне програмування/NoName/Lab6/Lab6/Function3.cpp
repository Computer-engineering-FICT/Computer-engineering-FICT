#include "stdafx.h"
#include "Function3.h"

Function3::Function3(int sizeOfArrays)
{
	this->sizeOfArrays = sizeOfArrays;
}


Function3::~Function3()
{
}


void Function3::StartFunction(unsigned int& start) {

	unsigned int myStart = clock();
	
	Methods methods(sizeOfArrays);
	s = methods.fillVectorOfOne();
	p = methods.fillVectorOfOne();

	mo = methods.fillMatrixOfOne();
	mr = methods.fillMatrixOfOne();
	ms = methods.fillMatrixOfOne();

	t = methods.sumOfVectors(methods.matrixToVector(methods.multMatrix(mo, methods.vectorToMatrixOnColumn(p))), methods.matrixToVector(methods.multMatrix(methods.multMatrix(mr, ms), methods.vectorToMatrixOnColumn(s))));

	unsigned int myEnd = clock();
	start = myEnd - myStart;

	#pragma omp critical
	{
		printf("Function 3 started\n");
		methods.putVector(t);
		printf("Function 3 ended\n");
	}
}
