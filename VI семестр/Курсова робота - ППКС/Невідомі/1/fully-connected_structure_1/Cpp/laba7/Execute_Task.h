#pragma once
#include <mpi.h>

#pragma comment(lib, "mpi.lib")
class Execute_Task
{
public:
	Execute_Task(int tid, int p, int h);
	void run();
public:
	~Execute_Task(void);
private:
	int TID, H, P, N, L;	
	int *MA;
	int *MB;
	int *MC;
	MPI_Status status;
};
