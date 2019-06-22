/*Глухенько Костянтин Анатолійович, група ІО-93
  лаб№7 MPI
  F1: 1.16  d = ((A + B)* C)   
  F2: 2.24  MG = SORT(MA - MB * MC)  
  F3: 3.22  S = SORT(MA*T)*/ 
#pragma once
int const N = 3;
struct Matrix{
	int mas[N][N];
};
void F1(int A[], int B[], int C[]);
void F2(Matrix MA, Matrix MB, Matrix MC);
void F3(Matrix MA, int T[]);
