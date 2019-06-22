/*Глухенько Костянтин Анатолійович, група ІО-93
  лаб№7 MPI
  F1: 1.16  d = ((A + B)* C)   
  F2: 2.24  MG = SORT(MA - MB * MC)  
  F3: 3.22  S = SORT(MA*T)*/ 
#include "stdafx.h"
#include "funcs.h"
#include <iostream>
#include <fstream>
#include <mpi.h>
using std::cout;
using std::endl;


void Thread_F1(){
	std:: cout << "T1 started" << std::endl;
	int val = 1;
	int A[N], B[N], C[N];
		for(int i = 0; i < N; i++){
			A[i] = val;
			B[i] = val;
			C[i] = val;
	}
	F1(A, B, C);
	std:: cout << "T1 finished" << std::endl;
}
void Thread_F2(){
	std:: cout << "T2 started" << std::endl;
	int val = 1;
	Matrix MA, MB, MC;
	for(int i = 0; i < N; i++)
		for(int j = 0; j < N; j++){
			MA.mas[i][j]=1;
			MB.mas[i][j]=1;
			MC.mas[i][j]=1;
		}
	F2(MA, MB, MC);
	std:: cout << "T2 finished" << std::endl;
}

void Thread_F3(){
	std:: cout << "T3 started" << std::endl;
	int val = 1;
	int T[N];
	Matrix MA;
	for(int i = 0; i < N; i++){
		for(int j = 0; j < N; j++)
			MA.mas[i][j]=1;
		T[i] = val;
	}
	F3(MA, T);
	std:: cout << "T3 finished" << std::endl;
}

int _tmain(int argc, char* argv[])
{	 
	cout << "lab started"<< endl;
	#pragma comment(linker, "/STACK:199999999999999")
	MPI_Init(&argc, &argv);
          int rankOfProcess;
          MPI_Comm_rank(MPI_COMM_WORLD, &rankOfProcess);
          switch(rankOfProcess) {
              case 0: Thread_F1(); break;
              case 1: Thread_F2(); break;
              case 2: Thread_F3(); break;
          }
    MPI_Finalize();
	cout << "lab finished"<< endl;
	return 0;
}

