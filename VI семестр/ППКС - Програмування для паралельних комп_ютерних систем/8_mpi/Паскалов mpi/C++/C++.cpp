#include "mpi.h"
#include "math.h"
#include <stdio.h>
#include <tchar.h>
#include "stdio.h"
#include "windows.h"
#include <iostream>

#pragma comment(lib, "mpich.lib")

using namespace std; 

#define N 20
#define P 5
const int  H = N / P; 
 

void initalisingM(int *t)
{
	for(int i = 0; i<N; i++)
		for(int j = 0; j<N; j++)
			t[i+N*j] = 0;
}

void InputMatrix(int* matr) 
{
	for(int i =0; i<N*N; i++)
		matr[i] = 1;
}

void OutputMatrix(int *matr)
{
	int count = N;

	for(int i =0 ; i < count*count; i++)
	{
		printf("%d ", matr[i]);
		if(((i+1) % count) == 0 && (i != 0))
			printf("\n");
	}
	printf("\n");
}

void Calc(int *MA, int *MB, int *MC, int *MZ)
{
	int *MA1 = new int[N*N];
	initalisingM(MA1);
	for(int i =0; i < H; i++)
		for(int j = 0; j < N; j++)
			for(int k = 0; k < N; k++)
				MA1[j+N*i] += MZ[k+N*i] *MC[j+N*k];
	
	for(int i =0; i < H; i++)
		for(int j = 0; j < N; j++)
			for(int k = 0; k < N; k++)
				MA[j+N*i] += MA1[j+N*i] *MB[j+N*k];
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
            int *MC = new int[N*N];
            int *MB = new int[N*N];
			int *MZ = new int[N*N];
                                   
            initalisingM(MA);
            initalisingM(MC);
            initalisingM(MZ);
            initalisingM(MB);

			MPI_Recv(MB,N*N,MPI_INT,1,0,MPI_COMM_WORLD,&status);
			MPI_Recv(MZ,H*N,MPI_INT,1,0,MPI_COMM_WORLD,&status);
			MPI_Recv(MC,N*N,MPI_INT,1,0,MPI_COMM_WORLD,&status);

			Calc(MA, MB, MC, MZ);

			MPI_Send((void*) MA,H*N,MPI_INT,1,0,MPI_COMM_WORLD);

			cout<<" Task"<<id<<" finish"<<endl;
		} 
		break;
	case 1:
		{
			cout<<" Task"<<id<<" start"<<endl;
			int *MA = new int[N*N];
			int *MA1 = new int[N*N];
            int *MC = new int[N*N];
            int *MB = new int[N*N];
			int *MZ = new int[N*N];
			int *MZ_O = new int[N*N];
                                   
            initalisingM(MA);
			initalisingM(MA1);
            initalisingM(MC);
            initalisingM(MZ);
            initalisingM(MB);

            InputMatrix(MB);
			InputMatrix(MZ);

			int k = 0;
			for(int i = H*N ; i < 2*H*N ; i++)
			{
				MZ_O[k] = MZ[i];
                k++;
			}

			MPI_Send((void*) MB,N*N,MPI_INT,0,0,MPI_COMM_WORLD);
			MPI_Send((void*) MZ_O,H*N,MPI_INT,0,0,MPI_COMM_WORLD);

			k = 0;
			for(int i = 2*H*N ; i < N*N ; i++)
			{
				MZ_O[k] = MZ[i];
                k++;
			}

			MPI_Send((void*) MB,N*N,MPI_INT,2,0,MPI_COMM_WORLD);
			MPI_Send((void*) MZ_O,3*H*N,MPI_INT,2,0,MPI_COMM_WORLD);

			MPI_Recv(MC,N*N,MPI_INT,2,0,MPI_COMM_WORLD,&status);
			MPI_Send((void*) MC,N*N,MPI_INT,0,0,MPI_COMM_WORLD);

			Calc(MA, MB, MC, MZ);

			MPI_Recv(MA1,H*N,MPI_INT,0,0,MPI_COMM_WORLD,&status);

			k = 0;
			for(int i = H*N ; i < 2*H*N ; i++)
			{
				MA[i] = MA1[k];
                k++;
			}

			MPI_Send((void*) MA,2*H*N,MPI_INT,2,0,MPI_COMM_WORLD);

			cout<<" Task"<<id<<" finish"<<endl;   
		}
		break;
	case 2:
		{
			cout<<" Task"<<id<<" start"<<endl;
			int *MA = new int[N*N];
			int *MA1 = new int[N*N];
            int *MC = new int[N*N];
            int *MB = new int[N*N];
			int *MZ = new int[N*N];
			int *MZ_O = new int[N*N];
                                   
            initalisingM(MA);
			initalisingM(MA1);
            initalisingM(MC);
            initalisingM(MZ);
            initalisingM(MB);

			MPI_Recv(MB,N*N,MPI_INT,1,0,MPI_COMM_WORLD,&status);
			MPI_Recv(MZ,3*H*N,MPI_INT,1,0,MPI_COMM_WORLD,&status);
			
			int k = 0;
			for(int i = H*N ; i < 3*H*N ; i++)
			{
				MZ_O[k] = MZ[i];
                k++;
			}
                                                                      
            MPI_Send((void*) MB,N*N,MPI_INT,3,0,MPI_COMM_WORLD);
			MPI_Send((void*) MZ_O,2*H*N,MPI_INT,3,0,MPI_COMM_WORLD);
			MPI_Recv(MC, N*N,MPI_INT,3,0,MPI_COMM_WORLD,&status);
			MPI_Send((void*) MC,N*N,MPI_INT,1,0,MPI_COMM_WORLD);

			Calc(MA, MB, MC, MZ);

			MPI_Recv(MA1,2*H*N,MPI_INT,1,0,MPI_COMM_WORLD,&status);

			k = 0;
			for(int i = H*N ; i < 3*H*N ; i++)
			{
				MA[i] = MA1[k];
                k++;
			}

			MPI_Send((void*) MA,3*H*N,MPI_INT,3,0,MPI_COMM_WORLD);

			cout<<" Task"<<id<<" finish"<<endl;   
		}
		break;

	case 3:
		{
			cout<<" Task"<<id<<" start"<<endl;
			int *MA = new int[N*N];
			int *MA1 = new int[N*N];
            int *MC = new int[N*N];
            int *MB = new int[N*N];
			int *MZ = new int[N*N];
			int *MZ_O = new int[N*N];
                                   
            initalisingM(MA);
			initalisingM(MA1);
            initalisingM(MC);
            initalisingM(MZ);
            initalisingM(MB);

			InputMatrix(MC);

			MPI_Recv(MB,N*N,MPI_INT,2,0,MPI_COMM_WORLD,&status);
			MPI_Recv(MZ,2*H*N,MPI_INT,2,0,MPI_COMM_WORLD,&status);
			MPI_Send((void*) MC,N*N,MPI_INT,2,0,MPI_COMM_WORLD);

			int k = 0;
			for(int i = H*N ; i < 2*H*N ; i++)
			{
				MZ_O[k] = MZ[i];
                k++;
			}
                                                                      
            MPI_Send((void*) MB,N*N,MPI_INT,4,0,MPI_COMM_WORLD);
			MPI_Send((void*) MZ_O,H*N,MPI_INT,4,0,MPI_COMM_WORLD);
			MPI_Send((void*) MC,N*N,MPI_INT,4,0,MPI_COMM_WORLD);

			Calc(MA, MB, MC, MZ);

			MPI_Recv(MA1,3*H*N,MPI_INT,2,0,MPI_COMM_WORLD,&status);

			k = 0;
			for(int i = H*N ; i < 4*H*N ; i++)
			{
				MA[i] = MA1[k];
                k++;
			}

			MPI_Recv(MA1,H*N,MPI_INT,4,0,MPI_COMM_WORLD,&status);

			k = 0;
			for(int i = 4*H*N ; i < 5*H*N ; i++)
			{
				MA[i] = MA1[k];
                k++;
			}

			OutputMatrix(MA);

			cout<<" Task"<<id<<" finish"<<endl;   
		}
		break;

	case 4:
		{
			cout<<" Task"<<id<<" start"<<endl;
			int *MA = new int[N*N];
            int *MC = new int[N*N];
            int *MB = new int[N*N];
			int *MZ = new int[N*N];
                                   
            initalisingM(MA);
            initalisingM(MC);
            initalisingM(MZ);
            initalisingM(MB);

			MPI_Recv(MB,N*N,MPI_INT,3,0,MPI_COMM_WORLD,&status);
			MPI_Recv(MZ,H*N,MPI_INT,3,0,MPI_COMM_WORLD,&status);
			MPI_Recv(MC, N*N,MPI_INT,3,0,MPI_COMM_WORLD,&status);

			Calc(MA, MB, MC, MZ);

			MPI_Send((void*) MA,H*N,MPI_INT,3,0,MPI_COMM_WORLD);

			cout<<" Task"<<id<<" finish"<<endl;   
		}
		break;
	}
	MPI_Finalize();
	return 0;
}