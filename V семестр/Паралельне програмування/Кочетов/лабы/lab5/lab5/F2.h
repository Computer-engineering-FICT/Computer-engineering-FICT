#pragma once
#include <iostream>
#include "Matrix.h"

class F2 {
private:
	Matrix* result;
	int N;
public:
	F2(int N);
	Matrix* getResult();
	void run();
};
