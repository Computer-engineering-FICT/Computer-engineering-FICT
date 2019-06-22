#include "stdafx.h"
#include "windows.h"
#include "Execute_Task.h"
#include <string>
#include <iostream>
#include <mpi.h>

#pragma comment(lib, "mpi.lib")

using namespace std;

int _tmain(int argc, CHAR* argv[])
{
	int N = 500;
	int P, TID;  

	DWORD dwStartTime = ::GetTickCount();

	MPI_Init (&argc, &argv);
	MPI_Comm_rank (MPI_COMM_WORLD, &TID);
	MPI_Comm_size (MPI_COMM_WORLD, &P);
	int H = N/P;

	Execute_Task Task(TID, P, H);
	Task.run();
	MPI_Finalize();

	DWORD dwStopTime = ::GetTickCount();
    DWORD ms = (dwStopTime-dwStartTime) / P;
    cout <<"Time: "<< ms <<"\n";

	return 0;
}


