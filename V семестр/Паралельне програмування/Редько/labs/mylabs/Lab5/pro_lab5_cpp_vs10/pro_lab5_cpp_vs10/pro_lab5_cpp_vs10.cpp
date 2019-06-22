#include "stdafx.h"
#include <iostream>
#include <algorithm>
#include <windows.h>

using namespace std;

/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             * 
 *    Laboratory work #5. Threads in Win32     *
 *                                             * 
 * Task: F1: E = A + B + C + D * (MA * MZ)     *
 *       F2: MD = (MA * MB) * TRANS(MC)        *
 *       F3: E = (MA * MM) * B + MB * SORT(A)  *
 * 											   *
 * @author Red'ko Alexander					   *
 * @group IO-01								   *
 * @date 08.10.12                              *
 *                                             *
 * * * * * * * * * * * * * * * * * * * * * * * *  
 */

const int n = 1000;

void inputVector(int []);
void inputMatrix(int [][n]);
void outputVector(int []);
void outputMatrix(int [][n]);
void sortVector(int []);
void add(int [], int [], int []);
void mul(int [][n], int [][n], int [][n]);
void mul(int [], int [][n], int []);
void transpose(int[][n], int[][n]);
void f1(int[], int[], int[], int[], int[][n], int[][n], int[]);
void f2(int[][n], int[][n], int[][n], int[][n]);
void f3(int[], int[], int[][n], int[][n], int [][n], int[]);
void taskF1(void);
void taskF2(void);
void taskF3(void);

int _tmain(int argc, _TCHAR* argv[])
{
	cout << "Lab5 started"<< endl; 
	DWORD TidF1, TidF2, TidF3;
	HANDLE hThreadF1, hThreadF2, hThreadF3;

	hThreadF1 = CreateThread(
		NULL,							//атрибут безпеки
		588065000,						//розмір стека
		(LPTHREAD_START_ROUTINE)taskF1, //функція потоку
		NULL,							//аргумент функції потоку
		CREATE_SUSPENDED,								//прапорець
		&TidF1							//ідентифікатор потоку
		);
	hThreadF2 = CreateThread(NULL, 588065000, (LPTHREAD_START_ROUTINE)taskF2,
		NULL, CREATE_SUSPENDED, &TidF2);
	hThreadF3 = CreateThread(NULL, 588065000, (LPTHREAD_START_ROUTINE)taskF3,
		NULL, CREATE_SUSPENDED, &TidF3);
	
	SetThreadAffinityMask(hThreadF1, 00);
	SetThreadAffinityMask(hThreadF2, 01);
	SetThreadAffinityMask(hThreadF3, 10);

	SetThreadPriority(hThreadF1, 3); 
	SetThreadPriority(hThreadF2, 3); 
	SetThreadPriority(hThreadF3, 3); 

	ResumeThread(hThreadF1);
	ResumeThread(hThreadF2);
	ResumeThread(hThreadF3);

	CloseHandle(hThreadF1);
	CloseHandle(hThreadF2);
	CloseHandle(hThreadF3);

	cout << "Lab5 ended"<< endl;
	char ch;
	cin >> ch;
	return 0;
}

void taskF1(void)
{
	cout << "Task F1 started" << endl;
	int a[n], b[n], c[n], d[n], e[n];
	int ma[n][n], mz[n][n];
	inputVector(a);
	inputVector(b);
	inputVector(c);
	inputVector(d);
	inputMatrix(ma);
	inputMatrix(mz);
	f1(a, b, c, d, ma, mz, e);
	outputVector(e);
	cout << "Task F1 ended" << endl;
}

void taskF2(void)
{
	cout << "Task F2 started" << endl;
	int ma[n][n], mb[n][n], mc[n][n], md[n][n];
	inputMatrix(ma);
	inputMatrix(mb);
	inputMatrix(mc);
	f2(ma, mb, mc, md);
	outputMatrix(md);
	cout << "Task F2 ended" << endl;
}

void taskF3(void)
{
	cout << "Task F3 started" << endl;
	int a[n], b[n], e[n];
	int ma[n][n], mb[n][n], mm[n][n];
	inputVector(a);
	inputVector(b);
	inputMatrix(ma);
	inputMatrix(mb);
	inputMatrix(mm);
	f3(a, b, ma, mb, mm, e);
	outputVector(e);
	cout << "Task F3 ended" << endl;
}

//E = A + B + C + D * (MA * MZ)
void f1(int a[], int b[], int c[], int d[], int ma[][n], int mz[][n], int e[])
{
	int ab[n], abc[n], dmamz[n];
	int mamz[n][n];
	add(a, b, ab);
	add(ab, c, abc);
	mul(ma, mz, mamz);
	mul(d, mamz, dmamz);
	add(abc, dmamz, e);
}

//MD = (MA * MB) * TRANS(MC)
void f2(int ma[][n], int mb[][n], int mc[][n], int md[][n])
{
	int mamb[n][n], tmc[n][n];
	mul(ma, mb, mamb);
	transpose(mc, tmc);
	mul(mamb, tmc, md);
}

//E = B * (MA * MM) + SORT(A) * MB
void f3(int a[], int b[], int ma[][n], int mb[][n], int mm[][n], int e[])
{
	int bmamm[n], amb[n];
	int mamm[n][n];
	mul(ma, mm, mamm);
	mul(b, mamm, bmamm);
	sortVector(a);
	mul(a, mb, amb);
	add(bmamm, amb, e);
}

void inputVector(int v[n])
{
	for(int i = 0; i < n; i++)
	{
		v[i] = 1;
	}
}

void inputMatrix(int m[n][n])
{
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++)
		{
			m[i][j] = 1;
		}
	}
}

void outputVector(int v[n])
{
	if(n <= 10)
	{
		for(int i = 0; i < n; i++)
		{
			cout << v[i] << " ";
		}
		cout << endl;
	}
}

void outputMatrix(int m[n][n])
{
	if(n <= 10)
	{
		for(int i = 0; i < n; i++)
		{
			for(int j = 0; j < n; j++)
			{
				cout << m[i][j] << " ";
			}
			cout << endl;
		}
	}
}

void sortVector(int v[n])
{
	sort(v, v + n);
}

void add(int left[], int right[], int res[])
{
	res[n];
	for(int i = 0; i < n; i++)
	{
		res[i] = left[i] + right[i];
	}
}

void transpose(int m[][n], int res[][n])
{
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++)
		{
			res[i][j] = m[j][i];
		}
	}
}


void mul(int left[][n], int right[][n], int res[][n])
{
	res[n][n];
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++)
		{
			res[i][j] = 0;
			for(int k = 0; k < n; k++)
			{
				res[i][j] = res[i][j] + left[i][k] * right[k][j];
			}
		}
	}
}

void mul(int left[], int right[][n], int res[])
{
	res[n];
	for(int j = 0; j < n; j++)
	{
		res[j] = 0;
		for(int k = 0; k < n; k++)
		{
			res[j] = res[j] + left[k] * right[k][j];
		}
	}
}