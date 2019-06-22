#pragma once
#include <mpi.h>

#pragma comment(lib, "mpi.lib")
class cycle1
{
public:
	cycle1(int tid, int p, int h);
	void run();

private:
	int TID, H, P, N, L, mid;	
	int *MA;
	int *MB;
	int *MC;
	int *MAFull;
	int *MCFull;
	MPI_Status status;
};