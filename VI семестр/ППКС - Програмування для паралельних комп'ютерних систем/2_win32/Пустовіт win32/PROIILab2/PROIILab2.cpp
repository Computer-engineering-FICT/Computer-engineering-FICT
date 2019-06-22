/**
 * @author Pustovit Michael IO-73
 * Paralel and distributed computing             
 * Laboratory work #2. Win32
 * 24.02.2010
 */

#include "stdafx.h"
#include "windows.h"
#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

const int N = 8;
const int P = 4;
const int H = N/P;

//========================================================
class Vector {
	public:
		int vect[N];
		void InputVector();
		void OutputVector();
};

void Vector::InputVector() {
	int i;
	for (i = 0; i < N; i++) 
		vect[i] = 1;
}

void Vector::OutputVector(){
	int i;
	if (N <= 8) {
		for (i = 0; i < N; i++) 
			cout << vect[i] << "  ";
		cout << "\n";
	}
}

//========================================================
int MultVector(Vector *a, Vector *b) {
	int res = 0;
	int i;
	for (i = 0; i < N; i++)
		res = res + a->vect[i] * b->vect[i];
	return res;
}
//========================================================
class Matrix {
	public:
		Vector mas[N];
		void InputMatrix();
		void OutputMatrix();
};

void Matrix::InputMatrix() {
	int i;
	for (i = 0; i < N; i++) 
		mas[i].InputVector();
}

void Matrix::OutputMatrix() {
	int i;
	for (i = 0; i < N; i++) 
		mas[i].OutputVector();
}

//========================================================

Vector A, B, C;
Matrix MZ, MO, MT, MC;

//Semaphores
HANDLE S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12,  SKD;

//Critical sections
CRITICAL_SECTION CS;

//Mutex
HANDLE Mut;

//Events
HANDLE Eve1, Eve2, Eve3;

//========================================================
void T1() 
{
	Vector B1, C1;
	Matrix MT1;
	int task = 1; //Task number

	cout << "T1: started" << endl;
	B.InputVector();
	ReleaseSemaphore(S1, 3, NULL);

	cout << "T1: B input finished" << endl;

	WaitForSingleObject(S2, INFINITE);

	EnterCriticalSection(&CS);
		B1 = B;
	LeaveCriticalSection(&CS);

	int sum;
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + B1.vect[j] * MZ.mas[j].vect[i];
		}
		C.vect[i] = sum;
	}

	ReleaseSemaphore(S3, 3, NULL);

	cout << "T1: Calculating C finished" << endl;
	
	WaitForSingleObject(S7, INFINITE);
	WaitForSingleObject(S8, INFINITE);

	WaitForSingleObject(Mut, INFINITE);
		MT1 = MT;
	ReleaseMutex(Mut);

	for (int z = (task - 1) * H; z < task * H; z++){ 		
		for (int i = 0; i < N; i++) {			
			sum = 0;
			for (int j = 0; j < N; j++) {
				sum = sum +  MO.mas[z].vect[j] * MT1.mas[j].vect[i];
			}
			MC.mas[z].vect[i] = sum;
		}
	}

	ReleaseSemaphore(S5, 3, NULL);

	cout << "T1: calculating MC finished" << endl;

	WaitForSingleObject(S4, INFINITE);
	WaitForSingleObject(S9, INFINITE);
	WaitForSingleObject(S10, INFINITE);

	WaitForSingleObject(SKD, INFINITE);
		C1 = C;
	ReleaseSemaphore(SKD, 1, NULL);

	WaitForSingleObject(S6, INFINITE);
	WaitForSingleObject(S11, INFINITE);
	WaitForSingleObject(S12, INFINITE);

	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + C1.vect[j] * MC.mas[j].vect[i];
		}
		A.vect[i] = sum;
	}

	cout << "T1: calculating A finished" << endl;

	WaitForSingleObject(Eve1, INFINITE);
	WaitForSingleObject(Eve2, INFINITE);
	WaitForSingleObject(Eve3, INFINITE);

	A.OutputVector();
	cout << "T1: finished" << endl;
}

//========================================================
void T2() 
{
	Vector B2, C2;
	Matrix MT2;
	int task = 2; //Task number

	cout << "T2 started" << endl;
	MZ.InputMatrix();
	ReleaseSemaphore(S2, 3, NULL);
	
	cout << "T2: input MZ finished" << endl;

	WaitForSingleObject(S1, INFINITE);

	EnterCriticalSection(&CS);
		B2 = B;
	LeaveCriticalSection(&CS);

	int sum;
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + B2.vect[j] * MZ.mas[j].vect[i];
		}
		C.vect[i] = sum;
	}

	ReleaseSemaphore(S4, 3, NULL);

	cout << "T2: calculating C finished" << endl;
	
	WaitForSingleObject(S7, INFINITE);
	WaitForSingleObject(S8, INFINITE);

	WaitForSingleObject(Mut, INFINITE);
		MT2 = MT;
	ReleaseMutex(Mut);

	for (int z = (task - 1) * H; z < task * H; z++){ 		
		for (int i = 0; i < N; i++) {			
			sum = 0;
			for (int j = 0; j < N; j++) {
				sum = sum +  MO.mas[z].vect[j] * MT2.mas[j].vect[i];
			}
			MC.mas[z].vect[i] = sum;
		}
	}

	ReleaseSemaphore(S6, 3, NULL);

	cout << "T2: calculating MC finished" << endl;

	WaitForSingleObject(S3, INFINITE);
	WaitForSingleObject(S9, INFINITE);
	WaitForSingleObject(S10, INFINITE);

	WaitForSingleObject(SKD, INFINITE);
		C2 = C;
	ReleaseSemaphore(SKD, 1, NULL);

	WaitForSingleObject(S5, INFINITE);
	WaitForSingleObject(S11, INFINITE);
	WaitForSingleObject(S12, INFINITE);

	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + C2.vect[j] * MC.mas[j].vect[i];
		}
		A.vect[i] = sum;
	}
	
	cout << "T2: calculating A finished" << endl;

	SetEvent(Eve1);
	cout << "T2: finished" << endl;
}

//========================================================
void T3() 
{
	Vector B3, C3;
	Matrix MT3;
	int task = 3; //Task number

	cout << "T3: started" << endl;
	MO.InputMatrix();
	ReleaseSemaphore(S7, 3, NULL);
	
	cout << "T3: input MO finished" << endl;

	WaitForSingleObject(S1, INFINITE);
	WaitForSingleObject(S2, INFINITE);

	EnterCriticalSection(&CS);
		B3 = B;
	LeaveCriticalSection(&CS);

	int sum;
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + B3.vect[j] * MZ.mas[j].vect[i];
		}
		C.vect[i] = sum;
	}

	ReleaseSemaphore(S9, 3, NULL);

	cout << "T3: processing C finished" << endl;
		
	WaitForSingleObject(S8, INFINITE);

	WaitForSingleObject(Mut, INFINITE);
		MT3 = MT;
	ReleaseMutex(Mut);

	for (int z = (task - 1) * H; z < task * H; z++){ 		
		for (int i = 0; i < N; i++) {			
			sum = 0;
			for (int j = 0; j < N; j++) {
				sum = sum +  MO.mas[z].vect[j] * MT3.mas[j].vect[i];
			}
			MC.mas[z].vect[i] = sum;
		}
	}

	ReleaseSemaphore(S11, 3, NULL);

	cout << "T3: processing MC finished" << endl;

	WaitForSingleObject(S3, INFINITE);
	WaitForSingleObject(S4, INFINITE);
	WaitForSingleObject(S10, INFINITE);

	WaitForSingleObject(SKD, INFINITE);
		C3 = C;
	ReleaseSemaphore(SKD, 1, NULL);

	WaitForSingleObject(S5, INFINITE);
	WaitForSingleObject(S6, INFINITE);
	WaitForSingleObject(S12, INFINITE);

	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + C3.vect[j] * MC.mas[j].vect[i];
		}
		A.vect[i] = sum;
	}
	
	cout << "T3:  processing A finished" << endl;

	SetEvent(Eve2);
	cout << "T3: finished" << endl;
}

//========================================================
void T4() 
{
	Vector B4, C4;
	Matrix MT4;
	int task = 4; //Task number

	cout << "T4: started" << endl;
	MT.InputMatrix();
	ReleaseSemaphore(S8, 3, NULL);

	cout << "T4: input MT finished" << endl;

	WaitForSingleObject(S1, INFINITE);
	WaitForSingleObject(S2, INFINITE);

	EnterCriticalSection(&CS);
		B4 = B;
	LeaveCriticalSection(&CS);

	int sum;
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + B4.vect[j] * MZ.mas[j].vect[i];
		}
		C.vect[i] = sum;
	}

	ReleaseSemaphore(S10, 3, NULL);

	cout << "T4: processing C finished" << endl;
		
	WaitForSingleObject(S7, INFINITE);

	WaitForSingleObject(Mut, INFINITE);
		MT4 = MT;
	ReleaseMutex(Mut);

	for (int z = (task - 1) * H; z < task * H; z++){ 		
		for (int i = 0; i < N; i++) {			
			sum = 0;
			for (int j = 0; j < N; j++) {
				sum = sum +  MO.mas[z].vect[j] * MT4.mas[j].vect[i];
			}
			MC.mas[z].vect[i] = sum;
		}
	}

	ReleaseSemaphore(S12, 3, NULL);

	cout << "T4: processing MC finished" << endl;

	WaitForSingleObject(S3, INFINITE);
	WaitForSingleObject(S4, INFINITE);
	WaitForSingleObject(S9, INFINITE);

	WaitForSingleObject(SKD, INFINITE);
		C4 = C;
	ReleaseSemaphore(SKD, 1, NULL);

	WaitForSingleObject(S5, INFINITE);
	WaitForSingleObject(S6, INFINITE);
	WaitForSingleObject(S11, INFINITE);

	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + C4.vect[j] * MC.mas[j].vect[i];
		}
		A.vect[i] = sum;
	}
	
	cout << "T4: processing A finished" << endl;

	SetEvent(Eve3);
	cout << "T4 finished" << endl;
}

//========================================================
int _tmain(int argc, _TCHAR* argv[])
{
	DWORD Tid1, Tid2, Tid3, Tid4;
	HANDLE Thread1,  Thread2, Thread3, Thread4;
	
	cout << "Program started with H = " << H << endl;

	Eve1 = CreateEvent(NULL, 0, 0, NULL);
	Eve2 = CreateEvent(NULL, 0, 0, NULL);
	Eve3 = CreateEvent(NULL, 0, 0, NULL);

	S1 = CreateSemaphore(NULL, 0, 3, NULL);
	S2 = CreateSemaphore(NULL, 0, 3, NULL);
	S3 = CreateSemaphore(NULL, 0, 3, NULL);
	S4 = CreateSemaphore(NULL, 0, 3, NULL);
	S5 = CreateSemaphore(NULL, 0, 3, NULL);
	S6 = CreateSemaphore(NULL, 0, 3, NULL);
	S7 = CreateSemaphore(NULL, 0, 3, NULL);
	S8 = CreateSemaphore(NULL, 0, 3, NULL);
	S9 = CreateSemaphore(NULL, 0, 3, NULL);
	S10 = CreateSemaphore(NULL, 0, 3, NULL);
	S11 = CreateSemaphore(NULL, 0, 3, NULL);
	S12 = CreateSemaphore(NULL, 0, 3, NULL);
	SKD = CreateSemaphore(NULL, 1, 1, NULL);

	Mut = CreateMutex(NULL, 0, NULL);

	InitializeCriticalSection(&CS);

	size_t st = 50 * 1024 * 1024;

	Thread1 = CreateThread(NULL, st, (LPTHREAD_START_ROUTINE) T1, NULL, 0, &Tid1);
	Thread2 = CreateThread(NULL, st, (LPTHREAD_START_ROUTINE) T2, NULL, 0, &Tid2);
	Thread3 = CreateThread(NULL, st, (LPTHREAD_START_ROUTINE) T3, NULL, 0, &Tid3);
	Thread4 = CreateThread(NULL, st, (LPTHREAD_START_ROUTINE) T4, NULL, 0, &Tid4);
	
	CloseHandle(Thread1);
	CloseHandle(Thread2);
	CloseHandle(Thread3);

	cin.get();
	return 0;
}