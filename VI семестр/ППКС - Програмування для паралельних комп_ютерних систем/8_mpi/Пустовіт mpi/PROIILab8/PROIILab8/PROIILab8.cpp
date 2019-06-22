/*--------------------------------------------------------------
--              Paralel and distributed computing             --
--                   Laboratory work #8. MPI                  --
--                  Func: MA = MB + MC*MZ                     --
--                   IO-73 Pustovit Michael                   --
--                         16.04.2010                         --
--------------------------------------------------------------*/

#include "stdafx.h"
#include <mpi.h>
#include <stdio.h>

const int R = 3;  //количество процессоров в ребре решетки
const int N = 9;
const int P = R*R;
const int H = N/P;


int* arrPoint (int* arr, int str, int row) {
	return arr + str*N + row;
}

int arrRead (int* arr, int str, int row) {
	return *(arr + str*N + row);
}

void inMatrix(int matr[N][N]) {
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			matr [i][j] = 1;
		}
	}
}

void outMatrix(int* matr, int str, int row) {
	for (int i = 0; i < str; i++) {
		for (int j = 0; j < row; j++) {
			printf("%d  ", arrRead (matr, i, j));
		}
		printf("\n");
	}
}

int* process (int* MB, int* MC, int MZ[N][N]) {
	int sum;	
	int* rez = new int[H*N];

	for (int z = 0; z < H; z++) {
		for (int i = 0; i < N; i++) {
			sum = 0;
			for (int j = 0; j < N; j++) {
				sum += arrRead (MC, z, j) * MZ[j][i];
			}
			*arrPoint (rez, z, i) = sum + arrRead (MB, z, i);
		}
	}
	return rez;
}

int main( int argc, char **argv )
{    
	int rank, size;
	MPI_Status status;

    MPI_Init( &argc, &argv );
    MPI_Comm_size( MPI_COMM_WORLD, &size );
    MPI_Comm_rank( MPI_COMM_WORLD, &rank );

	printf ("Prog num %d: START ", rank);

    //Верхняя линейка
	if (rank < R) {
		int n = R - rank - 1;
		int cursize = N * (R - n)/R;

		int *MB = new int[cursize*N];

		int MZ [N][N];

		if (n == 0) {
			int* temp;
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < N; j++) {
					temp = arrPoint (MB, i, j);
					*temp = 1;
				}
			}

			//temp = arrPoint (MB, 0, 5);
			//*temp = 22;

			inMatrix (MZ);
			//MZ[2][2] = 20;
		} else {
			MPI_Recv (MB, cursize*N, MPI_INT, rank + 1, 0, MPI_COMM_WORLD, &status);
			MPI_Recv (MZ, N*N, MPI_INT, rank + 1, 0, MPI_COMM_WORLD, &status);
		}

		if (rank != 0) {
			MPI_Send (MB, (cursize - R*H)*N, MPI_INT, rank - 1, 0, MPI_COMM_WORLD);		
			MPI_Send (MZ, N*N, MPI_INT, rank - 1, 0, MPI_COMM_WORLD);		
		}

		//printf ("**********MB*********Str: %d, row: %d\n", cursize, N);
		//outMatrix (MB, cursize, N);

		MPI_Send (MB + (cursize - R*H)*N, (R - 1)*N*H, MPI_INT, rank + R, 0, MPI_COMM_WORLD);		
		MPI_Send (MZ, N*N, MPI_INT, rank + R, 0, MPI_COMM_WORLD);

		int MC [H][N];
		MPI_Recv (MC, N*H, MPI_INT, rank + R, 0, MPI_COMM_WORLD, &status);

		printf ("Prog num %d: Processing begin ", rank);

		int* rez = process (MB + (cursize - H)*N, MC[0], MZ);

		//printf ("Str: %d, row: %d\n", cursize, N);
		//outMatrix (rez, H, N);

		MPI_Send (rez, H*N, MPI_INT, rank + R, 0, MPI_COMM_WORLD);

		//printf ("Str: %d, row: %d\n", H, N);
		//outMatrix (rez, H, N);
	} else 

	//Нижняя линейка
	if ( rank >= R*R - R ) {
		int n = rank - (R*R - R);
		
		int cursize = N * (R - n)/R;

		int *MC = new int[cursize*N];
		
		if (n == 0) {
			int* temp;
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < N; j++) {
					temp = arrPoint (MC, i, j);
					*temp = 1;
				}
			}

			//temp = arrPoint (MC, 1, 1);
			//*temp = 22;
		} else {			
			MPI_Recv (MC, cursize*N, MPI_INT, rank - 1, 0, MPI_COMM_WORLD, &status);		
		}

		if (n < R-1) { 
			MPI_Send (MC + R*H*N, (cursize - R*H)*N, MPI_INT, rank + 1, 0, MPI_COMM_WORLD);	
		}

		//printf ("Str: %d, n: %d\n", cursize, n);
		//outMatrix (MC, cursize, N);

		MPI_Send (MC + H*N, (R - 1)*H*N, MPI_INT, rank - R, 0, MPI_COMM_WORLD);

		int *MB = new int[H*N];
		int MZ[N][N];

		MPI_Recv (MB, H*N, MPI_INT, rank - R, 0, MPI_COMM_WORLD, &status);		
		MPI_Recv (MZ, N*N, MPI_INT, rank - R, 0, MPI_COMM_WORLD, &status);		

		//printf ("!*!*!*!*!*!*MB*!*!*!*! Str: %d, n: %d\n", cursize, n);
		//outMatrix (MC, H, N);

		printf ("Prog num %d: Processing begin ", rank);

		int* MA = new int[(R*R - rank)*R*H*N];		
		int* rez = process (MB, MC, MZ);

		int* temp = MA;

		for (int i = 0; i < H*N; i++) {
			*temp = *rez;
			temp++;
			rez++;
		}

		MPI_Recv (MA + H*N, (R-1)*H*N, MPI_INT, rank - R, 0, MPI_COMM_WORLD, &status);

		if (n < R-1) {
			MPI_Recv (MA + R*H*N, (R*R - rank - 1)*R*H*N, MPI_INT, rank + 1, 0, MPI_COMM_WORLD, &status);
		}

		if (n > 0) {
			MPI_Send (MA, (R*R - rank)*R*H*N, MPI_INT, rank - 1, 0, MPI_COMM_WORLD);
		}

		if ( (N <= 36) && (n == 0) ) {
			printf ("Str: %d, row: %d\n", H, N);
			outMatrix (MA, (R*R - rank)*R*H, N);
		}

	} else {
		//внутренние горизонтали
		int n = rank / R;

		int cursize = (R - n)*H;

		int *MB = new int[cursize*H*N];		
		int MZ [N][N];

		MPI_Recv (MB, cursize*H*N, MPI_INT, rank - R, 0, MPI_COMM_WORLD, &status);
		MPI_Recv (MZ, N*N, MPI_INT, rank - R, 0, MPI_COMM_WORLD, &status);

		//printf ("******MB******Str: %d, n: %d\n", cursize*H, n);
		//outMatrix (MB, cursize*H, N);

		MPI_Send (MB, (R - n - 1)*H*N, MPI_INT, rank + R, 0, MPI_COMM_WORLD);
		MPI_Send (MZ, N*N, MPI_INT, rank + R, 0, MPI_COMM_WORLD);

		int *MC = new int[(R*H - cursize + H)*N];

		MPI_Recv (MC, (R*H - cursize + H)*N, MPI_INT, rank + R, 0, MPI_COMM_WORLD, &status);

		//printf ("Str: %d, n: %d\n", (R*H - cursize + H), n);
		//outMatrix (MC, (R*H - cursize + H), N);

		MPI_Send (MC + H*N, (R*H - cursize)*N, MPI_INT, rank - R, 0, MPI_COMM_WORLD);

		printf ("Prog num %d: Processing begin ", rank);

		int* MA = new int[(R*H - cursize + H)*N];
		int* rez = process (MB + (cursize-H)*N, MC, MZ);

		int* temp = MA;

		//printf ("REZZ \n", (R*H - cursize)*H, N);
		//outMatrix (rez, H, N);

		for (int i = 0; i < H*N; i++) {
			*temp = *rez;
			temp++;
			rez++;
		}

		//printf ("Str: %d, row: %d\n", (R*H - cursize)*H, N);
		//outMatrix (MA, (R*H - cursize + H), N);

		MPI_Recv (MA + H*N, (R*H - cursize)*N, MPI_INT, rank - R, 0, MPI_COMM_WORLD, &status);
		MPI_Send (MA, (R*H - cursize + H)*N, MPI_INT, rank + R, 0, MPI_COMM_WORLD);
	}

	

	printf ("\n");
    MPI_Finalize();
}
