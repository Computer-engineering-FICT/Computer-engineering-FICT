// PPKSLab2.cpp : Defines the entry point for the console application.
//
/*------------------------------------------------------------------
--                                                              --
--              Parallel and Distributed Computing              --
--                   Laboratory work #2. Win32                  --
--                                                              --
--                                                              --
--  Task: A=(B*C)*Z+α*E*(MX*MZ)                                 --
--                                                              --
--  Author: Krivonosov Olexiy, group IO-34                      --
--  Date: 5.03.2016                                             --
--                                                              --
------------------------------------------------------------------ */


#include "stdafx.h"
#include <iostream>
#include <windows.h>

using namespace std;

typedef int* vector;
typedef int** matrix;

const int N = 4;
const int P = 4;
const int H = N / P;

int alfa, b=0;
vector B = new int[N],
C = new int[N],
E = new int[N],
A = new int[N],
Z = new int[N];

matrix MX = new vector[N],
MZ = new vector[N];

HANDLE Evn1_234, Evn3_124, Evn4_123, EvnB1_234, 
EvnB2_134, EvnB3_124, EvnB4_123, Mute, Sem_A[3];
CRITICAL_SECTION CrSec;
//-----------------------------------------T1--------------------------------------------
void T1(){
	int alfa1, s, b1 = 0;
	vector 
		E1 = new int[N],
		
		BufV1 = new int[N];
		
	matrix BufM1 = new vector[N];
	matrix MX1 = new vector[N];
	for (int i = 0; i < N; i++)
	{
		BufM1[i] = new int[N];
	};
	for (int i = 0; i < N; i++)
	{
		MX1[i] = new int[N];
	};

	cout << "Process T1 started" << endl;
	//1. Введення MZ, B
	for (int i = 0; i < N; i++)
	{
		MZ[i] = new int[N];
	};

	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			MZ[i][j] = 1;
		}
	}
	for (int i = 0; i < N; i++){
		B[i] = 1;
	}
	//2. Сигнал задачам Т2, Т3, Т4 про введення MZ, B
	SetEvent(Evn1_234);
	//3. Чекати на введення C, Z у задачі Т3
	WaitForSingleObject(Evn3_124, INFINITE);
	//4. Чекати на введення alfa, E, MX задачі T4
	WaitForSingleObject(Evn4_123, INFINITE);

	//5.Обчислення: b1 = Bн*Cн    
	for (int i = 0; i < H; i++) {
		b1 = b1 + B[i] * C[i];
	}

	//6.Обчислення: b = b + b1
	EnterCriticalSection(&CrSec);
	
	b = b + b1;
	
	LeaveCriticalSection(&CrSec);
	//7. Сигнал задачам Т2, Т3, Т4 про обчислення b
	SetEvent(EvnB1_234);
	//8. Чекати на завершення обчислень b в Т2
	WaitForSingleObject(EvnB2_134, INFINITE);
	//9.Чекати на завершення обчислень b в Т3
	WaitForSingleObject(EvnB3_124, INFINITE);
	//10. Чекати на завершення обчислень b в Т4
	WaitForSingleObject(EvnB4_123, INFINITE);

	//11. Копіювання: E1 = E, α1 = α, b1 : = b
	EnterCriticalSection(&CrSec);
	
	for (int i = 0; i < N; i++){
		E1[i] = E[i];
	}
	alfa1 = alfa;
	b1 = b;
	LeaveCriticalSection(&CrSec);
	
	//12. Копіювання: МХ1 : = МХ
	WaitForSingleObject(Mute, INFINITE);
	
	for (int i = 0; i < N; i++){
		for (int j = 0; j < N; j++){
			MX1[i] = MX[i];
		}
	}
	ReleaseMutex(Mute);
	
	//13. Обчислення: AН = b1*ZH + α1*E1*(MX1*MZH)
	for (int i = 0; i <  H; i++)
	{
		for (int j = 0; j < N; j++)
		{
			s = 0;
			for (int k = 0; k < N; k++)
			{
				s += MZ[i][k] * MX1[k][j];
			}
			BufM1[i][j] = s;
		}
	}
	
	for (int i = 0; i < H; i++){
		s = 0;
		for (int j = 0; j < N; j++){
			s += BufM1[i][j] * E[j];
			
		}
		BufV1[i] = s*alfa1;
	}
	
	
	for (int i = 0; i < H; i++){
		Z[i] = Z[i] * b1;
	}
	for (int i = 0; i < H; i++){
		A[i] = Z[i] + BufV1[i];
	}
	//14.Чекати на завершення обчислень A в T2, T3, T4
	WaitForMultipleObjects(3, Sem_A, TRUE, INFINITE);
	//15. Виведення A
	if (N<10)
	{
		cout << "   " << endl;
		for (int i = 0; i < N; i++)
		{
			
			cout << A[i];
			cout << " ";
			
		}
		cout << "          " << endl;
	}
	cout << "Process T1 finished" << endl;

}
//-------------------------------------------T2-------------------------------------------
void T2(){
	int alfa2, s,b2=0;
	vector 
		E2 = new int[N],
		
		BufV2 = new int[N],
		Buf2 = new int[N],
		Buf3 = new int[N];;
	matrix BufM2 = new vector[N];
	matrix MX2 = new vector[N];
	for (int i = 0; i < N; i++)
	{
		BufM2[i] = new int[N];
	};
	for (int i = 0; i < N; i++)
	{
		MX2[i] = new int[N];
	};

	cout << "Process T2 started" << endl;
	//1. Чекати на введення B, MZ у задачі T1
	WaitForSingleObject(Evn1_234, INFINITE);
	//2. Чекати на введення C, Z у задачі T3
	WaitForSingleObject(Evn3_124, INFINITE);
	//3. Чекати на введення α, E, MX  у задачі T4
	WaitForSingleObject(Evn4_123, INFINITE);
	//4. Обчислення: b2 = Bн*Cн    
	for (int i = H; i < 2*H; i++) {
		b2 = b2 + B[i] * C[i];
		
	}
	//5. Обчислення: b = b + b2
	EnterCriticalSection(&CrSec);

	b = b + b2;
	
	LeaveCriticalSection(&CrSec);

	//6. Сигнал задачам Т1, Т3, Т4 про обчислення b
	SetEvent(EvnB2_134);
	//7.Чекати на завершення обчислень b в Т1
	WaitForSingleObject(EvnB1_234, INFINITE);
	//8.Чекати на завершення обчислень b в Т3
	WaitForSingleObject(EvnB3_124, INFINITE);
	//9. Чекати на завершення обчислень b в Т4
	WaitForSingleObject(EvnB4_123, INFINITE);

	//10. Копіювання: E2=E, α2= α, b2 = b
	EnterCriticalSection(&CrSec);

	for (int i = 0; i < N; i++){
		E2[i] = E[i];
	}
	alfa2 = alfa;
	b2 = b;
	
	LeaveCriticalSection(&CrSec);

	//11. Копіювання: МХ2  = МХ
	WaitForSingleObject(Mute, INFINITE);

	for (int i = 0; i < N; i++){
		for (int j = 0; j < N; j++){
			MX2[i] = MX[i];
		}
	}
	ReleaseMutex(Mute);

	//12. Обчислення: AН = b2*ZH + α2*E2*(MX2*MZH)
	for (int i = H; i < H*2; i++)
	{
		for (int j = 0; j < N; j++)
		{
			s = 0;
			for (int k = 0; k < N; k++)
			{
				s += MZ[i][k] * MX2[k][j];
			}
			BufM2[i][j] = s;
		}
	}

	for (int i = H; i < 2*H; i++){
		s = 0;
		for (int j = 0; j < N; j++){
			s += BufM2[i][j] * E[j];

		}
		BufV2[i] = s*alfa2;
	}


	for (int i = H; i < 2*H; i++){
		Z[i] = Z[i] * b2;
	}
	for (int i = H; i < 2*H; i++){
		A[i] = Z[i] + BufV2[i];
		
	}
	//13. Сигнал T1 про завершення обчислень MA
	ReleaseSemaphore(Sem_A[0], 1, NULL);


	cout << "Process T2 finished" << endl;

}
//----------------------------------------T3----------------------------------------------
void T3(){
	int alfa3, s,b3 = 0;
	vector 
		E3 = new int[N],
		
		BufV3 = new int[N];
		
	matrix BufM3 = new vector[N];
	matrix MX3 = new vector[N];
	for (int i = 0; i < N; i++)
	{
		BufM3[i] = new int[N];
	};
	for (int i = 0; i < N; i++)
	{
		MX3[i] = new int[N];
	};

	cout << "Process T3 started" << endl;
	//1. Введення C, Z
	for (int i = 0; i < N; i++)
	{
		C[i] = 1;
		Z[i] = 1;
	}

	//2. Сигнал задачам Т1, Т3, Т4 про введення C, Z
	SetEvent(Evn3_124);
	//3. Чекати на введення B, MZ у задачі T1
	WaitForSingleObject(Evn1_234, INFINITE);
	//4. Чекати на введення α, E, MX  задачі T4
	WaitForSingleObject(Evn4_123, INFINITE);
	
	//5. Обчислення: b3 = Bн*Cн    
	for (int i = H*2; i < H*3; i++) {
		b3 = b3 + B[i] * C[i];
	}
	//6. Обчислення: b = b + b3
	EnterCriticalSection(&CrSec);
	
	b = b + b3;
	
	LeaveCriticalSection(&CrSec);

	//7. Сигнал задачам Т1, Т2, Т4 про обчислення b
	SetEvent(EvnB3_124);
	//8.Чекати на завершення обчислень b в Т1
	WaitForSingleObject(EvnB1_234, INFINITE);
	//9.Чекати на завершення обчислень b в Т2
	WaitForSingleObject(EvnB2_134, INFINITE);
	//10. Чекати на завершення обчислень b в Т4
	WaitForSingleObject(EvnB4_123, INFINITE);

	//11. Копіювання: E3=E, α3= α, b3 = b
	EnterCriticalSection(&CrSec);

	for (int i = 0; i < N; i++){
		E3[i] = E[i];
	}
	alfa3 = alfa;
	b3 = b;
	LeaveCriticalSection(&CrSec);

	//12. Копіювання: МХ3 : = МХ
	WaitForSingleObject(Mute, INFINITE);

	for (int i = 0; i < N; i++){
		for (int j = 0; j < N; j++){
			MX3[i] = MX[i];
		}
	}
	ReleaseMutex(Mute);

	//13. Обчислення: AН = b3*Z3 + α3*E3*(MX3*MZH)
	for (int i = H*2; i < H*3; i++)
	{
		for (int j = 0; j < N; j++)
		{
			s = 0;
			for (int k = 0; k < N; k++)
			{
				s += MZ[i][k] * MX3[k][j];
			}
			BufM3[i][j] = s;
		}
	}

	for (int i = 2*H; i < H*3; i++){
		s = 0;
		for (int j = 0; j < N; j++){
			s += BufM3[i][j] * E[j];

		}
		BufV3[i] = s*alfa3;
	}


	for (int i = H*2; i < H*3; i++){
		Z[i] = Z[i] * b3;
	}
	for (int i = H*2; i < H*3; i++){
		A[i] = Z[i] + BufV3[i];
	}
	//14. Сигнал T1 про завершення обчислень MA
	ReleaseSemaphore(Sem_A[1], 1, NULL);

	cout << "Process T3 finished" << endl;

}
//---------------------------------------T4-------------------------------------------------
void T4(){
	int alfa4, s,b4=0;
	vector B4 = new int[N],
		E4 = new int[N],
		C4 = new int[N],
		BufV4 = new int[N];
	matrix BufM4 = new vector[N];
	matrix MX4 = new vector[N];
	for (int i = 0; i < N; i++)
	{
		BufM4[i] = new int[N];
	};
	for (int i = 0; i < N; i++)
	{
		MX4[i] = new int[N];
	};

	cout << "Process T4 started" << endl;
	
	//1. Введення α, E, MX
	for (int i = 0; i < N; i++)
	{
		MX[i] = new int[N];
	};

	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			MX[i][j] = 1;
		}
	}
	for (int i = 0; i < N; i++){
		E[i] = 1;
	}
	alfa = 1;
	//2. Сигнал задачам T1, T2, T3 про введення α, E, MX
	SetEvent(Evn4_123);
	//3. Чекати на введення B, MZ  у задачі T1
	WaitForSingleObject(Evn1_234, INFINITE);
	//4. Чекати на введення C, Z у задачі T3
	WaitForSingleObject(Evn3_124, INFINITE);
	
	//5. Обчислення: b4 = Bн*Cн    
	for (int i = H *3; i < N; i++) {
		b4 = b4 + B[i] * C[i];
	}
	//6. Обчислення: b = b + b4
	EnterCriticalSection(&CrSec);
	
	b = b + b4;
	
	LeaveCriticalSection(&CrSec);

	//7. Сигнал задачам Т1, Т2, Т3 про обчислення b
	SetEvent(EvnB4_123);
	//8.Чекати на завершення обчислень b в Т1
	WaitForSingleObject(EvnB1_234, INFINITE);
	//9.Чекати на завершення обчислень b в Т2
	WaitForSingleObject(EvnB2_134, INFINITE);
	//10. Чекати на завершення обчислень b в Т3
	WaitForSingleObject(EvnB3_124, INFINITE);

	//11. Копіювання: E4 = E, α4 = α, b4  = b
	EnterCriticalSection(&CrSec);

	for (int i = 0; i < N; i++){
		E4[i] = E[i];
	}
	alfa4 = alfa;
	b4 = b;
	LeaveCriticalSection(&CrSec);

	//12. Копіювання: МХ4 : = МХ
	WaitForSingleObject(Mute, INFINITE);

	for (int i = 0; i < N; i++){
		for (int j = 0; j < N; j++){
			MX4[i] = MX[i];
		}
	}
	ReleaseMutex(Mute);

	//13. Обчислення: AН = b4*ZH+ α4*E4*(MX4*MZH)
	for (int i = H*3; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			s = 0;
			for (int k = 0; k < N; k++)
			{
				s += MZ[i][k] * MX4[k][j];
			}
			BufM4[i][j] = s;
		}
	}

	for (int i = 3 * H; i < N; i++){
		s = 0;
		for (int j = 0; j < N; j++){
			s += BufM4[i][j] * E[j];

		}
		BufV4[i] = s*alfa4;
	}


	for (int i = 3*H; i < N; i++){
		Z[i] = Z[i] * b4;
	}
	for (int i = 3*H; i < N; i++){
		A[i] = Z[i] + BufV4[i];
	}
	//14. Сигнал T1 про завершення обчислень MA
	ReleaseSemaphore(Sem_A[2], 1, NULL);

	cout << "Process T4 finished" << endl;
}



int main(int argc, char* argv[])
{
	cout << "Lab 2 started" << endl;

	Evn4_123 = CreateEvent(NULL, TRUE, FALSE, NULL);
	Evn3_124 = CreateEvent(NULL, TRUE, FALSE, NULL);
	Evn1_234 = CreateEvent(NULL, TRUE, FALSE, NULL);

	EvnB1_234 = CreateEvent(NULL, TRUE, FALSE, NULL);
	EvnB2_134 = CreateEvent(NULL, TRUE, FALSE, NULL);
	EvnB3_124 =  CreateEvent(NULL, TRUE, FALSE, NULL);
	EvnB4_123 = CreateEvent(NULL, TRUE, FALSE, NULL);

	InitializeCriticalSection(&CrSec);

	Mute = CreateMutex(NULL, FALSE, NULL);

	Sem_A[0] = CreateSemaphore(NULL, 0, 1, NULL);

	Sem_A[1] = CreateSemaphore(NULL, 0, 1, NULL);

	Sem_A[2] = CreateSemaphore(NULL, 0, 1, NULL);
	

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


