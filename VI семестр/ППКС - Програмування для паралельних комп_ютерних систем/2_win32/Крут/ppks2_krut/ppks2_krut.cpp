/*------------------------------------------------------------------
--                                                              --
--              Parallel and Distributed Computing              --
--                   Laboratory work #2. Win32                  --
--                                                              --
--                                                              --
--  Task: MA = d*MO*MK + min(Z)*MR                              --
--                                                              --
--  Author: Krut Vladyslav, group IO-43                         --
--  Date: 09.04.2017                                            --
--                                                              --
------------------------------------------------------------------ */


#include "stdafx.h"
#include <iostream>
#include <windows.h>

using namespace std;

typedef int* vector;
typedef int** matrix;

const int INFINITI = 1000000;

const int N = 4;
const int P = 4;
const int H = N / P;

int d;
int m = INFINITI;
vector Z = new int[N];
matrix MA = new vector[N],
MO = new vector[N],
MK = new vector[N],
MR = new vector[N];

HANDLE Evn1_234, Evn3_124, Evn4_123,
Mute, Sem_m[3], Sem_MA[3], Sem_min;
CRITICAL_SECTION CrSec1;
CRITICAL_SECTION CrSec2;
CRITICAL_SECTION CrSec3;
//-----------------------------------------T1--------------------------------------------
void T1(){
	int d1, m1, s;
	matrix MK1 = new vector[N];
	for (int i = 0; i < N; i++)
	{
		MK1[i] = new int[N];
	};

	cout << "Thread T1 started" << endl;
	//1. Введення d
	d = 1;

	//2. Сигнал задачам Т2, Т3, Т4 про введення d
	SetEvent(Evn1_234);
	//3. Чекати на введення MO, MR у задачі Т3
	WaitForSingleObject(Evn3_124, INFINITE);
	//4. Чекати на введення MK, Z у задачі T4
	WaitForSingleObject(Evn4_123, INFINITE);

	WaitForSingleObject(Sem_min, INFINITE);
	//5. Копіювати MK1 := MK
	WaitForSingleObject(Mute, INFINITE);
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			MK1[i][j] = MK[i][j];
		}
	}

	ReleaseMutex(Mute);
	//6. Копіювання d
	EnterCriticalSection(&CrSec1);
	d1 = d;
	LeaveCriticalSection(&CrSec1);

	//7. Обчислення m1 := min(ZH)
	m1 = INFINITI;
	for (int i = 0; i < H; i++)
	{
		m1 = min(m1, Z[i]);
	}
	//8. Обчислення m: = min(m, m1)
	EnterCriticalSection(&CrSec2);
	m = min(m, m1);
	LeaveCriticalSection(&CrSec2);
	//9. Чекати на завершення обчислень m в T2, T3, T4
	WaitForMultipleObjects(3, Sem_m, TRUE, INFINITE);
	//10. Копіювання m1: = m
	EnterCriticalSection(&CrSec3);
	m = min(m1, m);
	m1 = m;
	LeaveCriticalSection(&CrSec3);
	//11. Сигнал T2, T3, T4 про завершення обчислень m
	ReleaseSemaphore(Sem_min, 1, NULL);
	//12. Обчислення MAH = d1*MOH*MK1 + m1*MRH
	for (int i = 0; i < H; i++)
	{
		for (int j = 0; j < N; j++)
		{
			s = 0;
			for (int k = 0; k < N; k++)
			{
				s += MO[i][k] * MK1[k][j];
			}
			MA[i][j] = s*d1 + m1*MO[i][j];
		}
	}
	//13. Чекати на завершення обчислень MA в T2, T3, T4 
	WaitForMultipleObjects(3, Sem_MA, TRUE, INFINITE);
	//14. Виведення MA
	if (N<10)
	{
		for (int i = 0; i < N; i++)
		{
			for (int j = 0; j < N; j++)
			{
				cout << MA[i][j];
			}
			cout << endl;
		}
	}
	cout << "Thread T1 finished" << endl;
	
}
//-------------------------------------------T2-------------------------------------------
void T2(){
	int d2, s, m2;
	matrix MK2 = new vector[N];
	for (int i = 0; i < N; i++)
	{
		MK2[i] = new int[N];
	};

	cout << "Thread T2 started" << endl;
	//1. Чекати на введення d у задачі T1
	WaitForSingleObject(Evn1_234, INFINITE);
	//2. Чекати на введення MO, MR у задачі T3
	WaitForSingleObject(Evn3_124, INFINITE);
	//3. Чекати на введення MK, Z у задачі T4
	WaitForSingleObject(Evn4_123, INFINITE);
	//4. Копіювати MK2:= MK	
	WaitForSingleObject(Mute, INFINITE);
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			MK2[i][j] = MK[i][j];
		}
	}

	ReleaseMutex(Mute);
	//5. Копіювання d
	EnterCriticalSection(&CrSec1);
	d2 = d;
	LeaveCriticalSection(&CrSec1);

	//6. Обчислення m2 := min(ZH)
	m2 = INFINITI;
	for (int i = H; i < 2 * H; i++)
	{
		m2 = min(m2, Z[i]);
	}
	//7. Обчислення m: = min(m,m2)
	EnterCriticalSection(&CrSec2);
	m = min(m, m2);
	LeaveCriticalSection(&CrSec2);
	//8. Сигнал Т1 про про завершення обчислень m
	ReleaseSemaphore(Sem_m[0], 1, NULL);
	//9. Чекати сигналу від T1 про завершення обчислень m
	WaitForSingleObject(Sem_min, INFINITE);
	//10. Копіювання m2: = m
	EnterCriticalSection(&CrSec3);
	m2 = m;
	LeaveCriticalSection(&CrSec3);

	ReleaseSemaphore(Sem_min, 1, NULL);
	//11. Обчислення MAH = d2*MOH*MK2 + m2*MRH
	for (int i = H; i < 2 * H; i++)
	{
		for (int j = 0; j < N; j++)
		{
			s = 0;
			for (int k = 0; k < N; k++)
			{
				s += MO[i][k] * MK2[k][j];
			}
			MA[i][j] = s*d2 + m2*MO[i][j];
		}
	}
	//12. Сигнал T1 про завершення обчислень MA
	ReleaseSemaphore(Sem_MA[0], 1, NULL);

	cout << "Thread T2 finished" << endl;

}
//----------------------------------------T3----------------------------------------------
void T3() {
	int d3, s, m3;
	matrix MK3 = new vector[N];
	for (int i = 0; i < N; i++)
	{
		MK3[i] = new int[N];
		MA[i] = new int[N];
	};

	cout << "Thread T3 started" << endl;
	//1. Введення MO,MR
	for (int i = 0; i < N; i++)
	{
		MO[i] = new int[N];
		MR[i] = new int[N];
	};
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			MO[i][j] = 1;
			MR[i][j] = 1;
		}
	}

	//2. Сигнал задачам Т1, Т3, Т4 про введення МO, MR
	SetEvent(Evn3_124);
	//3. Чекати на введення d у задачі T1
	WaitForSingleObject(Evn1_234, INFINITE);
	//4. Чекати на введення MR, Z у задачі T4
	WaitForSingleObject(Evn4_123, INFINITE);
	//5. Копіювати MK3:= MK
	WaitForSingleObject(Mute, INFINITE);
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			MK3[i][j] = MK[i][j];
		}
	}

	ReleaseMutex(Mute);
	//6. Копіювання d
	EnterCriticalSection(&CrSec1);
	d3 = d;
	LeaveCriticalSection(&CrSec1);

	//7. Обчислення m3 := min(ZH)
	m3 = INFINITI;
	for (int i = 2 * H; i < 3 * H; i++)
	{
		m3 = min(m3, Z[i]);
	}
	//8. Обчислення m: = min(m,m3)
	EnterCriticalSection(&CrSec2);
	m = min(m, m3);
	LeaveCriticalSection(&CrSec2);
	//9. Сигнал Т1 про про завершення обчислень m
	ReleaseSemaphore(Sem_m[1], 1, NULL);
	//10. Чекати сигналу від T1 про завершення обчислень m
	WaitForSingleObject(Sem_min, INFINITE);

	//11. Копіювання m3: = m
	EnterCriticalSection(&CrSec3);
	m3 = m;
	LeaveCriticalSection(&CrSec3);

	ReleaseSemaphore(Sem_min, 1, NULL);
	//12. Обчислення MAH = d3*MOH*MK3 + m3*MRH
	for (int i = 2 * H; i < 3 * H; i++)
	{
		for (int j = 0; j < N; j++)
		{
			s = 0;
			for (int k = 0; k < N; k++)
			{
				s += MO[i][k] * MK3[k][j];
			}
			MA[i][j] = s*d3 + m3*MO[i][j];
		}
	}
	//13. Сигнал T1 про завершення обчислень MA
	ReleaseSemaphore(Sem_MA[1], 1, NULL);

	cout << "Thread T3 finished" << endl;

}
//---------------------------------------T4-------------------------------------------------
void T4(){
	int d4, s, m4;
	matrix MK4 = new vector[N];
	for (int i = 0; i < N; i++)
	{
		MK4[i] = new int[N];
	};

	cout << "Thread T4 started" << endl;
	//1. Введення MK, Z
	for (int i = 0; i < N; i++)
	{
		Z[i] = 1;
		MK[i] = new int[N];
	}

	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			MK[i][j] = 1;
		}
	}

	//2. Сигнал задачам T1, T2, T3 про введення MK, Z
	SetEvent(Evn4_123);
	//3. Чекати на введення d у задачі T1
	WaitForSingleObject(Evn1_234, INFINITE);
	//4. Чекати на введення MO, MR у задачі T3
	WaitForSingleObject(Evn3_124, INFINITE);
	//5. Копіювати MK4:= MK
	WaitForSingleObject(Mute, INFINITE);
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			MK4[i][j] = MK[i][j];
		}
	}
	ReleaseMutex(Mute);
	//6. Копіювання d
	EnterCriticalSection(&CrSec1);
	d4 = d;
	LeaveCriticalSection(&CrSec1);

	//7. Обчислення m4 := min(ZH)
	m4 = INFINITI;
	for (int i = 3 * H; i < N; i++)
	{
		m4 = min(m4, Z[i]);
	}
	//8. Обчислення m: = min(m,m4)
	EnterCriticalSection(&CrSec2);
	m = min(m, m4);
	LeaveCriticalSection(&CrSec2);
	//9. Сигнал Т1 про про завершення обчислень m
	ReleaseSemaphore(Sem_m[2], 1, NULL);
	//10. Чекати сигналу від T1 про завершення обчислень m
	WaitForSingleObject(Sem_min, INFINITE);
	//11. Копіювання m4: = m
	EnterCriticalSection(&CrSec3);
	m4 = m;
	LeaveCriticalSection(&CrSec3);

	ReleaseSemaphore(Sem_min, 1, NULL);
	//12. Обчислення MAH = d4*MOH*MK4 + m4*MRH
	for (int i = 3 * H; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			s = 0;
			for (int k = 0; k < N; k++)
			{
				s += MO[i][k] * MK4[k][j];
			}
			MA[i][j] = s*d4 + m4*MO[i][j];
		}
	}
	//13. Сигнал T1 про завершення обчислень MA
	ReleaseSemaphore(Sem_MA[2], 1, NULL);

	cout << "Thread T4 finished" << endl;
}

int _tmain(int argc, _TCHAR* argv[])
{
	cout << "Lab 2 started" << endl;

	Evn4_123 = CreateEvent(NULL, TRUE, FALSE, NULL);
	Evn3_124 = CreateEvent(NULL, TRUE, FALSE, NULL);
	Evn1_234 = CreateEvent(NULL, TRUE, FALSE, NULL);

	InitializeCriticalSection(&CrSec1);
	InitializeCriticalSection(&CrSec2);
	InitializeCriticalSection(&CrSec3);

	Mute = CreateMutex(NULL, FALSE, NULL);

	Sem_m[0] = CreateSemaphore(NULL, 0, 1, NULL);
	Sem_m[1] = CreateSemaphore(NULL, 0, 1, NULL);
	Sem_m[2] = CreateSemaphore(NULL, 0, 1, NULL);

	Sem_MA[0] = CreateSemaphore(NULL, 0, 1, NULL);
	Sem_MA[1] = CreateSemaphore(NULL, 0, 1, NULL);
	Sem_MA[2] = CreateSemaphore(NULL, 0, 1, NULL);

	Sem_min = CreateSemaphore(NULL, 1, 1, NULL);

	DWORD Tid1, Tid2, Tid3, Tid4;
	HANDLE threads[] =
	{
		CreateThread(NULL, NULL, (LPTHREAD_START_ROUTINE)T1, NULL, NULL, &Tid1),
		CreateThread(NULL, NULL, (LPTHREAD_START_ROUTINE)T2, NULL, NULL, &Tid2),
		CreateThread(NULL, NULL, (LPTHREAD_START_ROUTINE)T3, NULL, NULL, &Tid3),
		CreateThread(NULL, NULL, (LPTHREAD_START_ROUTINE)T4, NULL, NULL, &Tid4)
	};
	WaitForMultipleObjects(4, threads, true, INFINITE);
	CloseHandle(threads[0]);
	CloseHandle(threads[1]);
	CloseHandle(threads[2]);
	CloseHandle(threads[3]);

	cout << "Lab2 ended" << endl;
	char key;
	cin >> key;

	return 0; 
}

