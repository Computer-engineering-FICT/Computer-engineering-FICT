#pragma once
#include <mpi.h>

#pragma comment(lib, "mpi.lib")
class fully_connected1
{
public:
	fully_connected1(int tid, int p, int h);
	void run();
private:
	int TID, H, P, N, L;	
	int *MA;
	int *MB;
	int *MC;
	MPI_Status status;
};
