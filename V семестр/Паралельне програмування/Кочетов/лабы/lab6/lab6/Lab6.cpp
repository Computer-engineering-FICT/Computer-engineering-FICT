#include <mpi.h>
#include <iostream>
#include <string>
#include "F1.h"
#include "F2.h"
#include "F3.h"

const int N = 300;

int main(int argc, char* argv[]) {
	MPI_Init(&argc, &argv);
	int id;
	MPI_Comm_rank(MPI_COMM_WORLD, &id);
	F1 f1 = F1(N);
	F2 f2 = F2(N);
	F3 f3 = F3(N);
	switch (id) {
	case 0:
		f1.run();
		break;
	case 1:
		f2.run();
		break;
	case 2:
		f3.run();
		break;
	}
	string t;
	getline(cin, t);
	MPI_Finalize();
}