
//--------------------------------------------------------------
//              Parallel and distributed computing             --
//                     Lab#2 - C++. Win32. Mutex, critical sections, semaphors
//                   IO-73 Novotarsky Kirill                   --
//--------------------------------------------------------------
//
//a = MAX (MB + MO*MZ)
//
//
//---------------------------------------------------------------
//---------------------------------------------------------------

#include "stdafx.h"
#include "windows.h"
#include <iostream>
#include <fstream>
#include <algorithm>


using namespace std;
const int N = 8;
int P = 4;
int H = N/P;
class Vector {
	public:
		int* vect;
		void InputVector();
		void OutputVector();
		void OutputVector(ofstream *out);
		void sortVectorUp();
		void sortVectorDown();
		int FindMax();
		int FindMin();
		Vector::Vector();
		Vector::~Vector();
};

Vector::Vector() {
	vect = new int [N];
}

Vector::~Vector() {
	delete[] vect;
}

void Vector::InputVector() {
	int i;
	for (i = 0; i < N; i++) 
		vect[i] = 1; //*in >> vect[i];
}

void Vector::OutputVector(ofstream *out){
	int i;
	for (i = 0; i < N; i++) 
		*out << vect[i] << "  ";
	*out << "\n";
}

void Vector::OutputVector() {
	int i;
	for (i = 0; i < N; i++) 
		cout << vect[i] << "  ";
	cout << "\n";
}

void Vector::sortVectorUp()
            {
                int buffer = 0;
                for (int i = 0; i < N-1; i++)
                {
                    for (int j = 0; j < N  - 1; j++)
                    {
                        if (vect[j + 1] < vect[j])
                        {
                            buffer = vect[j + 1];
                            vect[j + 1] = vect[j];
                            vect[j] = buffer;
                        }
                    }
                }
            }
void Vector::sortVectorDown()
            {
                int buffer = 0;
                for (int i = 0; i < sizeof(vect); i++)
                {
                    for (int j = 0; j < sizeof(vect)  - 1; j++)
                    {
                        if (vect[j + 1] > vect[j])
                        {
                            buffer = vect[j + 1];
                            vect[j + 1] = vect[j];
                            vect[j] = buffer;
                        }
                    }
                }
            }



int Vector::FindMax() {
	int max = vect[0];
	int i;
	for (i = 0; i < N-1; i++) 
		if (max < vect[i]) max = vect[i];
	return max;
}
int Vector::FindMin() {
	int min = vect[0];
	int i;
	for (i = 0; i < N-1; i++) 
		if (min >= vect[i]) min = vect[i];
	return min;
}

//========================================================
int MultVector(Vector *a, Vector *b) {
	int res = 0;
	int i;
	for (i = 0; i < N; i++)
		res = res + a->vect[i] * b->vect[i];
	return res;
}
  void addVectors(Vector *A, Vector *B, Vector *rez)
        {
            
            for (int i = 0; i < N-1; i++)
            {
                rez->vect[i] = A->vect[i] + B->vect[i];
            }
        }

        //subing vectors method
  void subVectors(Vector *A, Vector *B, Vector *rez)
        {
            for (int i = 0; i < N-1; i++)
            {
                rez->vect[i] = A->vect[i] - B->vect[i];
            }
			
        }

//========================================================
class Matrix {
	public:
		Vector* mas;
		void InputMatrix();
		void OutputMatrix(ofstream *out);
		void OutputMatrix();
		void SortMatrix();
		void Transpone();
		int FindMax();
		Matrix::Matrix();
		Matrix::~Matrix();
};

Matrix::Matrix() {
	mas = new Vector[N];
}

Matrix::~Matrix() {
	delete[] mas;
}

void Matrix::InputMatrix() {
	int i;
	for (i = 0; i < N; i++) 
		mas[i].InputVector();
}

void Matrix::OutputMatrix(ofstream *out) {
	int i;
	for (i = 0; i < N; i++) 
		mas[i].OutputVector(out);
}

void Matrix::OutputMatrix() {
	int i;
	for (i = 0; i < N; i++) 
		mas[i].OutputVector();
}

void Matrix::SortMatrix() {
	int i;
	for (i = 0; i < N-1; i++) 
		mas[i].sortVectorDown();
}

void Matrix::Transpone()  {
            int help = 0;
			for (int i = 0; i < N-1; i++)
            {
                for (int j = 0; j < N-1; j++)
                {
                    help =  mas[j].vect[i];
                    mas[j].vect[i] = mas[i].vect[j];
                    mas[i].vect[j] = help;
                }
            }
        }

int Matrix::FindMax() {
	int max = mas[0].FindMax();
	int i;
	for (i = 1; i < N-1; i++) 
		if (max < mas[i].FindMax()) max = mas[i].FindMax();
	return max;
}

//========================================================
void MultMatrix(Matrix *a, Matrix *b, Matrix *rez) {
	int i, j, z, help;
	//Matrix rez;
	for (i = 0; i < N; i++) {
		for (j = 0; j < N; j++) {
			help = 0;
			for (z = 0; z < N; z++) 
				 help = help + a->mas[i].vect[z] * b->mas[z].vect[j];
			rez->mas[i].vect[j] = help;
		}
	}
	//return rez;
}

void SumMatrix(Matrix *a, Matrix *b, Matrix *rez) {
	int i, j;
	//Matrix rez;
	for (i = 0; i < N-1; i++) {
		for (j = 0; j < N-1; j++) {
			rez->mas[i].vect[j] = a->mas[i].vect[j] + b->mas[i].vect[j];
		}
	}
	//return rez;
}

void vectorMatrixMultiply(Matrix *MA, Vector *A, Vector *res)
        {;
			for (int j = 0; j < N; j++)
            {
                for (int z = 0; z < N-1; z++)
                {
                    res->vect[j] = res->vect[j]
                      + A->vect[z] * MA->mas[z].vect[j];
                }
            }
		
        }
//========================================================



 static Matrix MB;
 static Matrix MO;
 static Matrix MZ;
 int a; 
 

 CRITICAL_SECTION CS;
 HANDLE Mute;
 HANDLE S1, S2, S3, S4, S5;
//========================================================


 void T1() {	
	cout << "T1 has started \n";
	MB.InputMatrix();
	Matrix MO1;
	int a1;
	ReleaseSemaphore(S1, 3, NULL);
	HANDLE hEvents[2];
	hEvents[0] = S2;
	hEvents[1] = S4;
	WaitForMultipleObjects(2,hEvents, true, INFINITE);
    
	EnterCriticalSection(&CS);
	 MO1 = MO;
	LeaveCriticalSection(&CS);

	WaitForSingleObject(Mute, INFINITE);
	 a1 = a;
	ReleaseMutex(Mute);

	int helper = 0;
	for (int i =0; i<H; i++){
		 for (int l = 0; l < N; l++) {
		  for (int k = 0;  k < N; k++){
			  helper = helper + MO1.mas[l].vect[k]*MZ.mas[k].vect[i];
		  }
		    helper = helper + MB.mas[l].vect[i];
			if (a1 < helper) a1 = helper;
			helper = 0;
		 }
	}
		WaitForSingleObject(Mute, INFINITE);
	 if (a < a1) a = a1;
	ReleaseMutex(Mute);

	HANDLE hEvents1[3];
	hEvents1[0] = S4;
	hEvents1[1] = S2;
	hEvents1[2] = S3;
	WaitForMultipleObjects(3,hEvents1, true, INFINITE);

	cout<< "\n";
	cout<< "MAX IS: ";
	 cout << a;

	cout << "\n T1 has finished \n";
	ExitThread(0);
}

 void T2() {
	cout << "T2 has started \n";
    MO.InputMatrix();
	Matrix MO2;
	int a2;
	ReleaseSemaphore(S2, 3, NULL);
	HANDLE hEvents[2];
	hEvents[0] = S1;
	hEvents[1] = S4;
	WaitForMultipleObjects(2,hEvents, true, INFINITE);
    
	EnterCriticalSection(&CS);
	 MO2 = MO;
	LeaveCriticalSection(&CS);

	WaitForSingleObject(Mute, INFINITE);
	 a2 = a;
	ReleaseMutex(Mute);


	int helper = 0;
	for (int i =0; i<H; i++){
		 for (int l = 0; l < N; l++) {
		  for (int k = 0;  k < N; k++){
			  helper = helper + MO2.mas[l].vect[k]*MZ.mas[k].vect[i];
		  }
		    helper = helper + MB.mas[l].vect[i];
			if (a2 < helper) a2 = helper;
			helper = 0;
		 }
	}
	WaitForSingleObject(Mute, INFINITE);
	 if (a < a2) a = a2;
	ReleaseMutex(Mute);
	
	ReleaseSemaphore(S2,1, NULL);
	cout << "T2 has finished \n";
ExitThread(0);
}

void T3() {
	cout << "T3 has started \n";
	Matrix MO3;
	int a3;
	HANDLE hEvents[3];
	hEvents[0] = S1;
	hEvents[1] = S4;
	hEvents[2] = S2;
	WaitForMultipleObjects(3,hEvents, true, INFINITE);
    
    EnterCriticalSection(&CS);
	 MO3 = MO;
	LeaveCriticalSection(&CS);

	WaitForSingleObject(Mute, INFINITE);
	 a3 = a;
	ReleaseMutex(Mute);

	int helper = 0;
	for (int i =0; i<H; i++){
		 for (int l = 0; l < N; l++) {
		  for (int k = 0;  k < N; k++){
			  helper = helper + MO3.mas[l].vect[k]*MZ.mas[k].vect[i];
		  }
		    helper = helper + MB.mas[l].vect[i];
			if (a3 < helper) a3 = helper;
			helper = 0;
		 }
	}

	WaitForSingleObject(Mute, INFINITE);
	 if (a < a3) a = a3;
	ReleaseMutex(Mute);
	
	ReleaseSemaphore(S3,1, NULL);
	cout << "T3 has finished \n";
ExitThread(0);
}

void T4() {
	cout << "T4 has started \n";
	MZ.InputMatrix();
	Matrix MO4;
	int a4;
	ReleaseSemaphore(S4, 3, NULL);
    HANDLE hEvents[2];
	hEvents[0] = S1;
	hEvents[1] = S2;
	WaitForMultipleObjects(2,hEvents, true, INFINITE);

	EnterCriticalSection(&CS);
	 MO4 = MO;
	LeaveCriticalSection(&CS);
	
	WaitForSingleObject(Mute, INFINITE);
	 a4 = a;
	ReleaseMutex(Mute);

	int helper = 0;
	for (int i =0; i<H; i++){
		 for (int l = 0; l < N; l++) {
		  for (int k = 0;  k < N; k++){
			  helper = helper + MO4.mas[l].vect[k]*MZ.mas[k].vect[i];
		  }
		    helper = helper + MB.mas[l].vect[i];
			if (a4 < helper) a4 = helper;
			helper = 0;
		 }
	}

	WaitForSingleObject(Mute, INFINITE);
	 if (a < a4) a = a4;
	ReleaseMutex(Mute);
	
	ReleaseSemaphore(S4,1, NULL);
	cout << "T4 has finished \n";
ExitThread(0);
}
int _tmain(int argc, _TCHAR* argv[])
{	
	cout << "Main thread has started \n";	
	InitializeCriticalSection(&CS);
	Mute = CreateMutex(NULL, 0, NULL);
	S1 = CreateSemaphore(NULL, 0, 3, NULL);
	S2 = CreateSemaphore(NULL, 0, 3, NULL);
	S3 = CreateSemaphore(NULL, 0, 3, NULL);
	S4 = CreateSemaphore(NULL, 0, 3, NULL);
	S5 = CreateSemaphore(NULL, 0, 3, NULL);
	
	DWORD thID1;
    CreateThread(NULL,0,(LPTHREAD_START_ROUTINE) T1,0,0,&thID1);
	DWORD thID2;
    CreateThread(NULL,0,(LPTHREAD_START_ROUTINE)  T2,0,0,&thID2);
	DWORD thID3;
    CreateThread(NULL,0, (LPTHREAD_START_ROUTINE) T3,0,0,&thID3);
	DWORD thID4;
    CreateThread(NULL,0, (LPTHREAD_START_ROUTINE) T4,0,0,&thID4);
	cout << "Main thread has finished \n";
	cin.get();
	return 0;
}

