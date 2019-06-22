//          Assignment #5
//    Student: Andrew Logvinchuk
//    Group:   IO-41
//    Date:    26/10/2016
//
//    F1 = ((A+B)*((MA*ME)*C))
//    F2 = SORT(TRANS(MF)*MK)
//    F3 = MAX((MO*MP)*R+MS*S)

#include "Data.h"
#include "omp.h"

#include <windows.h>
#include <iostream>

#define N 5

#pragma push_macro("max")
#undef max

void Task1();
void Task2();
void Task3();

using namespace std;

int main()
{
#pragma omp parallel num_threads(3)
	{
		int i = omp_get_thread_num();
		if (i == 0)
			Task1();
		if (i == 1)
			Task2();
		if (i == 2)
			Task3();
	}
	cout << "Main thread finished execution!\n";
	system("pause");
	return 0;
}

void Task1()
{
	cout << "Thread 1 started!\n";

	Vector* A = new Vector(N, true);
	Vector* B = new Vector(N, true);
	Vector* C = new Vector(N, true);
	Matrix* MA = new Matrix(N, true);
	Matrix* ME = new Matrix(N, true);

	int d = *(*A + *B) * *(*(*MA * *ME) * *C);
	delete A, B, C, MA, ME;
	Sleep(1000);
	printf("F1 = %d\n", d);

	cout << "Thread 1 finished execution!\n";
}

void Task2()
{
	cout << "Thread 2 started!\n";

	Matrix* MF = new Matrix(N, true);
	Matrix* MK = new Matrix(N, true);

	Matrix* ML = (*MF->transpose() * *MK)->sort();

	Sleep(100);
	printf("F2 = \n");
#pragma omp critical
	{
		ML->print();
	}
	delete MF, MK, ML;

	cout << "Thread 2 finished execution!\n";
}

void Task3()
{
	cout << "Thread 3 started!\n";

	Vector* R = new Vector(N, true);
	Vector* S = new Vector(N, true);
	Matrix* MO = new Matrix(N, true);
	Matrix* MP = new Matrix(N, true);
	Matrix* MS = new Matrix(N, true);

	int t = (*(*(*MO * *MP) * *R) + *(*MS * *S))->max();
	delete R, S, MO, MP, MS;
	printf("F3 = %d\n", t);

	cout << "Thread 3 finished execution\n";
}