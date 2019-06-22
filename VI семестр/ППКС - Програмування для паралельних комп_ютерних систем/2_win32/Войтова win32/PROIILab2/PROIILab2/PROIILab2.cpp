#include "stdafx.h"
#include "windows.h"
#include <iostream>
#include <fstream>
#include <algorithm>
#include <string>

using namespace std;

int N = 8;
const int P = 4;
const int H = N/P;

//========================================================

int *A = new int[N];
int *B = new int[N];
int *C = new int[N];
int ** ME = new int*[N];
int ** MO = new int*[N];
int ** MR = new int*[N];
int ** MZ = new int*[N];


//Semaphores
HANDLE Sem_in_MR, Sem_t1_end_CH, Sem_in_MZ, Sem_t2_end_CH, Sem_in_ME, Sem_t3_end_CH, Sem_in_B, Sem_in_MO, Sem_t4_end_CH;

//Critical sections
CRITICAL_SECTION CS_ME, CS_B;

//Mutex
HANDLE Mut_C;

//Events
HANDLE Ev1, Ev2, Ev3;

string convertInt(int number)
{
    if (number == 0)
        return "0";
    string temp="";
    string returnvalue="";
    while (number>0)
    {
        temp+=number%10+48;
        number/=10;
    }
    for (int i=0;i < temp.length();i++)
        returnvalue+=temp[temp.length()-i-1];
    return returnvalue;
}

static void inputVector(int* vec, int temp) {
            for (int j = 0; j < N; j++) {
                vec[j] = temp;
            }
        }

static void inputMatrix(int** matr, int temp) {
            for (int i = 0; i <N; i++) {
                for (int j = 0; j <N; j++) {
                    matr[i][j] = temp;
                }
            }
        }


//========================================================
void T1() 
{
	int* B1 = NULL;
	int* C1 = NULL;
	int ** ME1 = NULL;
	int ** MC = NULL;
	MC = new int*[N];
	ME1 = new int*[N];
	B1 = new int[N];
	C1 = new int[N];
	for(int i=0; i<N; i++)
	{
		MC[i] = new int[N];
		ME1[i] = new int[N];
		MR[i] = new int[N];
	}

	int task = 1; //Task number
	cout << "T1: started" << endl;
	//1.	Ввод МR
	inputMatrix(MR,1);
	//2.	Сигнал T2,T3,T4 о вводе MR
	ReleaseSemaphore(Sem_in_MR, 3, NULL); // S2-1 , S3-1, S4-1
	//3.	Ждать ввод MZ  в T2 и B в T3
	WaitForSingleObject(Sem_in_MZ, INFINITE); //W2-1
	WaitForSingleObject(Sem_in_B, INFINITE);// W3-1
	//4.	Копирование B1 := B
	EnterCriticalSection(&CS_B);
	for(int i = 0; i < N; i++){
		B1[i] = B[i];
	}		
	LeaveCriticalSection(&CS_B);
	//5.	Счет CH = B1 * MZH
	int sum;
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + B1[j] * MZ[j][i];
		}
		C[i] = sum;
	}
	//6.	Сигнал задачам T2,T3,T4 о завершении счета CH
	ReleaseSemaphore(Sem_t1_end_CH, 3, NULL); // S2-2, S3-2, S4-2
	//7.	Ждать ввод MO в T4 и ME в T3
	WaitForSingleObject(Sem_in_MO, INFINITE); // W4-1 
	WaitForSingleObject(Sem_in_ME, INFINITE); // W3-2
	//8.	Копирование ME1 := ME
	EnterCriticalSection(&CS_ME);
	for(int i = 0; i < N; i++)
		for(int j = 0; j < N; j++)
			ME1[i][j] = ME[i][j];
	LeaveCriticalSection(&CS_ME);
	//9.	Счет MCH = MOH + ME1*MRH
	for (int z = (task - 1) * H; z < task * H; z++){ 		
		for (int i = 0; i < N; i++) {			
			sum = 0;
			for (int j = 0; j < N; j++) {
				sum = sum +  MR[z][j] * ME1[j][i];
			}
			MC[z][i] = sum + MO[z][i];
		}
	}
	//10.	Ждать завершения счета CH в T2,T3,T4	
	WaitForSingleObject(Sem_t4_end_CH, NULL);  //W4-2
	WaitForSingleObject(Sem_t3_end_CH, NULL);  //W3-3
	WaitForSingleObject(Sem_t2_end_CH, NULL);  //W2-2
	//11.	Копирование C1 := C
	WaitForSingleObject(Mut_C, INFINITE);
	for (int i = 0; i < N; i++) 
	{	
		C1[i] = C[i];
	}
	ReleaseMutex(Mut_C);
	//12.	Счет AH = C1 * MCH
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + C1[j] * MC[i][j];
		}
		A[i] = sum;
	}
	//13.	Сигнал T2 о завершении счета AH	
	SetEvent(Ev1); // S2-3
	cout << "T1 finished" << endl;
}

//========================================================
void T2() 
{
	
	int* B2 = NULL;
	int* C2 = NULL;
	int ** ME2 = NULL;
	int ** MC = NULL;
	MC = new int*[N];
	ME2 = new int*[N];
	B2 = new int[N];
	C2 = new int[N];
	for(int i=0; i<N; i++)
	{
		MC[i] = new int[N];
		ME2[i] = new int[N];
		MZ[i] = new int[N];
	}
	int task = 2; //Task number
	cout << "T2: started" << endl;
	//1.	Ввод MZ		
	inputMatrix(MZ, 1);
	//2.	Сигнал T1,T3,T4 о вводе MZ				
	ReleaseSemaphore(Sem_in_MZ, 3, NULL);//S1-1 S3-1 S4-1 
	//3.	Ждать ввод B в T3				
	WaitForSingleObject(Sem_in_B, INFINITE);//W3-1
	//4.	Копирование B2 := B	
	EnterCriticalSection(&CS_B);
	for(int i = 0; i < N; i++){
		B2[i] = B[i];
	}		
	LeaveCriticalSection(&CS_B);
	//5.	Счет CH = B2 * MZH
	int sum;
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + B2[j] * MZ[j][i];
		}
		C[i] = sum;
	}
	//6.	Сигнал задачам T1,T3,T4 о завершении счета CH
		ReleaseSemaphore(Sem_t2_end_CH, 3, NULL);//S1-2 S3-2 S4-2 
	//7.	Ждать ввод MO в T4 , MR в T1, ME в T3.	
	WaitForSingleObject(Sem_in_MO, INFINITE);	//W4-1
	WaitForSingleObject(Sem_in_MR, INFINITE);	//	W1-1
	WaitForSingleObject(Sem_in_ME, INFINITE);	//	W3-2
	//8.	Копирование ME2 := ME
	EnterCriticalSection(&CS_ME);
	for(int i = 0; i < N; i++)
		for(int j = 0; j < N; j++)
			ME2[i][j] = ME[i][j];
	LeaveCriticalSection(&CS_ME);
	//9.	Счет MCH = MOH + ME2*MRH
	for (int z = (task - 1) * H; z < task * H; z++){ 		
		for (int i = 0; i < N; i++) {			
			sum = 0;
			for (int j = 0; j < N; j++) {
				sum = sum +  MR[z][j] * ME2[j][i];
			}
			MC[z][i] = sum + MO[z][i];
		}
	}
	//10.	Ждать завершения счета CH в T1,T3,T4	
	WaitForSingleObject(Sem_t1_end_CH, NULL);	//W1-2 
	WaitForSingleObject(Sem_t3_end_CH, NULL);	//W3-3 
	WaitForSingleObject(Sem_t4_end_CH, NULL);	//W4-2 
	//11.	Копирование C2 := C	
	WaitForSingleObject(Mut_C, INFINITE);
	for (int i = 0; i < N; i++) {
		C2[i] = C[i];
	}
	ReleaseMutex(Mut_C);
	//12.	Счет AH = C2 * MCH	
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + C2[j] * MC[i][j];
		}
		A[i] = sum;
	}
	//13.	Ждать завершения счета AH в T1,T3,T4		
	WaitForSingleObject(Ev1, NULL);//W1-3
	WaitForSingleObject(Ev2, NULL);//W3-4 
	WaitForSingleObject(Ev3, NULL);//W4-3 
	//14.	Вывод A
	cout << "\t result" << endl;
	cout << "\t is" << endl;
	cout << "                  " << endl;
	cout << "                  " << endl;

	for(int i = 0; i < N ; i ++){
		cout<<A[i] << "\t";
	}


	cout << "T2 finished" << endl;
}

//========================================================
void T3() 
{
	int* B3 = NULL;
	int* C3 = NULL;
	int ** ME3 = NULL;
	int ** MC = NULL;
	MC = new int*[N];
	ME3 = new int*[N];
	B3 = new int[N];
	C3 = new int[N];
	for(int i=0; i<N; i++)
	{
		MC[i] = new int[N];
		ME3[i] = new int[N];
		ME[i] = new int[N];
	}
	int task = 3; //Task number
	cout << "T3: started" << endl;
	//1.	Ввод B и МE
	inputMatrix(ME, 1);
	inputVector(B,1);
	//2.	Сигнал T2,T3,T4 о вводе ME
	ReleaseSemaphore(Sem_in_ME, 3, NULL); // S1-1 , S2-1, S4-1
	//3.	Сигнал T1,T2,T4 о вводе B				
	ReleaseSemaphore(Sem_in_B, 3, NULL); // S1-2 S2-2 S4-2 
	//4.	Копирование B3 := B						
	EnterCriticalSection(&CS_B);
	for(int i = 0; i < N; i++){
		B3[i] = B[i];
	}		
	LeaveCriticalSection(&CS_B);
	//5.	Ждать ввод MZ  в T2	
	WaitForSingleObject(Sem_in_MZ, INFINITE);	//W2-1
	//6.	Счет CH = B3 * MZH
	int sum;
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + B3[j] * MZ[j][i];
		}
		C[i] = sum;
	}
	//7.	Сигнал задачам T1,T2,T4 о завершении счета CH
	ReleaseSemaphore(Sem_t3_end_CH, 3, NULL);	//S1-3 S2-3 S4-3 
	//8.	Ждать ввод MO в T4 и MR в T1	
	WaitForSingleObject(Sem_in_MO, INFINITE);	//W4-1
	WaitForSingleObject(Sem_in_MR, INFINITE);	//W1-1
	//9.	Копирование ME3 := ME
	EnterCriticalSection(&CS_ME);
	for(int i = 0; i < N; i++)
		for(int j = 0; j < N; j++)
		ME3[i][j] = ME[i][j];

	LeaveCriticalSection(&CS_ME);
	//10.	Счет MCH = MOH + ME3*MRH
	for (int z = (task - 1) * H; z < task * H; z++){ 		
		for (int i = 0; i < N; i++) {			
			sum = 0;
			for (int j = 0; j < N; j++) {
				sum = sum +  MR[z][j] * ME3[j][i];
			}
			MC[z][i] = sum + MO[z][i];
		}
	}
	//11.	Ждать завершения счета CH в T1,T2,T4	
	WaitForSingleObject(Sem_t1_end_CH, NULL);  //W1-2
	WaitForSingleObject(Sem_t4_end_CH, NULL);  //W4-2
	WaitForSingleObject(Sem_t2_end_CH, NULL);  //W2-2	
	//12.	Копирование C3 := C			
	WaitForSingleObject(Mut_C, INFINITE);
	for(int i = 0; i < N; i++){
		C3[i] = C[i];
	}
	ReleaseMutex(Mut_C);
	//13.	Счет AH = C3 * MCH	
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + C3[j] * MC[i][j];
		}
		A[i] = sum;
	}
	//14.	Сигнал T2 о завершении счета AH	
	SetEvent(Ev2);//S2-4
	cout << "T3 finished" << endl;

	
}

//========================================================
void T4() 
{
	int* B4 = NULL;
	int* C4 = NULL;
	int ** ME4 = NULL;
	int ** MC = NULL;
	MC = new int*[N];
	ME4 = new int*[N];
	B4 = new int[N];
	C4 = new int[N];
	for(int i=0; i<N; i++)
	{
		MC[i] = new int[N];
		ME4[i] = new int[N];
		MO[i] = new int[N];
	}
	int task = 4; //Task number
	cout << "T4: started" << endl;
	//1.	Ввод МO
	inputMatrix(MO, 1);
	//2.	Сигнал T1,T2,T3 о вводе MO					
	ReleaseSemaphore(Sem_in_MO, 3, NULL);	//S1-1 S2-1 S3-1
	//3.	Ждать ввод MZ  в T2 и B в T3
	WaitForSingleObject(Sem_in_MZ, NULL);//W2-1
	WaitForSingleObject(Sem_in_B, NULL);// W3-1
	//4.	Копирование B4 := B		
	EnterCriticalSection(&CS_B);
	for(int i = 0; i < N; i++){
		B4[i] = B[i];
	}		
	LeaveCriticalSection(&CS_B);
	//5.	Счет CH = B4 * MZH			
	int sum;
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + B4[j] * MZ[j][i];
		}
		C[i] = sum;
	}
	//6.	Сигнал задачам T1,T2,T3 о завершении счета CH	
	ReleaseSemaphore(Sem_t4_end_CH, 3, NULL);//S1-2 S2-2 S3-2
	//7.	Ждать ввод MR в T1 и ME в T3
	WaitForSingleObject(Sem_in_MR, INFINITE);	//W1-1
	WaitForSingleObject(Sem_in_ME, INFINITE);	//W3-2
	//8.	Копирование ME4 := ME		
	EnterCriticalSection(&CS_ME);
	for(int i = 0; i < N; i++)
		for(int j = 0; j < N; j++)
		ME4[i][j] = ME[i][j];
	LeaveCriticalSection(&CS_ME);
	//9.	Счет MCH = MOH + ME4*MRH
	for (int z = (task - 1) * H; z < task * H; z++){ 		
		for (int i = 0; i < N; i++) {			
			sum = 0;
			for (int j = 0; j < N; j++) {
				sum = sum +  MR[z][j] * ME4[j][i];
			}
			MC[z][i] = sum + MO[z][i];
		}
	}
	//10.	Ждать завершения счета CH в T1,T2,T3
	WaitForSingleObject(Sem_t1_end_CH, NULL);//W1-2 
	WaitForSingleObject(Sem_t3_end_CH, NULL);  //W3-3
	WaitForSingleObject(Sem_t2_end_CH, NULL);  //W2-2 
	//11.	Копирование C4 := C		
	WaitForSingleObject(Mut_C, INFINITE);
	for(int i = 0; i < N; i++){
		C4[i] = C[i];
	}
	ReleaseMutex(Mut_C);
	//12.	Счет AH = C4 * MCH
	for (int i = (task - 1) * H; i < task * H; i++) {
		sum = 0;
		for (int j = 0; j < N; j++) {
			sum = sum + C4[j] * MC[i][j];
		}
		A[i] = sum;
	}
	//13.	Сигнал T2 о завершении счета AH			
	SetEvent(Ev3);//S2-3
	cout << "T4 finished" << endl;
}

//========================================================
int main()
{
	char a;
	DWORD Tid1, Tid2, Tid3, Tid4;
	HANDLE Thread1,  Thread2, Thread3, Thread4;
	cout << "input N:" << endl;
	cout << "Program started with H = " << H << endl;

	Ev1 = CreateEvent(NULL, 0, 1, NULL);
	Ev2 = CreateEvent(NULL, 0, 1, NULL);
	Ev3 = CreateEvent(NULL, 0, 1, NULL);

	Sem_in_MR =		CreateSemaphore(NULL, 0, 3, NULL);
	Sem_t1_end_CH = CreateSemaphore(NULL, 0, 1, NULL);
	Sem_in_MZ =		CreateSemaphore(NULL, 0, 3, NULL);
	Sem_t2_end_CH = CreateSemaphore(NULL, 0, 1, NULL);
	Sem_in_ME =		CreateSemaphore(NULL, 0, 3, NULL);
	Sem_t3_end_CH = CreateSemaphore(NULL, 0, 1, NULL);
	Sem_in_B =		CreateSemaphore(NULL, 0, 3, NULL);
	Sem_in_MO =		CreateSemaphore(NULL, 0, 3, NULL);
	Sem_t4_end_CH = CreateSemaphore(NULL, 0, 1, NULL);

	Mut_C = CreateMutex(NULL, FALSE, NULL);

	InitializeCriticalSection(&CS_ME);
	InitializeCriticalSection(&CS_B);

	size_t st = 50 * 1024 * 1024;

	Thread1 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) T1, NULL, 0, &Tid1);
	Thread2 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) T2, NULL, 0, &Tid2);
	Thread3 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) T3, NULL, 0, &Tid3);
	Thread4 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) T4, NULL, 0, &Tid4);
	
	CloseHandle(Thread1);
	CloseHandle(Thread2);
	CloseHandle(Thread3);
	
	cin.get();
	cin.get();
	cin.get();
	return 0;
}