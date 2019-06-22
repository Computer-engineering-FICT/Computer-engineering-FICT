#include "stdafx.h"
#include "Function1.h"

Function1::Function1(int sizeOfArrays)
{
	this->sizeOfArrays = sizeOfArrays;
}


Function1::~Function1()
{
}


void Function1::StartFunction(unsigned int& start) {

	unsigned int myStart = clock();

	Methods methods(sizeOfArrays);

	b = methods.fillVectorOfOne();
	c = methods.fillVectorOfOne();
	d = methods.fillVectorOfOne();
	md = methods.fillMatrixOfOne();
	me = methods.fillMatrixOfOne();

	a = methods.sumOfVectors(methods.sumOfVectors(b, c), methods.matrixToVector(methods.multMatrix(methods.vectorToMatrixOnRow(d), methods.multMatrix(md, me))));

	unsigned int myEnd = clock();
	start = myEnd - myStart;

	#pragma omp critical
	{
		printf("Function 1 started\n");
		methods.putVector(a);
		printf("Function 1 ended\n");
	}
}