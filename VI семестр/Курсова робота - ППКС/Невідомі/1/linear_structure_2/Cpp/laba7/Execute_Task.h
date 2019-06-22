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
	int TID, H, P, N;	
	int *MA;
	int *MB;
	int *MZ;
	int *MC;
	int *MT;
	MPI_Status status;
};
