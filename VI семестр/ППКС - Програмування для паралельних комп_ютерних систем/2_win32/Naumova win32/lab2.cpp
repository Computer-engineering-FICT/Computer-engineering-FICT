/*------------------------------------------------------------------
  --                                                              --
  --              Parallel and Distributed Computing              --
  --                   Laboratory work #2. Win32                  --
  --                                                              --
  --                                                              --
  --  Task: MA = alfa * MB + beta * (MO * MX) * min(T)            --
  --                                                              --
  --  Naumova Kristina, group IO-01                               --
  --  Date: 13.03.2013                                            --
  --                                                              --
  ------------------------------------------------------------------ */

#include "stdafx.h"
#include <iostream>
#include <windows.h>


using namespace std;

typedef int* vector;
typedef int** matrix;

const int N = 6;
const int P = 3;
const int H = N/P;

int alpha, beta;	
int a = INT_MAX;
vector	T = new int[N];
				
matrix	MO = new vector[N],				
		MX = new vector[N],
		MB = new vector[N],
		MA = new vector[N];



HANDLE	Evn1_23, Evn2_13, Evn3_12, Evn1_23_min, Evn2_13_min, Evn3_12_min,
		Mute,
		Sem[1], Sem1_23, Sem2_13, Sem3_12;

CRITICAL_SECTION CrSec;



void T1() {
	int alpha1, beta1;
	int a1;
	matrix MX1, MT;

	cout << "Process T1 started" << endl;

	//1. ���� T, alfa
	for (int i = 0; i < N; i++) {
		T[i] = 1;
	}
	alpha = 1;

	//2. ������ ������� T2, T3 ��� ���� B, alpha
	SetEvent (Evn1_23);

	//3. ����� ���� beta, MB � T2
	WaitForSingleObject (Evn2_13, INFINITE);

	//4. ����� ���� ��, �� � T3
	WaitForSingleObject (Evn3_12, INFINITE);

	//5.���� �1=���(�)
	a1 = T[0];
	for (int i = 0; i < H; i++) {
		if (a1 > T[i]) {
			a1 = T[i];
		}
	}
	
	SetEvent (Evn1_23_min);

	WaitForSingleObject (Evn2_13_min, INFINITE);

	WaitForSingleObject (Evn3_12_min, INFINITE);
	

	//6.���� �=���(�,�1)
	EnterCriticalSection (&CrSec);
	if (a1 < a) {
		a = a1;
	}
	LeaveCriticalSection (&CrSec);
	cout << "Task_" << a << "_One";

	//7.������ ������� � ���������� ������
	ReleaseSemaphore(Sem1_23, 2, NULL);

	//8.����� ���������� ������ � �2
	WaitForSingleObject(Sem2_13, INFINITE);

	//9.����� ���������� ������ � �3
	WaitForSingleObject(Sem3_12, INFINITE);

	//10. ����������� alfa1 = alfa, beta1 = beta, �1=�, ��1 = ��
	WaitForSingleObject (Mute, INFINITE);
		alpha1 = alpha;
		beta1 = beta;
		a1 = a;
		MX1 = new vector[N];
		for (int i = 0; i < N; i++)	{
			MX1[i] = new int[N];
		}
		for (int i = 0; i < N; i++)	{
			for (int j = 0; j < N; j++)	{
				MX1[i][j] = MX[i][j];
			}
		}
	ReleaseMutex (Mute);

	MT = new vector[N];
	for (int i = 0; i < N; i++) {
		MT[i] = new int[N];
	}


	//11. ���������� �AH = alfa1 * �BH + beta1 * (M�H * M�1) * a
	for (int i = 0; i < H; i++) {
		for (int j = 0; j < N; j++)	{
			MA[i][j] = 0;
			for (int j = 0; j < N; j++) {
				MT[i][j] = 0;
				for (int k = 0; k < N; k++)	{
					MT[i][j] += MO[i][k] * MX1[k][j];
				}
			}
			a *= beta1;
			for (int j = 0; j < N; j++) {
				MT[i][j] = MT[i][j] * beta1;
			}
			for (int j = 0; j < N; j++) {
				MA[i][j] += MA[i][j] * alpha1;
			}
			for (int j = 0; j < N; j++) {
				MA[i][j] += MT[i][j];
			}
		}
	}

	//12. ����� ���������� ����������� � T2, T3
	WaitForMultipleObjects (2, Sem, TRUE, INFINITE);

	//13. ����� ���������� �A
	for(int i = 0; i < N; i++) {
		for(int j = 0; j < N; j++) {
			cout << MA[i][j] << "\t";
		}
		cout << "\n";
	}
	cout << "Process T1 finished" << endl;
}

void T2() {
	int alpha2, beta2;
	int a2;
	matrix MX2, MT;

	cout << "Process T2 started" << endl;

	//1. ���� beta, M�
	beta = 1;
	for (int i = 0; i < N; i++) {
		MB[i] = new int[N];
	}
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			MB[i][j] = 1;
		}
	}

	//2. ������ ������� T1, T3 ��� ���� beta, M�
	SetEvent (Evn2_13);

	//3. ����� ���� �, alpha � T1
	WaitForSingleObject (Evn1_23, INFINITE);

	//4. ����� ���� ��, MX � T3
	WaitForSingleObject (Evn3_12, INFINITE);

	//5.���� �2=���(�)
	a2 = T[H];
	for (int i = H; i < 2 * H; i++) {
		if (a2 > T[i]) {
			a2 = T[i];
		}
	}

	SetEvent (Evn2_13_min);

	WaitForSingleObject (Evn1_23_min, INFINITE);

	WaitForSingleObject (Evn3_12_min, INFINITE);

	//6.���� �=���(�,�2)
	EnterCriticalSection (&CrSec);
	if (a2 < a) {
		a = a2;
	}
	LeaveCriticalSection (&CrSec);

	//cout << a << "_2";

	//7.������ ������� � ���������� ������
	ReleaseSemaphore(Sem2_13, 2, NULL);

	//8.����� ���������� ������ � �1
	WaitForSingleObject(Sem1_23, INFINITE);

	//9.����� ���������� ������ � �3
	WaitForSingleObject(Sem3_12, INFINITE);

	//10. ����������� alfa2 = alfa, beta2 = beta, �2=�, ��2 = ��
	WaitForSingleObject (Mute, INFINITE);
		alpha2 = alpha;
		beta2 = beta;
		a2 = a;
		MX2 = new vector[N];
		for (int i = 0; i < N; i++) {
			MX2[i] = new int[N];
		}
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				MX2[i][j] = MX[i][j];
			}
		}
	ReleaseMutex (Mute);

	MT = new vector[N];
	for (int i = 0; i < N; i++) {
		MT[i] = new int[N];
	}


	//11. ���������� �AH = alfa2 * �BH + beta2 * (M�H * M�2) * a
	for (int i = H; i < 2 * H; i++) {
		for (int j = 0; j < N; j++){
			MA[i][j] = 0;
			for (int j = 0; j < N; j++){
				MT[i][j] = 0;
				for (int k = 0; k < N; k++) {
					MT[i][j] += MO[i][k] * MX2[k][j];
				}
			}
		a *= beta;
		for (int j = 0; j < N; j++) {
			MT[i][j] = MT[i][j] * beta2;
		}
		for (int j = 0; j < N; j++) {
			MA[i][j] += MA[i][j] * alpha2;
		}
		for (int j = 0; j < N; j++) {
			MA[i][j] += MT[i][j];
		}
		}
	}

	//12. ������ T1 ������������� �����
	ReleaseSemaphore (Sem[0], 1, NULL);

	cout << "Process T2 finished" << endl;
}

void T3() {

	int alpha3, beta3;
	int a3;
	matrix mx3, MT;

	cout << "Process T3 started" << endl;

	//1. ���� ��, MX
	for (int i = 0; i < N; i++)
	{
		MO[i] = new int[N];
	}
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			MO[i][j] = 1;
		}
	}

	for (int i = 0; i < N; i++) {
		MX[i] = new int[N];
	}
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			MX[i][j] = 1;
		}
	}

	//2. ������ ������� T1, T2 ��� ���� beta, M�
	SetEvent (Evn3_12);

	//3. ����� ���� �, alpha � T1
	WaitForSingleObject (Evn1_23, INFINITE);

	//4. ����� ���� beta, MB � T2
	WaitForSingleObject (Evn2_13, INFINITE);

	//5.���� �3=���(�)
	a3 = T[2 * H];
	for (int i = 2 * H; i < N; i++) {
		if (a3 > T[i]) {
			a3 = T[i];
		}
	}

	SetEvent (Evn3_12_min);

	WaitForSingleObject (Evn1_23_min, INFINITE);

	WaitForSingleObject (Evn2_13_min, INFINITE);

	//6.���� �=���(�,�3)
	EnterCriticalSection (&CrSec);
	if (a3 < a)
	{
		a = a3;
	}
	LeaveCriticalSection (&CrSec);
	//cout << a << "_3";


	//7.������ ������� � ���������� ������
	ReleaseSemaphore(Sem3_12, 2, NULL);

	//8.����� ���������� ������ � �1
	WaitForSingleObject(Sem1_23, INFINITE);

	//9.����� ���������� ������ � �2
	WaitForSingleObject(Sem2_13, INFINITE);
	
	//10. ����������� alfa3 = alfa, beta3 = beta, �3=�, ��3 = ��
	WaitForSingleObject (Mute, INFINITE);
		alpha3 = alpha;
		beta3 = beta;
		a3 = a;
		mx3 = new vector[N];
		for (int i = 0; i < N; i++) {
			mx3[i] = new int[N];
		}
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				mx3[i][j] = MX[i][j];
			}
		}
	ReleaseMutex (Mute);

	MT = new vector[N];
	for (int i = 0; i < N; i++) {
		MT[i] = new int[N];
	}


	//11. ���������� �AH = alfa2 * �BH + beta2 * (M�H * M�2) * a
	for (int i = 2 * H; i < N; i++) {
		for (int j = 0; j < N; j++) {
			MA[i][j] = 0;
			for (int j = 0; j < N; j++) {
				MT[i][j] = 0;
				for (int k = 0; k < N; k++) {
					MT[i][j] += MO[i][k] * mx3[k][j];
				}
			}
			a *= beta3;
			for (int j = 0; j < N; j++) {
				MT[i][j] = MT[i][j] * beta3;
			}
			for (int j = 0; j < N; j++) {
				MA[i][j] += MA[i][j] * alpha3;
			}
			for (int j = 0; j < N; j++) {
				MA[i][j] += MT[i][j];
			}
		}
	}

	//12. ������ T1 ��� ���������� �����
	ReleaseSemaphore (Sem[1], 1, NULL);

	cout << "Process T3 finished" << endl;
}

int main(int argc, char* argv[]) {
	cout << "Lab2 started" << endl;	

	for (int i = 0; i < N; i++) {
		MA[i] = new int[N];
	}

	Evn1_23 = CreateEvent (NULL, TRUE, FALSE, NULL); //������ ����� �������
	Evn2_13 = CreateEvent (NULL, TRUE, FALSE, NULL);
	Evn3_12 = CreateEvent (NULL, TRUE, FALSE, NULL);
	Evn1_23_min = CreateEvent (NULL, TRUE, FALSE, NULL); //������ ����� �������
	Evn2_13_min = CreateEvent (NULL, TRUE, FALSE, NULL);
	Evn3_12_min = CreateEvent (NULL, TRUE, FALSE, NULL);


	InitializeCriticalSection (&CrSec);

	Mute = CreateMutex (NULL, FALSE, NULL);

	Sem[0] = CreateSemaphore (NULL, 0, 1, NULL);
	Sem[1] = CreateSemaphore (NULL, 0, 1, NULL);
	Sem1_23 = CreateSemaphore (NULL, 0, 2, NULL);
	Sem2_13 = CreateSemaphore (NULL, 0, 2, NULL);
	Sem3_12 = CreateSemaphore (NULL, 0, 2, NULL);
	
	DWORD Tid1, Tid2, Tid3;
	HANDLE threads[] = {
		CreateThread (NULL, NULL, (LPTHREAD_START_ROUTINE) T1, NULL, NULL, &Tid1),
		CreateThread (NULL, NULL, (LPTHREAD_START_ROUTINE) T2, NULL, NULL, &Tid2),
		CreateThread (NULL, NULL, (LPTHREAD_START_ROUTINE) T3, NULL, NULL, &Tid3)
	};

	WaitForMultipleObjects (3, threads,	true, INFINITE);

	CloseHandle(threads[0]);
	CloseHandle(threads[1]);
	CloseHandle(threads[2]);

	cout << "Lab2 ended" << endl;

	char key;
	cin >> key;
	return 0;
}