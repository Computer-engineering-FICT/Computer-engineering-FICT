#include <stdafx.h>

using namespace std;

DWORD ms;

int P, TID, H, N;
int dims[] = {800, 1200, 1400, 1800};
int i = 0;

void run_cycle1();
void run_cycle2();

void run_linear1();

void run_fully1();

int _tmain(int argc, CHAR* argv[])
{
	MPI_Init (&argc, &argv);
	MPI_Comm_rank (MPI_COMM_WORLD, &TID);
	MPI_Comm_size (MPI_COMM_WORLD, &P);

	run_cycle1();
	run_cycle2();

	run_linear1();
	
	run_fully1();

	MPI_Finalize();
	return 0;
}

void run_cycle1() {
	if (TID == 0) {
		cout << "*** Cycled structure, function F1 ***\n\n";
		cout.flush();
	}

	for (i = 0; i < 4; i++) {
		N = dims[i];
		H = N/P;

		if (TID == 0) {
			cout << "Starting calc. for N = " << N << "\n";
			cout.flush();
		}

		MPI_Barrier(MPI_COMM_WORLD);

		if (TID == 0)
			ms = ::GetTickCount();

		cycle1 Task(TID, P, H);
		Task.run();

		MPI_Barrier(MPI_COMM_WORLD);

		if (TID == 0) {
			ms = ::GetTickCount() - ms;
			ms /= P;

			cout << "Execution time for N = " << N << " is "<< ms << " ms\n\n";
			cout.flush();
		}
	}
}

void run_cycle2() {
	if (TID == 0) {
		cout << "\n\n*** Cycled structure, function F2 ***\n\n";
		cout.flush();
	}

	MPI_Barrier(MPI_COMM_WORLD);

	for (i = 0; i < 4; i++) {
		N = dims[i];
		H = N/P;

		if (TID == 0) {
			cout << "Starting calc. for N = " << N << "\n";
			cout.flush();
		}

		MPI_Barrier(MPI_COMM_WORLD);

		if (TID == 0)
			ms = ::GetTickCount();

		cycle2 Task(TID, P, H);
		Task.run();

		MPI_Barrier(MPI_COMM_WORLD);

		if (TID == 0) {
			ms = ::GetTickCount() - ms;
			ms /= P;

			cout << "Execution time for N = " << N << " is "<< ms << " ms\n\n";
			cout.flush();
		}
	}
}
void run_linear1() {
	if (TID == 0) {
		cout << "\n\n*** Linear structure, function F1 ***\n\n";
		cout.flush();
	}

	MPI_Barrier(MPI_COMM_WORLD);

	for (i = 0; i < 4; i++) {
		N = dims[i];
		H = N/P;

		if (TID == 0) {
			cout << "Starting calc. for N = " << N << "\n";
			cout.flush();
		}

		MPI_Barrier(MPI_COMM_WORLD);

		if (TID == 0)
			ms = ::GetTickCount();

		linear1 Task(TID, P, H);
		Task.run();

		MPI_Barrier(MPI_COMM_WORLD);

		if (TID == 0) {
			ms = ::GetTickCount() - ms;
			ms /= P;

			cout << "Execution time for N = " << N << " is "<< ms << " ms\n\n";
			cout.flush();
		}
	}
}
void run_fully1() {
	if (TID == 0) {
		cout << "\n\n*** Fully-connected structure, function F1 ***\n\n";
		cout.flush();
	}

	MPI_Barrier(MPI_COMM_WORLD);

	for (i = 0; i < 4; i++) {
		N = dims[i];
		H = N/P;

		if (TID == 0) {
			cout << "Starting calc. for N = " << N << "\n";
			cout.flush();
		}

		MPI_Barrier(MPI_COMM_WORLD);

		if (TID == 0)
			ms = ::GetTickCount();

		fully_connected1 Task(TID, P, H);
		Task.run();

		MPI_Barrier(MPI_COMM_WORLD);

		if (TID == 0) {
			ms = ::GetTickCount() - ms;
			ms /= P;

			cout << "Execution time for N = " << N << " is "<< ms << " ms\n\n";
			cout.flush();
		}
	}
}