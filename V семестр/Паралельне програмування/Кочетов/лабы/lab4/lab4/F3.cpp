#include "F3.h"

F3::F3(int N) {
	this->N = N;
}

Vector* F3::getResult() {
	return result;
}

DWORD WINAPI F3::startThread(void* param) {
	F3* This = (F3*)param;
	return This->run();
}

DWORD F3::run() {
	cout << "Task 3 start\n";
	Vector* S = new Vector(N);
	Matrix *MO = new Matrix(N), *MP = new Matrix(N), *MR = new Matrix(N);
	result = MO->multiply(MP)->multiply(S)->sum(MR->multiply(S->sort()));
	cout << "Task 3 end\n";
	delete S;
	delete MO;
	delete MP;
	delete MR;
	return 0;
}