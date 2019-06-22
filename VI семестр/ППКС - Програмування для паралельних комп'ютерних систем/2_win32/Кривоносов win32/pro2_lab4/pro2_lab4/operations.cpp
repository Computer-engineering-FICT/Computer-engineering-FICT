/*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*                                                             *
*            Програмування паралельний комп'ютерних сисем     *
*             Лабораторна робота №4. Бібліотека OpenMP        *
*                                                             *
* Завдання: A = A=sort(alfa*B+Z(MO*MK))                       *
*                                                             *
* Автор Кривоносов Олексій                                    *
* Група ІО-34                                                 *
* Дата 02.04.16                                               *
*                                                             *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*/
#include "stdafx.h"
#include <windows.h>
using namespace std;
#include "operations.h"
#include <iostream>



void merge(int start1, int end1, int start2, int end2, int Z[]){
	vector L;
	int globstart = start1;
	L = copyVector(Z);
	while (start1 != end1 && start2 != end2){
		if (L[start1] <= L[start2]){
			Z[globstart] = L[start1];
			globstart++;
			start1++;
		}
		else if (L[start2] < L[start1]){
			Z[globstart] = L[start2];
			globstart++;
			start2++;
		}
	}
	if (start1 == end1)
		while (start2 != end2){
		Z[globstart] = L[start2];
		globstart++;
		start2++;
		}
	else if (start2 == end2){
		while (start1 != end1){
			Z[globstart] = L[start1];
			globstart++;
			start1++;
		}
	}
}
vector inputVector(int value){
	vector result = new int[N];
	for (int i = 0; i < N; i++)
	{
		result[i] = value;
	}
	return result;
}
matrix inputMatrix(int value){
	matrix result = new vector[N];
	for (int i = 0; i < N; i++)
	{
		result[i] = new int[N];
	}




	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			result[i][j] = value;
		}
	}
	return result;
}


void output(vector v) {
	if (N <= 20) {
		cout << endl;
		for (int i = 0; i < N; i++) {
			cout << v[i] << " ";
		}
		cout << endl;
	}
}


vector copyVector(vector v){
	vector result = new int[N];
	for (int i = 0; i < N; i++)
	{
		result[i] = v[i];
	}
	return result;
}


matrix copyMatrix(matrix m){
	matrix result = new vector[N];
	for (int i = 0; i < N; i++)
	{
		result[i] = new int[N];
	}




	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			result[i][j] = m[i][j];
		}
	}
	return result;
}


matrix initMatrix(){
	matrix result = new vector[N];
	for (int i = 0; i < N; i++)
	{
		result[i] = new int[N];
		for (int j = 0; j < N; j++)
		{
			result[i][j] = 0;
		}
	}
	return result;
}
vector initVector(){
	vector result = new int[N];
	for (int i = 0; i < N; i++)
	{
		result[i] = 0;
	}
	return result;
}
