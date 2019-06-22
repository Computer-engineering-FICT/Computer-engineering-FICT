/*Косейкина Анна Сергеевна, группа ІО-91
лаб№ 4. Параллельное программирование с помощью OpenMP
A=(B*MO)(ME+MR*MK)*/ 
#include <iostream>
#include <fstream>
#include <omp.h>
using std::cout;
using std::endl;
int const N = 6;
int const P = 6;
int const H = N/P;
int const val = 1;
omp_lock_t L1;
omp_lock_t L2;
struct Matrix{
	int mas[N][N];
};
Matrix MO, ME, MR, MK, MR1, MR2, MR3, MR4, MR5, MR6;
int A[N], B[N], T[N], T1[N], T2[N], T3[N], T4[N], T5[N], T6[N], B1[N], B2[N], B3[N], B4[N], B5[N], B6[N];

void Thread_T1_B1(){
    std:: cout << "T1 started" << std::endl;
	//Enter ME, MK
	for(int i = 0; i < N; i++){
		for(int j = 0; j < N; j++){
			ME.mas[i][j] = val;
            MK.mas[i][j] = val;
        }
    }
}
void Thread_T1_B2(){
    //copy B
    #pragma omp critical
	{
        for (int i = 0; i<N; i++){
            B1[i]=B[i];
        }
	}
    //count T
    for (int i = 0; i < H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            T[i] += MO.mas[i][j] * B1[j];
        }
    }
 
}
void Thread_T1_B3(){
    //copy T and MR
    omp_set_lock(&L1);
	for(int i = 0; i < N; i++)
		T1[i] = T[i];
	omp_unset_lock(&L1);
    omp_set_lock(&L2);
	    MR1=MR;
	omp_unset_lock(&L2);
    //count A
    for (int i = 0; i < H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            int temp = 0;
            for (int k = 0; k < N; k++)
            {
                temp += MR1.mas[k][j] * MK.mas[i][k];
            }
            A[i] += (temp + ME.mas[i][j]) * T1[j];
         }
     }
    std:: cout << "T1 finished" << std::endl;
}
//-----------------------------------------------------------------------------
void Thread_T2_B1(){
    std:: cout << "T2 started" << std::endl;
}
void Thread_T2_B2(){
    //copy B
    #pragma omp critical
	{
        for (int i = 0; i<N; i++){
            B2[i]=B[i];
        }
	}
    //count T
    for (int i = H; i < 2*H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            T[i] += MO.mas[i][j] * B2[j];
        }
    }
 
}
void Thread_T2_B3(){
    //copy T and MR
    omp_set_lock(&L1);
	for(int i = 0; i < N; i++)
		T2[i] = T[i];
	omp_unset_lock(&L1);
    omp_set_lock(&L2);
	    MR2=MR;
	omp_unset_lock(&L2);
    //count A
    for (int i = H; i < 2*H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            int temp = 0;
            for (int k = 0; k < N; k++)
            {
                temp += MR2.mas[k][j] * MK.mas[i][k];
            }
            A[i] += (temp + ME.mas[i][j]) * T2[j];
         }
     }
    std:: cout << "T1 finished" << std::endl;
}
//-------------------------------------------------------------------------------------------------------
void Thread_T3_B1(){
    std:: cout << "T3 started" << std::endl;
	//Enter MO
	for(int i = 0; i < N; i++){
		for(int j = 0; j < N; j++){
			MO.mas[i][j] = val;
        }
    }
}
void Thread_T3_B2(){
    //copy B
    #pragma omp critical
	{
        for (int i = 0; i<N; i++){
            B3[i]=B[i];
        }
	}
    //count T
    for (int i = 2*H; i < 3*H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            T[i] += MO.mas[i][j] * B3[j];
        }
    }
 
}
void Thread_T3_B3(){
    //copy T and MR
    omp_set_lock(&L1);
	for(int i = 0; i < N; i++)
		T3[i] = T[i];
	omp_unset_lock(&L1);
    omp_set_lock(&L2);
	    MR3=MR;
	omp_unset_lock(&L2);
    //count A
    for (int i = 2*H; i < 3*H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            int temp = 0;
            for (int k = 0; k < N; k++)
            {
                temp += MR3.mas[k][j] * MK.mas[i][k];
            }
            A[i] += (temp + ME.mas[i][j]) * T3[j];
         }
     }
    std:: cout << "T3 finished" << std::endl;
}
//-------------------------------------------------------------------------------------------------
void Thread_T4_B1(){
    std:: cout << "T4 started" << std::endl;
}
void Thread_T4_B2(){
    //copy B
    #pragma omp critical
	{
        for (int i = 0; i<N; i++){
            B4[i]=B[i];
        }
	}
    //count T
    for (int i = 3*H; i < 4*H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            T[i] += MO.mas[i][j] * B4[j];
        }
    }
 
}
void Thread_T4_B3(){
    //copy T and MR
    omp_set_lock(&L1);
	for(int i = 0; i < N; i++)
		T4[i] = T[i];
	omp_unset_lock(&L1);
    omp_set_lock(&L2);
	    MR4=MR;
	omp_unset_lock(&L2);
    //count A
    for (int i = 3*H; i < 4*H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            int temp = 0;
            for (int k = 0; k < N; k++)
            {
                temp += MR4.mas[k][j] * MK.mas[i][k];
            }
            A[i] += (temp + ME.mas[i][j]) * T4[j];
         }
     }
    std:: cout << "T4 finished" << std::endl;
}
//-------------------------------------------------------------------------------------
void Thread_T5_B1(){
    std:: cout << "T5 started" << std::endl;
}
void Thread_T5_B2(){
    //copy B
    #pragma omp critical
	{
        for (int i = 0; i<N; i++){
            B5[i]=B[i];
        }
	}
    //count T
    for (int i = 4*H; i < 5*H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            T[i] += MO.mas[i][j] * B5[j];
        }
    }
 
}
void Thread_T5_B3(){
    //copy T and MR
    omp_set_lock(&L1);
	for(int i = 0; i < N; i++)
		T5[i] = T[i];
	omp_unset_lock(&L1);
    omp_set_lock(&L2);
	    MR5=MR;
	omp_unset_lock(&L2);
    //count A
    for (int i = 4*H; i < 5*H; i++)
    {
        for (int j = 0; j < N; j++)
        {
            int temp = 0;
            for (int k = 0; k < N; k++)
            {
                temp += MR5.mas[k][j] * MK.mas[i][k];
            }
            A[i] += (temp + ME.mas[i][j]) * T5[j];
         }
     }
    std:: cout << "T5 finished" << std::endl;
}
//-----------------------------------------------------------------------------------
void Thread_T6_B1(){
    std:: cout << "T6 started" << std::endl;
	//Enter B, MR
	for(int i = 0; i < N; i++){
		for(int j = 0; j < N; j++){
			MR.mas[i][j] = val;
        }
    }
    for (int i = 0; i<N; i++)
        B[i] = val;
}
void Thread_T6_B2(){
    //copy B
    #pragma omp critical
	{
        for (int i = 0; i<N; i++){
            B6[i]=B[i];
        }
	}
    //count T
    for (int i = H*5; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            T[i] += MO.mas[i][j] * B6[j];
        }
    }
 
}
void Thread_T6_B3(){
    //copy T and MR
    omp_set_lock(&L1);
	for(int i = 0; i < N; i++)
		T6[i] = T[i];
	omp_unset_lock(&L1);
    omp_set_lock(&L2);
	    MR6=MR;
	omp_unset_lock(&L2);
    //count A
    for (int i = 5*H; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            int temp = 0;
            for (int k = 0; k < N; k++)
            {
                temp += MR6.mas[k][j] * MK.mas[i][k];
            }
            A[i] += (temp + ME.mas[i][j]) * T6[j];
         }
     }
}
void Thread_T6_B4(){
    cout << "A[0] = "<< A[0] << endl;
    cout << "T6 finished" << endl;
}
//--------------------------------------------------------------------------------
int main(int argc, char* argv[])
{	 			
	cout << "lab4 started"<< endl;
	omp_set_num_threads(P);
	omp_init_lock(&L1);
    omp_init_lock(&L2);
//#pragma comment(linker, "/STACK:599999999")
#pragma omp parallel
	{
		switch (omp_get_thread_num()){
		case 0: Thread_T1_B1();
			break;
		case 1: Thread_T2_B1();
			break;
		case 2: Thread_T3_B1();
			break;
		case 3: Thread_T4_B1();
			break;
		case 4: Thread_T5_B1();
			break;
		case 5: Thread_T6_B1();
			break;
		}
#pragma omp barrier //B1
		switch (omp_get_thread_num()){
		case 0: Thread_T1_B2();
			break;
		case 1: Thread_T2_B2();
			break;
		case 2: Thread_T3_B2();
			break;
		case 3: Thread_T4_B2();
			break;
		case 4: Thread_T5_B2();
			break;
		case 5: Thread_T6_B2();
			break;
		}
#pragma omp barrier //B2
		switch (omp_get_thread_num()){
		case 0: Thread_T1_B3();
			break;
		case 1: Thread_T2_B3();
			break;
		case 2: Thread_T3_B3();
			break;
		case 3: Thread_T4_B3();
			break;
		case 4: Thread_T5_B3();
			break;
		case 5: Thread_T6_B3();
			break;
		}
#pragma omp barrier //B3
		if (omp_get_thread_num() == 5)
			Thread_T6_B4();
	}
	cout << "lab4 finished"<< endl;
	return 0;
}

