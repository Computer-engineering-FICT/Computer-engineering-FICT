/************************************
// Parallel and distributed calculations
// Laboratory Work # 8
// MPI
//
// MA = MB * (MZ * MX)
//
// Voytova Anastasi
// IO-71
//
// 18 April 2010
*************************************/
#include "stdafx.h"
#include <mpi.h>
#include "windows.h"
#include <iostream>
#include <fstream>
#include <math.h>

using namespace std;

int N;
int k;
int	p;
int	H;
int	el = 1;

int getMElement(int* matr, int i, int j){
	return matr[i*N+j];
}

void setMElement(int* matr, int i, int j, int val){
	matr[i*N+j]=val;
}

void outputMatr(int* matr,int rank, char n[]){
	char buffer[15];
	int l = sprintf (buffer, "%d_%s", rank,n);
	ofstream outf(buffer);
	for (int i = 0; i < N; i++){
		for (int j = 0; j < N; j++){
			outf << getMElement(matr,i,j) << " ";
		}
		outf<<"\n";
	}
	outf.close();
}

void inputMatr(int* matr){
	int a = 1;
	for (int i = 0; i < N*N; i++){
		matr[i] = a;
		//a++;
	}
}

void transMatr(int* matr){
	int buf = 0;
	for (int i = 0; i < N; i++) {
		for (int j = i; j < N; j++) {
			buf = matr[i*N+j];
			matr[i*N+j] = matr[j*N+i];
			matr[j*N+i] = buf;
		}
	}
}

int* calc (int* MB, int* MZ, int* MX, int rank){
	//MBo*(MZo*MX)
	int* M4 = new int[H*N];
	int* rez = new int[H*N];

	int el = 0;
	for (int i = 0; i < H*N; i++){
			M4[i] = 0;
			rez[i] = 0;
	}
	for (int h = 0; h < H; h++){
		for (int k = 0; k < N; k++){
			el = 0;
			for (int es = 0; es < N; es++){
				el = el + getMElement(MZ,k,es) * MX[h*N+es];
			}
			M4[h*N+k] = el;
		}
		for (int k = 0; k < N; k++){
			el = 0;
			for (int es = 0; es < N; es++){
				el = el + getMElement(MB,k,es) * M4[h*N+es];
			}
			rez[h*N+k] = el;
		}
	}
	return rez;
}

/****************************************************/
int main(int argc, char* argv[])
{

	int rank, size;
	MPI_Status status;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	if (rank == 0) {
		printf("\nN:");fflush(stdout);
		scanf_s("%d",&N);
	}

	MPI_Bcast(&N, 1, MPI_INT, 0, MPI_COMM_WORLD);
	p = size;
	k = (int)sqrt((double)p);
	H = N/p;
	printf ("\nT%d: N = %d and k = %d and H = %d and p = %d", rank, N, k, H, p);

	printf ("\nT%d: START ", rank);

	int sendLineSize = rank*k*H*N;
	int sendColSize = (k - 1)*H*N;
	int recLineSize = (rank+1)*k*H*N;
	int side = rank % k;

	//top
	if (rank < k) {
	int* MX = new int [N*N];
	int* MB = new int [N*N];
	int* MZ = new int [N*N];
		if ((rank % k) == (k - 1) ) {//top right corner
			inputMatr(MX);
			setMElement(MX,1,1,2);
			transMatr(MX);
			//outputMatr(MX,N,rank,"inputMX.txt");
		}else{
			MPI_Recv(MX,recLineSize,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);
		}
		if (rank != 0){
			//sending to left
			MPI_Send(MX+H*N*k,sendLineSize,MPI_INT,rank-1,0,MPI_COMM_WORLD);
		}
		//sending down
		MPI_Send(MX+H*N,sendColSize, MPI_INT,rank+k,0,MPI_COMM_WORLD);
		MPI_Recv(MB,N*N,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);
		MPI_Recv(MZ,N*N,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);
		
		printf ("\nT%d: CALCULATES ", rank);
		int* rez = calc (MB, MZ, MX,rank);
		MPI_Send(rez,N*H, MPI_INT,rank+k,0,MPI_COMM_WORLD);
		delete MX;
		delete MB;
		delete MZ;
		delete rez;
	}
	 else
		//down
		if (rank >= p - k){
			int* MX = new int [H*N];
			int* MB = new int [N*N];
			int* MZ = new int [N*N];
			MPI_Recv(MX,N*H,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);
			
			if (rank == (k*k - k) ) {//down left corner
				inputMatr(MB);
				MPI_Send(MB,N*N,MPI_INT,rank+1,0,MPI_COMM_WORLD);
				MPI_Send(MB,N*N,MPI_INT,rank-k,0,MPI_COMM_WORLD);

				MPI_Recv(MZ,N*N,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);
			}else {
			if ( rank == (k*k - 1) ) {//down right corner
				MPI_Recv(MB,N*N,MPI_INT,rank-1,0,MPI_COMM_WORLD,&status);
				MPI_Send(MB,N*N,MPI_INT,rank-k,0,MPI_COMM_WORLD);

				inputMatr(MZ);
				MPI_Send(MZ,N*N,MPI_INT,rank-1,0,MPI_COMM_WORLD);
			}else {//down center
				MPI_Recv(MB,N*N,MPI_INT,rank-1,0,MPI_COMM_WORLD,&status);
				MPI_Send(MB,N*N,MPI_INT,rank+1,0,MPI_COMM_WORLD);
				MPI_Send(MB,N*N,MPI_INT,rank-k,0,MPI_COMM_WORLD);

				MPI_Recv(MZ,N*N,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);
				MPI_Send(MZ,N*N,MPI_INT,rank-1,0,MPI_COMM_WORLD);
				}
			}
			MPI_Send(MZ,N*N,MPI_INT,rank-k,0,MPI_COMM_WORLD);	

			printf ("\nT%d: CALCULATES ", rank);
			int* rez = calc (MB, MZ, MX,rank);

			int* drez = new int[k*N*H];

			MPI_Recv(drez,(k - 1)*H*N,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);
			
			for (int i = 0; i < H*N; i ++){
				drez[i+(k-1)*N*H] = rez[i];
			}
			delete rez;

			if (rank == (k*k - 1) ){ //right corner
				MPI_Send(drez,k*N*H,MPI_INT,rank-1,0,MPI_COMM_WORLD);
			}else {
				if (rank != (k*k - k) ){ //all except left down
					int* ddrez = new int[(k*k-rank)*k*N*H];

					MPI_Recv(ddrez,((k*k-rank)*k-k)*N*H,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);

					for (int i = 0; i < k*N*H; i ++){
						ddrez[i+((k*k-rank)*k-k)*N*H] = drez[i];
					}

					MPI_Send(ddrez,(k*k-rank)*k*N*H,MPI_INT,rank-1,0,MPI_COMM_WORLD);
					delete ddrez;

				}else{//left down
					int* lrez = new int[N*N];

					MPI_Recv(lrez, (k*k - k)*N*H,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);

					for (int i = 0; i < k*H*N; i ++){
						lrez[i+(k*k - k)*N*H] = drez[i];
					}

					//int MA[N][N];
					//makeMatr(lrez,MA);
					transMatr(lrez);
					outputMatr(lrez,rank,"outMA.txt");
					delete MX;
					delete MB;
					delete MZ;
					delete lrez;
					delete drez;
				}
			}
		}
		//center
		else{
			div_t divr = div(rank, k);
			int l = divr.quot;
			int centRecSize = (k - l)*H*N;
			int centSendSize = (k - l - 1)*H*N;

			int* MB = new int [N*N];
			int* MZ = new int [N*N];
			int* MX = new int[centRecSize];

			MPI_Recv(MX,centRecSize,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);
			
			MPI_Send(MX+N*H,centSendSize,MPI_INT,rank+k,0,MPI_COMM_WORLD);

			MPI_Recv(MB,N*N,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);
			MPI_Recv(MZ,N*N,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);

			MPI_Send(MB,N*N,MPI_INT,rank-k,0,MPI_COMM_WORLD);
			MPI_Send(MZ,N*N,MPI_INT,rank-k,0,MPI_COMM_WORLD);

			printf ("\nT%d: CALCULATES ", rank);
			int* rez = calc (MB, MZ, MX,rank);

			int centDownRSize = l*H*N;
			int centDownSSize = (l+1)*H*N;
			int* drez = new int[centDownSSize];
			MPI_Recv(drez,centDownRSize,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);

			for (int i = 0; i < H*N; i ++){
				drez[i+H*N*l] = rez[i];
			}
			MPI_Send(drez,centDownSSize, MPI_INT,rank+k,0,MPI_COMM_WORLD);
			delete MX;
			delete MB;
			delete MZ;
			delete rez;
			delete drez;
		}

	printf ("\nT%d: END\n", rank);

	MPI_Finalize();
	return 0;
}