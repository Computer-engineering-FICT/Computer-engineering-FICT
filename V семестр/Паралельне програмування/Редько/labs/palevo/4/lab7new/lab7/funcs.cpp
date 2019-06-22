/*Глухенько Костянтин Анатолійович, група ІО-93
  лаб№7 MPI
  F1: 1.16  d = ((A + B)* C)   
  F2: 2.24  MG = SORT(MA - MB * MC)  
  F3: 3.22  S = SORT(MA*T)*/ 
#include "StdAfx.h"
#include "funcs.h"
#include <iostream>
#include <fstream>

int* PLUS(int ARG1[], int ARG2[]){
        static int RESULT[N];
        for(int i=0; i < N; i++)
            RESULT[i] = ARG1[i] + ARG2[i];
        return RESULT;
}
int MUL(int ARG1[], int ARG2[]){
        int RESULT = 0;
        for(int i=0; i < N; i++)
            RESULT += ARG1[i] * ARG2[i];
        return RESULT;
}

Matrix MINUS(Matrix ARG1, Matrix ARG2){
        static Matrix RESULT;
        for(int i=0; i < N; i++)
            for(int j=0; j < N; j++)
				RESULT.mas[i][j] = ARG1.mas[i][j] - ARG2.mas[i][j];
		return RESULT;
}
Matrix MUL(Matrix ARG1, Matrix ARG2){
        static Matrix RESULT;
        for(int i=0; i<N; i++)
            for(int j=0; j<N; j++)
                for(int k=0; k<N; k++)
					RESULT.mas[i][j] += ARG1.mas[i][k] * ARG2.mas[k][j];
        return RESULT;
}
Matrix SORT(Matrix ARG){
        for(int i=0; i<N; i++)
            for(int j=0; j<N; j++){
                for(int k=j+1; k<N; k++)
					if(ARG.mas[i][j] < ARG.mas[i][k]){
						int t = ARG.mas[i][j];
						ARG.mas[i][j] = ARG.mas[i][k];
						ARG.mas[i][k] = t;
                    }   
                for(int k=i+1; k<N; k++)
                    for(int m=0; m<N; m++)
						if(ARG.mas[i][j] < ARG.mas[k][m]){
							int t = ARG.mas[i][j];
							ARG.mas[i][j] = ARG.mas[k][m];
							ARG.mas[k][m] = t;
                        } 
            }
        return ARG;
}
int* MUL(Matrix ARG1, int ARG2[]){
        static int RESULT[N];
        for(int i=0; i<N; i++)
            for(int j=0; j<N; j++)
				RESULT[i] += ARG1.mas[i][j] * ARG2[j];
        return RESULT;
}
int* SORT(int* ARG){
        for(int i=0; i<N-1; i++)
            for(int j=i+1; j<N; j++)
                if(ARG[i] > ARG[j]){
                    int t = ARG[j];
                    ARG[j] = ARG[i];
                    ARG[i] = t;
                }   
        return ARG;
}
void F1(int A[], int B[], int C[]){
	int d = MUL(PLUS(A, B), C);	
	std:: ofstream out("F1.txt");
	out << "d = ((A + B)* C)= " << d;
	out.close();
}
void F2(Matrix MA, Matrix MB, Matrix MC){
	Matrix MG = SORT(MINUS(MA, MUL(MA, MB)));	
	std:: ofstream out("F2.txt");
	out << "MG = SORT(MA - MB * MC)" << std::endl;
	for(int i = 0; i < N; i++){
		for(int j = 0; j < N; j++)
			out << MG.mas[i][j] << ' ';
		out << std::endl;
	}
	out.close();
}
void F3(Matrix MA, int T[]){
	int* S = SORT(MUL(MA, T));	
	std:: ofstream out("F3.txt");
	out << "S = SORT(MA*T)" << std::endl;
	for(int i = 0; i < N; i++)
		out << S[i] << ' ';
	out << std::endl;
	out.close();
}
