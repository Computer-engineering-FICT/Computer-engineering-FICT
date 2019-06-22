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
#include "omp.h"
#include <windows.h>
#include <iostream>
#include "operations.h"
#include <ctime>
#include <clocale>

using namespace std;
#pragma comment(linker, "/stack:160000000")


const int P = 4;


int main()
{
	vector A = new int[N], B, Z;
	matrix MO, MK;
	matrix	BufMatr1;
	vector BufVect1;
	int alfa;

	BufMatr1 = initMatrix();
	
	BufVect1 = initVector();
	
	B = initVector();
	Z = initVector();
	MO = initMatrix();
	MK = initMatrix();
	
	const int H = N / P;
	omp_lock_t lock_Copy;

	setlocale(LC_ALL, "Russian");
	omp_init_lock(&lock_Copy);
	omp_set_dynamic(0);
	omp_set_num_threads(P);
#pragma omp parallel
	{
		 
		int tid = omp_get_thread_num();

		cout << "Задача " << tid+1 << " стартувала" << endl;
		/* Введення B,α  у задачі Т1*/
		if (tid == 0){
			B = inputVector(1);
		//	B[2] = 0;
			alfa = 1;
			
		}
		/* Введення Z, MO у задачі Т3 */
		if (tid == 2){
			
			Z = inputVector(1);
			
			MO = inputMatrix(1);
		
		}
		/* Введення MK у задачі Т4*/
		if (tid == 3){
			MK = inputMatrix(1);
		}
		/*Бар’єр для усіх задач. Синхронізація по вводу*/
#pragma omp barrier
		matrix MOid;
		vector Zid;
		int alfaId;


		/*Копіювати MOid= MO, MRid=MR, αid = α, */
#pragma omp_atomic
		{

			alfaId = alfa;
			
		}
		
		
		omp_set_lock(&lock_Copy);
			Zid = copyVector(Z);
			
			MOid = copyMatrix(MO);
		omp_unset_lock(&lock_Copy);


		

		
		/*Обчислення 1 АH = αid*ВH + Zid*(MOid*MKH)*/
		
		for (int i = tid * H; i < (tid + 1) * H; i++) {
			BufVect1[i] = 0;
			for (int j = 0; j < N; j++) {
				BufMatr1[i][j] = 0;
				for (int z = 0; z < N; z++) {
					BufMatr1[i][j] += MOid[j][z] * MK[i][j];
					
				}
				
				BufVect1[i] += Zid[j] * BufMatr1[i][j];
				
				
			}
		}

		
		
		for (int i = tid*H; i < (tid + 1)*H; i++)
		{
			B[i] = B[i] * alfaId;
			
		}
		
		for (int i = tid*H; i < (tid + 1)*H; i++)
		{

			A[i] = B[i] + BufVect1[i];
			
			
			
		}

		/*Обчислення 2 АH = sort(AH)*/
		for (int i = tid*H; i < (tid + 1)*H; i++)
		{
			
			for (int j = tid*H; j < ((tid + 1)*H)-1; j++)

			{
				
				if (A[j + 1] < A[j])

				{

					int tmp = A[j + 1];

					A[j + 1] = A[j];

					A[j] = tmp;
					
				}

			}
		}

		/*Бар’єр. Синхронизація обчислення 2*/
#pragma omp barrier
		/*Обчислення 3 A2H=merge(AH, AH)*/
			if (tid == 1){
				merge(0, H, H,H*2,A);
				
				
			}
			/*Обчислення 3 A2H=merge(AH, AH)*/
			if (tid == 2){
				merge(H*2, H*3, H*3, H * 4, A);
			}
			/*Бар’єр. Синхронизація обчислення 3*/
#pragma omp barrier
			if (tid == 0){
				/*Обчислення 4 А= merge(А2H, А2H)*/
				merge(0, H * 2, H * 2, H * 4, A);
				/*Вивід А*/
				output(A);
				
			}

			
		

		cout << "Задача " << tid+1 << " завершилась" << endl;
	}
	int stop1;
	cin >> stop1;
	return 0;
}
