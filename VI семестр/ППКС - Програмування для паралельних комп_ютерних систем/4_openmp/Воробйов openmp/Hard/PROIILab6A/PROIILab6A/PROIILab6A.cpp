/*--------------------------------------------------------------
--              Paralel and distributed computing             --
--                   Laboratory work #6. OpenMP               --
--                  Func: A = B + C * (MO * MT)               --
--                   IO-83 Vorobyev Vitaliy                   --
--                         09.04.2011                         --
--------------------------------------------------------------*/
#include "stdafx.h"
#include <iostream>
#include "omp.h"
#include <windows.h>

using namespace std;

//Ðàçìåð ñòåêà
#pragma comment(linker, "/stack:160000000") 

const int N = 8;
const int P = 4;
const int H = N/P;

int *A = new int[N];
int *B = new int [N];
int *C = new int [N];
int *T = new int [N];
int **MO = new int*[N];
int **MT = new int*[N];

void inMatrix(int** matr) {
	for (int i = 0; i < N; i++) {
		matr[i] = new int[N];
	}

	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			matr [i][j] = 1;
		}
	}
}

void inVector(int* vec) {
	for (int i = 0; i < N; i++) {
		vec [i] = 1;
	}
}

void outVector(int* vec) {
	for (int i = 0; i < N; i++) {
		printf("%d  ", vec [i]);
	}
}

void cloneV(int* V, int* M) { 
    for (int i = 0; i < N; i++) {
        V [i] = M [i];
    }
}

void cloneM(int **MT, int **MM) { 
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            MT [i][j] = MM [i][j];
        }
    }
}

int _tmain(int argc, _TCHAR* argv[])
{
	printf("Main thread: started\n");
	
	omp_lock_t lck;
	omp_init_lock(&lck);
	omp_set_num_threads(P);
	//cin.get();

	#pragma omp parallel 
    {
		int num = omp_get_thread_num();
		
		printf("Thread %d: started\n", num);
		
//////////////////ÂÂÎÄ ÄÀÍÍÛÕ////////////////////
		switch (num) {
			case 0:		
				printf("Thread %d: Input B, C\n", num);
				inVector(B);
				inVector(C);
			break;
		
			case 1:
				printf("Thread %d: Input MO\n", num);
				inMatrix(MO);
			break;
			
			case P-1:
				printf("Thread %d: Input MT\n", num);
				inMatrix(MT);
			break;
		}
//////////////////ÑÈÍÕÐÎÍÈÇÀÖÈß ÏÎ ÂÂÎÄÓ////////////////////
		#pragma omp barrier

		int *Cx = new int [N];
//////////////////ÊÐÈÒÈ×ÅÑÊÈÉ Ó×ÀÑÒÎÊ (Çàìîê)////////////////////
		omp_set_lock(&lck);
			cloneV(Cx, C);
		omp_unset_lock(&lck);

//////////////////ÂÛ×ÈÑËÅÍÈÅ ÔÓÍÊÖÈÈ Ò////////////////////
		printf("Thread %d: started calculating\n", num);

		int sum;

		for (int z = num * H; z < (num + 1) * H; z++) {
			for (int i = 0; i < N; i++) {
			   sum = 0;
			   for (int j = 0; j < N; j++) {
				  sum = sum + Cx[i] * MO[j][z];
			   }
			   T [z] = sum;
			}
	    }
//////////////////ÑÈÍÕÐÎÍÈÇÀÖÈß ÏÎ C×¨ÒÓ Ò////////////////////
		#pragma omp barrier

		int *Tx = new int [N];
//////////////////ÊÐÈÒÈ×ÅÑÊÈÉ Ó×ÀÑÒÎÊ////////////////////
			
		#pragma omp critical (copy)
		{
			cloneV(Tx, T);
		}

//////////////////ÂÛ×ÈÑËÅÍÈÅ ÔÓÍÊÖÈÈ A////////////////////
		#pragma omp barrier
	
		for (int z = num * H; z < (num + 1) * H; z++) {
			for (int i = 0; i < N; i++) {
			   sum = 0;
			   for (int j = 0; j < N; j++) {
				  sum = sum + Tx[i] * MT[j][z];
			   }
			   A[z] = sum + B[z];
			}
	    }

		printf("Thread %d: finished calculating\n", num);

//////////////////ÑÈÍÕÐÎÍÈÇÀÖÈß ÏÎ ÂÛÂÎÄÓ////////////////////
		#pragma omp barrier

//////////////////ÂÛÂÎÄ ÐÅÇÓËÜÒÀÒÀ////////////////////
		if (num == 0) {
			if (N <= 8) outVector(A);	
		}
		printf("Thread %d: finished\n", num);
	}

	printf("Main thread: finished\n");
	cin.get();
	return 0;
}