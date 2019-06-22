#pragma once
#include "Methods.h"
#include <ctime>

class Function2
{
public:
	Function2(int sizeOfArrays);
	~Function2();
	void StartFunction(unsigned int& start);
private:
	int sizeOfArrays;
	int** mf, **mg, **mk, **ml;
};
