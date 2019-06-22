/*--------------------------------------------------------------
--              Paralel and distributed computing             --
--                   Laboratory work #6. OpenMP               --
--                   IO-83                    --
--                                                  --
--------------------------------------------------------------*/
#include "stdafx.h"
#include <iostream>
#include "omp.h"
#include <windows.h>

using namespace std;

//Ğàçìåğ ñòåêà
#pragma comment(linker, "/stack:160000000") 

const int N = 9;
const int P = 9;
const int H = N/P;

int **MB = new int*[N];
int **MC = new int*[N];
int **MO = new int*[N];

int a = -999999999;

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

	#pragma omp parallel 
    {
		int num = omp_get_thread_num();
		
		printf("Thread %d: started\n", num);
		
//////////////////ÂÂÎÄ ÄÀÍÍÛÕ////////////////////
		switch (num) {
			case 0:		
				printf("Thread %d: Input MC, MO\n", num);
				inMatrix(MC);
				inMatrix(MO);
			break;
			
			case 8:
				printf("Thread %d: Input MB\n", num);
				inMatrix(MB);
			break;
		}
//////////////////ÑÈÍÕĞÎÍÈÇÀÖÈß ÏÎ ÂÂÎÄÓ////////////////////
		#pragma omp barrier

		int ax = -999999999;
		int **MCx = new int *[N];

		for (int i = 0; i < N; i++) {
			MCx[i] = new int[N];
		}
//////////////////ÊĞÈÒÈ×ÅÑÊÈÉ Ó×ÀÑÒÎÊ (Çàìîê)////////////////////
		omp_set_lock(&lck);
			cloneM(MCx, MC);
		omp_unset_lock(&lck);

//////////////////ÂÛ×ÈÑËÅÍÈÅ ÔÓÍÊÖÈÈ a////////////////////
		printf("Thread %d: started calculating\n", num);

		int sum;

	//ai = min(MBH – MCi * MZH)
	for (int z = num * H; z < (num + 1) * H; z++) { 		
		for (int i = 0; i < N; i++) {
				sum = 0;
			for (int j = 0; j < N; j++) {
				sum = sum + MB[z][j] * MCx[j][i];
			}
			sum = sum - MO[z][i];
			if (sum > ax) {
				ax = sum;
			}
		}
	}

//////////////////ÊĞÈÒÈ×ÅÑÊÈÉ Ó×ÀÑÒÎÊ////////////////////
		#pragma omp critical (minimum)
		{
			if (a < ax) {
				a = ax;
			}
		}
//////////////////ÑÈÍÕĞÎÍÈÇÀÖÈß ÏÎ ÂÛÂÎÄÓ////////////////////
		#pragma omp barrier

//////////////////ÂÛÂÎÄ ĞÅÇÓËÜÒÀÒÀ////////////////////
		if (num == 8) {
			cout << "\t result" << endl;
			cout << "\t is" << endl;
			cout << "                  " << endl;
			cout << "                  " << endl;
			cout<< a << "\t";
		}
		printf("Thread %d: finished\n", num);
	}

	printf("Main thread: finished\n");
	cin.get();
	return 0;
}