// Laboratotna95.cpp : main project file.
/**
 * Лабораторная работа №5
 * Шлендик П.А, группа ИВ-91,ФИВТ
 * --F1:  c = MAX(A)*(A*B)
   --F2:  MG = SORT(MA - MB - MC)
   --F3:  d = MIN(A*TRANS(MB)) - B*SORT(C)
 */
#include "stdafx.h"
#include <iostream>
#include <conio.h>
#include <windows.h>

using std::cout;
using std::cin;

const int N=5;
//------------------------------------
void OutputVector(int V[])
{
	for(int i=0; i<N; i++)
	{
		cout<<V[i]<<" ";
	}
	cout<<"\n";
}
//---------------------------------
void OutputMatrix(int M[N][N])
{
	for(int i=0; i<N; i++)
	{
		cout<<"\n ";
		for(int j=0; j<N; j++)
		{
			cout<<M[i][j]<<" ";
		}
		cout<<"\n";
	}
}
//-------------------------------------------------------
//------------------------------------------------------
void F1()
{
	cout<<"Thread 1 is started\n";
    int A[N];
    int B[N];
    int C[N];
    for (int i=0; i<N; i++)
    {
		A[i] = 1;
        B[i] = 1;
        C[i] = 1;
    }
    int max = A[0];
		    for (int i = 1; i < N; i++) {
				if(max < A[i]){
			    max = A[i];
				}
		    }
			int c = 0;
			for (int i = 0; i < N; i++) {
				c = c + B[i] * C[i];
			}
			c=c*max;
    if (N <= 8)
	{
        cout<<c<<"\n";
    }
    cout<<"Thread 1 is finished\n";
}
//--------------------------------------------------------
//--------------------------------------------------------
void F2()
{
	cout<<"Thread 2 is started\n";
    int MA[N][N];
    int MB[N][N];
    int MC[N][N];
    for (int i = 0; i < N; i++)
    {
		for (int j = 0; j < N; j++)
        {
			MA[i][j] = 1;
            MB[i][j] = 1;
            MC[i][j] = 1;
        }
    }
    for (int i = 0; i < N; i++)
    {
		for (int j = 0; j < N; j++)
        {
			MA[i][j] = MA[i][j] - MB[i][j]-MC[i][j];
        }
    }
	int t = 0;
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < N; j++)
                {
                    for (int k = 0; k < N; k++)
                    {
                        if (MA[i][j] > MA[i][k])
                        {
                            t = MA[i][j];
                            MA[i][j] = MA[i][k];
                            MA[i][k] = t;
                        }
                    }
                }
            }
    if (N <= 8)
    {
		OutputMatrix(MA);
    }
    cout<<"Thread 2 is finished\n";
}
//--------------------------------------------------------------
//--------------------------------------------------------------
void F3()
{
	cout<<"Thread 3 is started\n";
    int A[N];
	int B[N];
    int C[N];
	int G[N];
	int MB[N][N];
	for (int i=0; i<N; i++)
    {
		A[i] = 1;
        B[i] = 1;
        C[i] = 1;
		G[N] = 0;
    }
	for (int i = 0; i < N; i++)
    {
		for (int j = 0; j < N; j++)
		{
            MB[i][j] = 1;
        }
    }
    int d = 0;
	int buf = 0;
            for (int i = 0; i < N - 1; i++)
            {
                for (int j = i + 1; j < N; j++)
                {
                    if (C[i] > C[j])
                    {
                        buf = C[i];
                        C[i] = C[j];
                        C[j] = buf;
                    }
                }
            }
            int f = 0;
			for (int i = 0; i < N; i++) {
				f = f + B[i] * C[i];
			}
			int tmp=0;
			for (int i = 0; i <N-1; i++) {
				for (int j = 0; j < N; j++) {
					tmp=MB[i][j];
					MB[i][j]=MB[j][i];
					MB[j][i]=tmp;
				}
			}
			for (int i = 0; i <N; i++) {
				 buf = 0;
				for (int j = 0; j < N; j++) {
					buf += A[i] * MB[j][i];
				}
                G[i]=buf;
			}
			int min = G[0];
		    for (int i = 1; i < N; i++) {
				if(min > G[i]){
			    min = G[i];
				}
		    }
            d=min-f;
    if (N <= 8)
    {
		cout<<d<<"\n";
    }
    cout<<"Thread 3 is finished\n";	
}
//---------------------------------------------------------------
//---------------------------------------------------------------
int main()
{
	cout<<"Thread Main is started\n";
	DWORD id1, id2, id3;
    HANDLE t[] = {
        CreateThread(NULL, 97000, (LPTHREAD_START_ROUTINE) F1, NULL, CREATE_SUSPENDED, &id1),
        CreateThread(NULL, 588001000, (LPTHREAD_START_ROUTINE) F2, NULL, CREATE_SUSPENDED, &id2),
        CreateThread(NULL, 588065000, (LPTHREAD_START_ROUTINE) F3, NULL, CREATE_SUSPENDED, &id3)
    }; 
    SetThreadPriority(t[0], THREAD_PRIORITY_HIGHEST);
    SetThreadPriority(t[1], THREAD_PRIORITY_NORMAL);
    SetThreadPriority(t[2], THREAD_PRIORITY_ABOVE_NORMAL); 
    ResumeThread(t[0]); 
	ResumeThread(t[1]); 
	ResumeThread(t[2]); 
	cout<<"Thread Main is finished\n";
	_getch();
    return 0;
}