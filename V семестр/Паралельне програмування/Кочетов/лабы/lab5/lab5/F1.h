#pragma once
#include <iostream>
#include "Matrix.h"

class F1 {
private:
	Vector* result;
	int N;
public:
	F1(int N);
	Vector* getResult();
	void run();
};
