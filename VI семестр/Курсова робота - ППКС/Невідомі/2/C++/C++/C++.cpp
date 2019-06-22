#include "mpi.h"
#include "math.h"
#include <stdio.h>
#include <tchar.h>
#include "stdio.h"
#include "windows.h"
#include <iostream>

#pragma comment(lib, "mpich.lib")

using namespace std; 

#define N 4
#define P 2
const int  H = N / P; 
 

void initalisingM(int *t)
{
	for(int i = 0; i<N; i++)
		for(int j = 0; j<N; j++)
			t[i+N*j] = 0;
}
void initalisingV(int *t)
{
	for(int i = 0; i<N; i++)
		t[i] = 0;
}
void InputMatrix(int* matr) 
{
	for(int i =0; i<N*N; i++)
		matr[i] = 1;
}

void InputVector(int* matr) 
{
	for(int i =0; i<N; i++)
		matr[i] = 1;
}

void OutputVector(int *matr)
{
	int count = N;

	for(int i =0 ; i < count; i++)
	{
		printf("%d ", matr[i]);
	}
}

void Calc1(int *A, int *B, int *MX)
{
	for(int i =0; i < H; i++)
		for(int j = 0; j < N; j++)
			A[i] += B[j] * MX[j+i*N];
}

void Calc2(int *A, int *C, int *MM, int *MC)
{
	int *buf1 = new int[N*N];
	initalisingM(buf1);
	for(int i =0; i < H; i++)
		for(int j = 0; j < N; j++)
		{
			for(int k = 0; k < N; k++)
				buf1[j+N*i] += MC[k+N*i] *MM[j+N*k] ;
		}

	for(int i =0; i < H; i++)
		for(int j = 0; j < N; j++)
			A[i] += C[j] * buf1[j+i*N];
}

int main(int args, char * argv[])
{
	int id;
    int p;
    MPI_Status status;

    MPI_Init(&args,&argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &id);
    MPI_Comm_size(MPI_COMM_WORLD, &p);

    switch(id)
	{
	case 0:
		{
			cout<<" Task"<<id<<" start"<<endl;
                                   
            int *MA = new int[N*N];
            int *MX = new int[N*N];
            int *MM = new int[N*N];
			int *MC = new int[N*N];
            int *A = new int[N];
			int *C = new int[N];
			int *B = new int[N];
                                   
            initalisingM(MA);
            initalisingM(MX);
            initalisingM(MM);
            initalisingM(MC);
			initalisingV(A);
			initalisingV(C);
			initalisingV(B);

            InputMatrix(MM);
			InputVector(B);
                                                                      
            MPI_Send((void*) MM,N*N,MPI_INT,id+1,id+1,MPI_COMM_WORLD);
			MPI_Send((void*) B,N,MPI_INT,id+1,id+1,MPI_COMM_WORLD);
			MPI_Recv(MX,N*H,MPI_INT,id+1,id+1,MPI_COMM_WORLD,&status);
			MPI_Recv(MC,N*H,MPI_INT,id+1,id+1,MPI_COMM_WORLD,&status);

			Calc1(C, B, MX);

			int *aBuff = new int[N];
			initalisingV(aBuff);
			MPI_Recv(aBuff,H*(P-1-id),MPI_INT,id+1,id+1,MPI_COMM_WORLD,&status);

			for(int i =H; i<H*(P-id); i++)
				C[i] = aBuff[i-H];

			MPI_Send((void*) C,N,MPI_INT,id+1,id+1,MPI_COMM_WORLD);
	       
			Calc2(A, C, MM, MC);
	       
			int *aBuff1 = new int[N];
			initalisingV(aBuff1);
			MPI_Recv(aBuff1,H*(P-1-id),MPI_INT,id+1,id+1,MPI_COMM_WORLD,&status);

			for(int i =H; i<H*(P-id); i++)
				A[i] = aBuff1[i-H];

		    OutputVector(A);

			cout<<" Task"<<id<<" finish"<<endl;
		} 
		break;

	case P-1:
		{
			cout<<" Task"<<id<<" start"<<endl;
			int *MA = new int[N*N];
            int *MX = new int[N*N];
			int *MX_out = new int[N*N];
            int *MM = new int[N*N];
			int *MC = new int[N*N];
			int *MC_out = new int[N*N];
            int *A = new int[N];
			int *C = new int[N];
			int *B = new int[N];
                                   
            initalisingM(MA);
            initalisingM(MX);
            initalisingM(MM);
            initalisingM(MC);
			initalisingV(A);
			initalisingV(C);
			initalisingV(B);

			InputMatrix(MX);
			InputMatrix(MC);

			for(int i = 0 ; i < (N-H)*N ; i++){
				MX_out[i] = MX[i];
				MC_out[i] = MC[i];
			}

			MPI_Recv(MM,N*N,MPI_INT,id-1,id,MPI_COMM_WORLD,&status);
			MPI_Recv(B,N,MPI_INT,id-1,id,MPI_COMM_WORLD,&status);
			MPI_Send(MX_out,N*(N-H),MPI_INT,id-1,id,MPI_COMM_WORLD);
			MPI_Send(MC_out,N*(N-H),MPI_INT,id-1,id,MPI_COMM_WORLD);

			Calc1(C, B, MX);

			MPI_Send(C,H,MPI_INT,id-1,id,MPI_COMM_WORLD);

			MPI_Recv(C,N,MPI_INT,id-1,id,MPI_COMM_WORLD,&status);

			Calc2(A, C, MM, MC);

			MPI_Send(A,H,MPI_INT,id-1,id,MPI_COMM_WORLD);

			cout<<" Task"<<id<<" finish"<<endl;   
		}
		break;
	default:
		{
			cout<<" Task"<<id<<" start"<<endl;
			int *MA = new int[N*N];
            int *MX = new int[N*N];
			int *MX_out = new int[N*N];
			int *MX_in = new int[N*N];
            int *MM = new int[N*N];
			int *MC = new int[N*N];
			int *MC_out = new int[N*N];
			int *MC_in = new int[N*N];
            int *A = new int[N];
			int *C = new int[N];
			int *B = new int[N];
                                   
            initalisingM(MA);
            initalisingM(MX);
            initalisingM(MM);
            initalisingM(MC);
			initalisingV(A);
			initalisingV(C);
			initalisingV(B);

			MPI_Send((void*) MM,N*N,MPI_INT,id+1,id+1,MPI_COMM_WORLD);

			MPI_Recv((void*) B,N, MPI_INT, id-1, id, MPI_COMM_WORLD, &status);

			MPI_Recv((void*) MX_in,N*(N-H*(P-1-id)),MPI_INT,id+1,id+1,MPI_COMM_WORLD,&status);
			MPI_Recv((void*) MC_in,N*(N-H*(P-1-id)),MPI_INT,id+1,id+1,MPI_COMM_WORLD,&status);
			int k = 0;
			for(int i = 0  ; i < H*id*N ; i++){
                MX_out[i] = MX_in[i];
				MC_out[i] = MC_in[i];
			}
            k = 0;
            for(int i = H*id*N ; i < H*(id+1)*N ; i++){
                MX[k] = MX_in[i];
				MC[k] = MC_in[i];
                k++;
            }

			MPI_Send((void*) MX_out,N*(N - H*(P-id)),MPI_INT,id-1,id,MPI_COMM_WORLD);
			MPI_Send((void*) MC_out,N*(N - H*(P-id)),MPI_INT,id-1,id,MPI_COMM_WORLD);

			Calc1(C, B, MX);

			int *aBuff = new int[N];
			initalisingV(aBuff);
			MPI_Recv(aBuff,H*(P-1-id),MPI_INT,id+1,id+1,MPI_COMM_WORLD,&status);

			int *A_OUT = new int[N];
			initalisingV(A_OUT);
			for(int i =0; i<H; i++)
				A_OUT[i] = C[i];

			for(int i =H; i<(H*(P-id)) ; i++)
				A_OUT[i] = aBuff[i-H];


			MPI_Send(A_OUT,H*(P-id),MPI_INT,id-1,id,MPI_COMM_WORLD);

			MPI_Recv((void*) C,N, MPI_INT, id-1, id, MPI_COMM_WORLD, &status);

			Calc2(A, C, MM, MC);

			int *aBuff1 = new int[N];
			initalisingV(aBuff1);
			MPI_Recv(aBuff1,H*(P-1-id),MPI_INT,id+1,id+1,MPI_COMM_WORLD,&status);

			int *A_OUT1 = new int[N];
			initalisingV(A_OUT1);
			for(int i =0 ; i<H; i++)
				A_OUT1[i] = A[i];

			for(int i =H; i<H*(P-id); i++)
				A_OUT1[i] = aBuff1[i-H];


			MPI_Send(A_OUT1,H*(P-id),MPI_INT,id-1,id,MPI_COMM_WORLD);

			cout<<" Task"<<id<<" finish"<<endl;

		}
		break;
	}
	MPI_Finalize();
	return 0;
}