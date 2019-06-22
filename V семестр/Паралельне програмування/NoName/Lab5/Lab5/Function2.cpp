#include "stdafx.h"
#include "Function2.h"

Function2::Function2(int sizeOfArrays)
{
	this->sizeOfArrays = sizeOfArrays;
}


Function2::~Function2()
{
}


void Function2::StartFunction(unsigned int& start)
{
	unsigned int myStart = clock();

	Methods methods(sizeOfArrays);

	mg = methods.fillMatrixOfOne();
	mk = methods.fillMatrixOfOne();
	ml = methods.fillMatrixOfOne();

	mf = methods.sumOfMatrix(methods.transMatrix(mg), methods.multMatrix(mk, ml));

	unsigned int myEnd = clock();
	start = myEnd - myStart;

	#pragma omp critical
	{
		printf("Function 2 started\n");
		methods.putMatrix(mf);
		printf("Function 2 ended\n");
	}
}