/************************************
// Parallel and distributed calculations
// Laboratory Work # 8
// MPI
//
// MA = B * (MX * MZ - a * ME)
//
// Grooby Pavel
// IO-73
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

int getVElement(int* vec, int i){
	return vec[i];
}

void setMElement(int* matr, int i, int j, int val){
	matr[i*N+j]=val;
}

void setVElement(int* vec, int i, int val){
	vec[i]=val;
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

void outputVec(int* vec,int rank, char n[]){
	char buffer[15];
	//int l = sprintf (buffer, "%d_%s", rank,n);
	printf ("\nT%d RESULT: ", rank);
	ofstream outf(buffer);
	for (int i = 0; i < N; i++){
			cout << getVElement(vec,i) << " ";
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

void inputVec(int* vec){
	int a = 1;
	for (int i = 0; i < N; i++){
		vec[i] = a;
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

int* calc (int* MZ, int* MX, int* ME, int* B, int* a, int rank){
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
				el = el + getMElement(MX,k,es) * MZ[h*N+es];
			}
			M4[h*N+k] = el - (*a)*ME[h*N+k];
		}
		for (int k = 0; k < N; k++){
			el = 0;
			for (int es = 0; es < N; es++){
				el = el + getVElement(B,es) * M4[h*N+es];
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
	//printf ("\nT%d: N = %d and k = %d and H = %d and p = %d", rank, N, k, H, p);

	printf ("\nT%d: START ", rank);

	int sendMatrLineSize = rank*k*H*N;
	int sendMatrColSize = (k - 1)*H*N;
	int recMatrLineSize = (rank+1)*k*H*N;

	int sendVecLineSize = rank*k*H;
	int sendVecColSize = (k - 1)*H;
	int recVecLineSize = (rank+1)*k*H;

	int side = rank % k;

	//top
	if (rank < k) {
	int* ME = new int [N*N];
	int* MZ = new int [N*N];
	int* MX = new int [N*N];
	int* B = new int [N];
	int* a = new int;

		if ((rank % k) == (k - 1) ) {//top right corner
			inputMatr(ME);
			inputVec(B);
			//setMElement(ME,2,2,2);
			//setVElement(B,1,2);
			//transMatr(ME);
			//outputMatr(ME,N,rank,"inputMX.txt");
		}else{
			MPI_Recv(ME,recMatrLineSize,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);
			MPI_Recv(B,N,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);
		}
		if (rank != 0){
			//sending to left
			MPI_Send(ME+H*N*k,sendMatrLineSize,MPI_INT,rank-1,0,MPI_COMM_WORLD);
			MPI_Send(B,N,MPI_INT,rank-1,0,MPI_COMM_WORLD);
		}
		//sending down
		MPI_Send(ME+H*N,sendMatrColSize, MPI_INT,rank+k,0,MPI_COMM_WORLD);
		MPI_Send(B,N, MPI_INT,rank+k,0,MPI_COMM_WORLD);
		MPI_Recv(MZ,N*N,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);
		MPI_Recv(MX,H*N,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);
		MPI_Recv(a,1,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);
		
		printf ("\nT%d: CALCULATES ", rank);
		int* rez = calc (MZ, MX, ME, B, a, rank);
		MPI_Send(rez,H, MPI_INT,rank+k,0,MPI_COMM_WORLD);
		delete ME;
		delete MZ;
		delete MX;
		delete B;
		delete a;
		delete rez;
	}
	 else
		//down
		if (rank >= p - k){
		int* ME = new int [N*N];
		int* MZ = new int [N*N];
		int* MX = new int [N*N];
		int* B = new int [N];
		int* a = new int;

			MPI_Recv(ME,N*H,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);
			MPI_Recv(B,N,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);
			
			if (rank == (k*k - k) ) {//down left corner
				inputMatr(MZ);
				MPI_Send(MZ+H*N*k,sendMatrLineSize,MPI_INT,rank+1,0,MPI_COMM_WORLD);
				MPI_Send(MZ+H*N,sendMatrColSize,MPI_INT,rank-k,0,MPI_COMM_WORLD);

				MPI_Recv(MX,N*N,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);
				MPI_Recv(a,1,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);
			}else {
			if ( rank == (k*k - 1) ) {//down right corner
				MPI_Recv(MZ,recMatrLineSize,MPI_INT,rank-1,0,MPI_COMM_WORLD,&status);
				MPI_Send(MZ+H*N,sendMatrColSize,MPI_INT,rank-k,0,MPI_COMM_WORLD);

				inputMatr(MX);
				*a = 1;
				MPI_Send(MX,N*N,MPI_INT,rank-1,0,MPI_COMM_WORLD);
				MPI_Send(a,1,MPI_INT,rank-1,0,MPI_COMM_WORLD);
			}else {//down center
				MPI_Recv(MZ,recMatrLineSize,MPI_INT,rank-1,0,MPI_COMM_WORLD,&status);
				MPI_Send(MZ+H*N*k,sendMatrLineSize,rank+1,0,MPI_COMM_WORLD);
				MPI_Send(MZ+H*N,sendMatrColSize,N*N,MPI_INT,rank-k,0,MPI_COMM_WORLD);

				MPI_Recv(MX,N*N,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);
				MPI_Recv(a,1,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);
				MPI_Send(MX,N*N,MPI_INT,rank-1,0,MPI_COMM_WORLD);
				MPI_Send(a,1,MPI_INT,rank-1,0,MPI_COMM_WORLD);
				}
			}
			MPI_Send(MX,N*N,MPI_INT,rank-k,0,MPI_COMM_WORLD);
			MPI_Send(a,1,MPI_INT,rank-k,0,MPI_COMM_WORLD);

			printf ("\nT%d: CALCULATES ", rank);
			int* rez = calc (MZ, MX, ME, B, a, rank);

			int* drez = new int[k*H];

			MPI_Recv(drez,(k - 1)*H,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);
			
			for (int i = 0; i < H; i ++){
				drez[i+(k-1)*H] = rez[i];
			}
			delete rez;

			if (rank == (k*k - 1) ){ //right corner
				MPI_Send(drez,k*H,MPI_INT,rank-1,0,MPI_COMM_WORLD);
			}else {
				if (rank != (k*k - k) ){ //all except left down
					int* ddrez = new int[(k*k-rank)*k*H];

					MPI_Recv(ddrez,((k*k-rank)*k-k)*H,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);

					for (int i = 0; i < k*H; i ++){
						ddrez[i+((k*k-rank)*k-k)*H] = drez[i];
					}

					MPI_Send(ddrez,(k*k-rank)*k*H,MPI_INT,rank-1,0,MPI_COMM_WORLD);
					delete ddrez;

				}else{//left down
					int* lrez = new int[N];

					MPI_Recv(lrez, (k*k - k)*H,MPI_INT,rank+1,0,MPI_COMM_WORLD,&status);

					for (int i = 0; i < k*H; i ++){
						lrez[i+(k*k - k)*H] = drez[i];
					}
					outputVec(lrez,rank,"outA.txt");
					delete ME;
					delete MZ;
					delete MX;
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

			int* ME = new int [N*N];
			int* MZ = new int [N*N];
			int* MX = new int [N*N];
			int* B = new int [N];
			int* a = new int;

			MPI_Recv(ME,centRecSize,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);
			MPI_Recv(B,N,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);
			
			MPI_Send(ME+N*H,centSendSize,MPI_INT,rank+k,0,MPI_COMM_WORLD);
			MPI_Send(B,N,MPI_INT,rank+k,0,MPI_COMM_WORLD);

			MPI_Recv(MZ,centRecSize,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);
			MPI_Recv(MX,N*N,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);
			MPI_Recv(a,1,MPI_INT,rank+k,0,MPI_COMM_WORLD,&status);

			MPI_Send(MZ+N*H,centSendSize,MPI_INT,rank-k,0,MPI_COMM_WORLD);
			MPI_Send(MX,N*N,MPI_INT,rank-k,0,MPI_COMM_WORLD);
			MPI_Send(a,1,MPI_INT,rank-k,0,MPI_COMM_WORLD);

			printf ("\nT%d: CALCULATES ", rank);
			int* rez = calc (MZ, MX, ME, B, a, rank);

			int centDownRSize = l*H;
			int centDownSSize = (l+1)*H;
			int* drez = new int[centDownSSize];
			MPI_Recv(drez,centDownRSize,MPI_INT,rank-k,0,MPI_COMM_WORLD,&status);

			for (int i = 0; i < H; i ++){
				drez[i+H*l] = rez[i];
			}
			MPI_Send(drez,centDownSSize, MPI_INT,rank+k,0,MPI_COMM_WORLD);
			delete ME;
			delete MZ;
			delete MX;
			delete rez;
			delete drez;
		}

	printf ("\nT%d: END\n", rank);

	MPI_Finalize();
	return 0;
}