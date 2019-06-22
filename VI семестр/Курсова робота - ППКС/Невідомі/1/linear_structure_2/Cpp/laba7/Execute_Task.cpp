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

	// Initialization of arrays	
	MB = reinterpret_cast<int*>(malloc(N*N*sizeof(int)));
	MZ = reinterpret_cast<int*>(malloc(N*N*sizeof(int)));
	MC = reinterpret_cast<int*>(malloc((P-TID)*H*N*sizeof(int)));
	MA = reinterpret_cast<int*>(malloc((P-TID)*H*N*sizeof(int)));
	MT = reinterpret_cast<int*>(malloc((P-TID)*H*N*sizeof(int)));
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
			   *(MZ+i*N+j)=value;
			   *(MC+i*N+j)=value;
		    }
		}      	    
    }

	if (TID!=0) {
		MPI_Recv(MB, N*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD, &status);
		MPI_Recv(MZ, N*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD, &status);
		MPI_Recv(MC, (P-TID)*H*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD, &status);
	}

	if (TID!=P-1) {  
		// send to ÒID+1 MB, MZ, MC
		MPI_Send(reinterpret_cast<void*>((long)MB), N*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD);
		MPI_Send(reinterpret_cast<void*>((long)MZ), N*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD);
		MPI_Send(reinterpret_cast<void*>((long)MC), (P-TID-1)*H*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD);
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

	if (TID!=P-1){
		MPI_Recv(reinterpret_cast<void*>((long)MA+H*N*sizeof(int)), (P-TID-1)*H*N, MPI_INT, (TID+1), 0, MPI_COMM_WORLD, &status);	
	}

	if (TID!=0){          
        MPI_Send(reinterpret_cast<void*>((long)MA), (P-TID)*H*N, MPI_INT, (TID-1), 0, MPI_COMM_WORLD);
	}

	if (TID==0) {
		// output MA
        cout <<"Result: " <<"\n";
		for (int i=0; i<N; i++){
		    for(int j=0; j<N; j++){			
               cout <<*(MA+i*N+j)<< " ";
		    }	
            cout << "\n";
		}
	}

	cout << "Task " << TID << " Finished\n";
}
Execute_Task::~Execute_Task(void)
{
}


