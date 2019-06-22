#include "StdAfx.h"
#include "Execute_Task.h"
#include <mpi.h>
#include <string>
#include <iostream>

using namespace std;

Execute_Task::Execute_Task(int tid, int p, int h)
{
	TID = tid;
	P = p;
	H = h;
	N = p*h;
	if (TID==0) {
		L = N;
	}
	else {
		L = H;
	}

	// Initialization of arrays	
	MB = reinterpret_cast<int*>(malloc(N*N*sizeof(int)));
	MC = reinterpret_cast<int*>(malloc(L*N*sizeof(int)));
	MA = reinterpret_cast<int*>(malloc(L*N*sizeof(int)));
}

//--------------------------------------------------------------
void Execute_Task::run(){
	cout << "Task " << TID << " Started\n";
	if (TID==0) {

		// input MB, MC
		int value=1;
		for (int i=0; i<N; i++){
			for(int j=0; j<N; j++){	
				*(MB+i*N+j)=value;
				*(MC+i*N+j)=value;
			}
		}

		for (int i=1; i<P; i++){
			MPI_Send(reinterpret_cast<void*>((long)MB), N*N, MPI_INT, i, 0, MPI_COMM_WORLD);
			MPI_Send(reinterpret_cast<void*>((long)MC), H*N, MPI_INT, i, 0, MPI_COMM_WORLD);
		}
	
		// calc
		for (int i=0; i<H; i++){
			for(int j=0; j<N; j++){
	   			*(MA+i*N+j)=0;
				for(int k=0; k<N; k++){
					 *(MA+i*N+j)=*(MA+i*N+j)+(*(MC+i*N+k))*(*(MB+k*N+j));				 	  
				}
		    }
		}

		for (int i=1; i<P; i++){
			MPI_Recv(reinterpret_cast<void*>((long)MA+i*H*N*sizeof(int)), H*N, MPI_INT, i, 0, MPI_COMM_WORLD, &status);	
		}

		// output MA
		cout <<"Result: " <<"\n";
		for (int i=0; i<N; i++){
			for(int j=0; j<N; j++){			
				cout <<*(MA+i*N+j)<< " ";
			}	
			cout << "\n";
		}
	}
	else {
		MPI_Recv(MB, N*N, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		MPI_Recv(MC, H*N, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);

		// calc
		for (int i=0; i<H; i++){
			for(int j=0; j<N; j++){
	   			*(MA+i*N+j)=0;
				for(int k=0; k<N; k++){
					 *(MA+i*N+j)=*(MA+i*N+j)+(*(MC+i*N+k))*(*(MB+k*N+j));				 	  
				}
		    }
		}	   

		MPI_Send(reinterpret_cast<void*>((long)MA), H*N, MPI_INT, 0, 0, MPI_COMM_WORLD);
	}

	cout << "Task " << TID << " Finished\n";
}
Execute_Task::~Execute_Task(void)
{
}


