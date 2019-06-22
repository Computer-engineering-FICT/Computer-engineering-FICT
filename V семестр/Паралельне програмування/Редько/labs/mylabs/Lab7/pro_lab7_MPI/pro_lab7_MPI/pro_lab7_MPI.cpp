// pro_lab7_MPI.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <algorithm>
#include <iostream>
#include "mpi.h"

typedef int* vector;
typedef int** matrix;

using namespace std;

/**
 * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *                                                   * 
 *       Laboratory work #7. Threads with MPI        *
 *                                                   *  
 * Task: F1: E = A + B + C + D * (MA * MZ)           *
 *       F2: MD = (MA * MB) * TRANS(MC)              *
 *       F3: E = B * (MA * MM) + SORT(A) * MB        *
 * 											         *
 * @author Red'ko Alexander					         *
 * @group IO-01								         *
 * @date 29.10.12                                    *
 *                                                   *
 * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */

const int n = 5000;

vector inputVector(int);
matrix inputMatrix(int);
void outputVector(vector);
void outputMatrix(matrix);
void sortVector(vector);
vector add(vector, vector);
matrix mul(matrix, matrix);
vector mul(vector, matrix);
matrix transpose(matrix);
vector f1(vector, vector, vector, vector, matrix, matrix);
matrix f2(matrix, matrix, matrix);
vector f3(vector, vector, matrix, matrix, matrix);
void taskF1(void);
void taskF2(void);
void taskF3(void);

int main(int argc, char* argv[])
{
	cout << "Lab7 started"<< endl;
	#pragma comment(linker, "/STACK:50000000")
	
	MPI_Init(&argc, &argv);
	int rank;
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	switch (rank) {
		case 0: taskF1(); break;
		case 1: taskF2(); break;
		case 2: taskF3(); break;
	}
	MPI_Finalize();

	cout << "Lab7 ended"<< endl;
	char ch;
	cin >> ch;
	return 0;
}

void taskF1(void)
{
	cout << "Task F1 started" << endl;
	vector a, b, c, d, e;
	matrix ma, mz;
	a = inputVector(1);
	b = inputVector(1);
	c = inputVector(1);
	d = inputVector(1);
	ma = inputMatrix(1);
	mz = inputMatrix(1);
	e = f1(a, b, c, d, ma, mz);
	outputVector(e);
	cout << "Task F1 ended" << endl;
}

void taskF2(void)
{
	cout << "Task F2 started" << endl;
	matrix ma, mb, mc, md;
	ma = inputMatrix(1);
	mb = inputMatrix(1);
	mc = inputMatrix(1);
	md = f2(ma, mb, mc);
	outputMatrix(md);
	cout << "Task F2 ended" << endl;
}

void taskF3(void)
{
	cout << "Task F3 started" << endl;
	vector a, b, e;
	matrix ma, mb, mm;
	a = inputVector(1);
	b = inputVector(1);
	ma = inputMatrix(1);
	mb = inputMatrix(1);
	mm = inputMatrix(1);
	e = f3(a, b, ma, mb, mm);
	outputVector(e);
	cout << "Task F3 ended" << endl;
}

//E = A + B + C + D * (MA * MZ)
vector f1(vector a, vector b, vector c, vector d, matrix ma, matrix mz)
{
	return add(add(add(a, b), c), mul(d, mul(ma, mz)));
}

//MD = (MA * MB) * TRANS(MC)
matrix f2(matrix ma, matrix mb, matrix mc)
{
	return mul(mul(ma, mb), transpose(mc));
}

//E = B * (MA * MM) + SORT(A) * MB
vector f3(vector a, vector b, matrix ma, matrix mb, matrix mm)
{
	sortVector(a);
	return add(mul(b, mul(ma, mm)), mul(a, mb));
}

vector inputVector(int value)
{
	vector result = new int[n];
	for(int i = 0; i < n; i++)
	{
		result[i] = value;
	}
	return result;
}

matrix inputMatrix(int value)
{
	matrix result = new vector[n];
	for(int i = 0; i < n; i++)
	{
		result[i] = new int[n];
	}
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++)
		{
			result[i][j] = value;
		}
	}
	return result;
}

void outputVector(vector v)
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

void outputMatrix(matrix m)
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

void sortVector(vector v)
{
	sort(v, v + n);
}

vector add(vector left, vector right)
{
	vector result = inputVector(0);
	for(int i = 0; i < n; i++)
	{
		result[i] = left[i] + right[i];
	}
	return result;
}

matrix transpose(matrix m)
{
	matrix result = inputMatrix(0);
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++)
		{
			result[i][j] = m[j][i];
		}
	}
	return result;
}


matrix mul(matrix left, matrix right)
{
	matrix result = inputMatrix(0);
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++)
		{
			result[i][j] = 0;
			for(int k = 0; k < n; k++)
			{
				result[i][j] += left[i][k] * right[k][j];
			}
		}
	}
	return result;
}

vector mul(vector left, matrix right)
{
	vector result = inputVector(0);
	for(int j = 0; j < n; j++)
	{
		result[j] = 0;
		for(int k = 0; k < n; k++)
		{
			result[j] += left[k] * right[k][j];
		}
	}
	return result;
}

