#pragma once
#include <mpi.h>

#pragma comment(lib, "mpi.lib")
class linear1
{
public:
	linear1(int tid, int p, int h);
	void run();
public:
	~linear1(void);
private:
	int TID, H, P, N;	
	int *MA;
	int *MB;
	int *MC;
	MPI_Status status;
};