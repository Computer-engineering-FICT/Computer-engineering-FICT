//          Assignment #4
//    Student: Andrew Logvinchuk
//    Group:   IO-41
//    Date:    23/10/2016
//
//    F1 = ((A+B)*((MA*ME)*C))
//    F2 = SORT(TRANS(MF)*MK)
//    F3 = MAX((MO*MP)*R+MS*S)

#include "Data.h"

#include <windows.h>
#include <iostream>

#define THREAD_STACK_SIZE 1000000 // 1 MB
#define N 1500

#pragma push_macro("max")
#undef max

void Thread1();
void Thread2();
void Thread3();

using namespace std;

int main()
{
	DWORD Tid1, Tid2, Tid3;
	HANDLE T1 = CreateThread(NULL, THREAD_STACK_SIZE, (LPTHREAD_START_ROUTINE) Thread1, NULL, CREATE_SUSPENDED, &Tid1);
	HANDLE T2 = CreateThread(NULL, THREAD_STACK_SIZE, (LPTHREAD_START_ROUTINE) Thread2, NULL, CREATE_SUSPENDED, &Tid2);
	HANDLE T3 = CreateThread(NULL, THREAD_STACK_SIZE, (LPTHREAD_START_ROUTINE) Thread3, NULL, CREATE_SUSPENDED, &Tid3);

	SetThreadPriority(T1, 1);
	SetThreadPriority(T2, 2);
	SetThreadPriority(T3, 3);

	ResumeThread(T1);
	ResumeThread(T2);
	ResumeThread(T3);

	WaitForSingleObject(T1, INFINITE);
	WaitForSingleObject(T2, INFINITE);
	WaitForSingleObject(T3, INFINITE);

	CloseHandle(T1);
	CloseHandle(T2);
	CloseHandle(T3);

	cout << "Main thread finished execution!\n";
	system("pause");
	return 0;
}

void Thread1()
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

void Thread2()
{
	cout << "Thread 2 started!\n";

	Matrix* MF = new Matrix(N, true);
	Matrix* MK = new Matrix(N, true);

	Matrix* ML = (*MF->transpose() * *MK)->sort();

	Sleep(100);
	printf("F2 = \n");
	ML->print();
	delete MF, MK, ML;

	cout << "Thread 2 finished execution!\n";
}

void Thread3()
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