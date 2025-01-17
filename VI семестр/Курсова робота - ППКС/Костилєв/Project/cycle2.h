#pragma once
#include <mpi.h>

#pragma comment(lib, "mpi.lib")
class cycle2
{
public:
	cycle2(int tid, int p, int h);
	void run();

private:
	int TID, H, P, N, L, mid;	
	int *MA;
	int *MB;
	int *MZ;
	int *MC;
	int *MT;
	int *MAFull;
	int *MCFull;
	MPI_Status status;
};