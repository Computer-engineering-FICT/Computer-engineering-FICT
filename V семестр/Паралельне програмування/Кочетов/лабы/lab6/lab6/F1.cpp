#include "F1.h"

F1::F1(int N) {
	this->N = N;
}

Vector* F1::getResult() {
	return result;
}

void F1::run() {
	cout << "Task 1 start\n";
	Vector *A = new Vector(N), *B = new Vector(N), *D = new Vector(N);
	Matrix *MA = new Matrix(N), *ME = new Matrix(N);
	result = MA->multiply(ME)->multiply(A)->sum(B)->sum(D);
	cout << "Task 1 end\n";
	delete A;
	delete B;
	delete D;
	delete MA;
	delete ME;
}