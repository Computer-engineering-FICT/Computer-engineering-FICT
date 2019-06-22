#include "F2.h"

F2::F2(int N) {
	this->N = N;
}

Matrix* F2::getResult() {
	return result;
}

DWORD WINAPI F2::startThread(void* param) {
	F2* This = (F2*) param;
	return This->run();
}

DWORD F2::run() {
	cout << "Task 2 start\n";
	Matrix *MF = new Matrix(N), *MG = new Matrix(N), *MH = new Matrix(N), *MK = new Matrix(N);
	result = MG->multiply(MF->get_min())->sum(MK->multiply(MF)->multiply(MH->get_max()));
	cout << "Task 2 end\n";
	delete MF;
	delete MG;
	delete MH;
	delete MK;
	return 0;
}