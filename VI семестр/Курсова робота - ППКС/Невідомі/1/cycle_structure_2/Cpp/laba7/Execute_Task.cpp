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
	mid = p/2;
	if (TID<mid) {
		L = p-mid-tid;
	}
	else {
		L = TID-mid+1;
	}

	// Initialization of arrays	
	MB = reinterpret_cast<int*>(malloc(N*N*sizeof(int)));
	MZ = reinterpret_cast<int*>(malloc(N*N*sizeof(int)));
	MC = reinterpret_cast<int*>(malloc(L*H*N*sizeof(int)));
	MA = reinterpret_cast<int*>(malloc(L*H*N*sizeof(int)));
	MT = reinterpret_cast<int*>(malloc(L*H*N*sizeof(int)));
	MCFull = reinterpret_cast<int*>(malloc(N*N*sizeof(int)));
	MAFull = reinterpret_cast<int*>(malloc(N*N*sizeof(int)));
}

//--------------------------------------------------------------
void Execute_Task::run(){
	cout << "Task " << TID << " Started\n";
	if (TID<mid) {

		if (TID==0) {
			// input MB, MZ, MC
			int value=1;
			for (int i=0; i<N; i++){
				for(int j=0; j<N; j++){	
					*(MB+i*N+j)=value;
					*(MZ+i*N+j)=value;
					*(MCFull+i*N+j)=value;
				}
			}

			for (int i=0; i<L*H; i++){
				for(int j=0; j<N; j++){	
					*(MC+i*N+j)=*(MCFull+i*N+j);
				}
			}

			MPI_Send(reinterpret_cast<void*>((long)MB), N*N, MPI_INT, (P-1), 0, MPI_COMM_WORLD);
			MPI_Send(reinterpret_cast<void*>((long)MZ), N*N, MPI_INT, (P-1), 0, MPI_COMM_WORLD);
			MPI_Send(reinterpret_cast<void*>((long)MCFull), (P-mid)*H*N, MPI_INT, (P-1), 0, MPI_COMM_WORLD);
		}
	
		if (TID!=0) {
			MPI_Recv(MB, N*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD, &status);
			MPI_Recv(MZ, N*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD, &status);
			MPI_Recv(MC, L*H*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD, &status);
		}

		if (TID!=P-mid-1) {  
			// send to ÒID+1 MB, MZ, MC
			MPI_Send(reinterpret_cast<void*>((long)MB), N*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD);
			MPI_Send(reinterpret_cast<void*>((long)MZ), N*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD);
			MPI_Send(reinterpret_cast<void*>((long)MC), (L-1)*H*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD);
		}

		// calc
		for (int i=0; i<H; i++){
			for(int j=0; j<N; j++){
	   			*(MT+i*N+j)=0;
				for(int k=0; k<N; k++){
					 *(MT+i*N+j)=*(MT+i*N+j)+(*(MC+i*N+k))*(*(MZ+k*N+j));				 	  
				}
		    }
		}

		for (int i=0; i<H; i++){
			for(int j=0; j<N; j++){
	   			*(MA+i*N+j)=0;
				for(int k=0; k<N; k++){
					 *(MA+i*N+j)=*(MA+i*N+j)+(*(MT+i*N+k))*(*(MB+k*N+j));				 	  
				}
		    }
		}

		if (TID!=P-mid-1){
			MPI_Recv(reinterpret_cast<void*>((long)MA+H*N*sizeof(int)), (L-1)*H*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD, &status);	
		}

		if (TID!=0){          
			MPI_Send(reinterpret_cast<void*>((long)MA), L*H*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD);
		}

		if (TID==0) {

			for (int i=0; i<L*H; i++){
				for(int j=0; j<N; j++){	
					*(MAFull+i*N+j)=*(MA+i*N+j);
				}
			}

			MPI_Recv(reinterpret_cast<void*>((long)MAFull+mid*H*N*sizeof(int)), (P-mid)*H*N, MPI_INT, (P-1), 0, MPI_COMM_WORLD, &status);	
			
			// output MA
			cout <<"Result: " <<"\n";
			for (int i=0; i<N; i++){
				for(int j=0; j<N; j++){			
					cout <<*(MAFull+i*N+j)<< " ";
				}	
				cout << "\n";
			}
		}
	}
	else {
		if (TID==P-1) {
			MPI_Recv(MB, N*N, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
			MPI_Recv(MZ, N*N, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
			MPI_Recv(MC, (P-mid)*H*N, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		}
	
		if (TID!=P-1) {
			MPI_Recv(MB, N*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD, &status);
			MPI_Recv(MZ, N*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD, &status);
			MPI_Recv(MC, L*H*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD, &status);
		}

		if (TID!=P-mid) {  
			// send to ÒID-1 MB, MZ, MC
			MPI_Send(reinterpret_cast<void*>((long)MB), N*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD);
			MPI_Send(reinterpret_cast<void*>((long)MZ), N*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD);
			MPI_Send(reinterpret_cast<void*>((long)MC), (L-1)*H*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD);
		}

		// calc
		for (int i=0; i<H; i++){
			for(int j=0; j<N; j++){
	   			*(MT+i*N+j)=0;
				for(int k=0; k<N; k++){
					 *(MT+i*N+j)=*(MT+i*N+j)+(*(MC+i*N+k))*(*(MZ+k*N+j));				 	  
				}
		    }
		}	   

		for (int i=0; i<H; i++){
			for(int j=0; j<N; j++){
	   			*(MA+i*N+j)=0;
				for(int k=0; k<N; k++){
					 *(MA+i*N+j)=*(MA+i*N+j)+(*(MT+i*N+k))*(*(MB+k*N+j));				 	  
				}
		    }
		}

		if (TID!=P-mid){
			MPI_Recv(reinterpret_cast<void*>((long)MA+H*N*sizeof(int)), (L-1)*H*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD, &status);	
		}

		if (TID!=P-1){          
			MPI_Send(reinterpret_cast<void*>((long)MA), L*H*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD);
		}

		if (TID==P-1){
			MPI_Send(reinterpret_cast<void*>((long)MA), (P-mid)*H*N, MPI_INT, 0, 0, MPI_COMM_WORLD);
		}
	}

	cout << "Task " << TID << " Finished\n";
}
Execute_Task::~Execute_Task(void)
{
}


