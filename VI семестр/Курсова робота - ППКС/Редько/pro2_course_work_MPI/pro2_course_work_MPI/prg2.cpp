/**
 * -------------------------------------------------------------------------
 *                 Паралельні та розподілені обчислення
 *                Курсова робота. ПРГ2. Бібліотека MPI
 *
 * Завдання: MA = max(MT)*ME + alpha*MD*MC
 *
 * Виконав: Редько Олександр Михайлович
 * Група: ІО-01
 * Дата: 16.04.13
 * --------------------------------------------------------------------------
 */

#include <iostream>
#include <fstream>
#include <mpi.h>
#include <Windows.h>
#include "matrix.h"
#include "operations.h"

using namespace std;

const size_t T1 = 0;
const size_t T2 = 1;
const size_t T3 = 2;	
const size_t T4 = 3;
const size_t T5 = 4;
const size_t T6 = 5;

size_t N;
size_t P;
size_t H;

Matrix *MA;
Matrix *MC;
Matrix *MD;
Matrix *ME;
Matrix *MT;

int maxMT = INT_MIN;
int alpha;
char* fileName;

LARGE_INTEGER performanceFrequency;
LARGE_INTEGER startTime;
LARGE_INTEGER endTime;


int main(int args, char* argv[]) {
	
	fileName = argv[1];
	N = atoi(argv[2]);
	P = atoi(argv[3]);
	H = N / P;

	MPI_Init(&args, &argv);
	int rank, size;
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	size_t	sizeMa = 0,
			sizeMe = 0,
			sizeMtd = 0;

	switch (rank) {
		case T1:
			sizeMa = H;
			sizeMe = 3 * H;
			sizeMtd = H;
			break;
		case T2:
			sizeMa = H;
			sizeMe = 2 * H;
			sizeMtd = 3 * H;
			break;
		case T3:
			sizeMa = H;
			sizeMe = H;
			sizeMtd = H;
			break;
		case T4:
			sizeMa = 2 * H;
			sizeMe = H;
			sizeMtd = H;
			break;
		case T5:
			sizeMa = 4 * H;
			sizeMe = 2 * H;
			sizeMtd = N;
			break;
		case T6:
			sizeMa = N;
			sizeMe = N;
			sizeMtd = H;
			break;
	}

	void * alphaPtr = &alpha;
	void * maxMtPtr = &maxMT;
	int maxMtBuf;
	void *maxMtBufPtr = &maxMtBuf;

	MA = new Matrix(sizeMa, N);
	MC = new Matrix(N);
	MD = new Matrix(sizeMtd, N);
	ME = new Matrix(sizeMe, N);
	MT = new Matrix(sizeMtd, N);

	if(rank == T6) {
		QueryPerformanceFrequency(&performanceFrequency);
		QueryPerformanceCounter(&startTime);
	}

	cout << "Task " << rank + 1 << " started" << endl;

	MPI_Status stat;
	switch (rank) {
		case T1:
			//1
			//2
			MPI_Recv(ME->get(0), ME->rows*ME->cols, MPI_INT, T6, 0, MPI_COMM_WORLD, &stat);
			//3
			MPI_Recv(MT->get(0), MT->rows*MT->cols, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(MD->get(0), MD->rows*MD->cols, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			//4
			//5
			MPI_Send(ME->get(H * N), 2 * H * N, MPI_INT, T2, 0, MPI_COMM_WORLD);
			//6
			//7
			//8
			MPI_Recv(MC->get(0), MC->rows*MC->cols, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(alphaPtr, 1, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			//9
			maxMT = maxValue(*MT, 0, H);
			//10
			MPI_Recv(maxMtBufPtr, 1, MPI_INT, T6, 0, MPI_COMM_WORLD, &stat);
			//11
			maxMT = max(maxMT, maxMtBuf);
			//12
			MPI_Send(maxMtPtr, 1, MPI_INT, T2, 0, MPI_COMM_WORLD);
			//13
			//14
			//15
			//16
			MPI_Recv(maxMtPtr, 1, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			//17
			//18
			MPI_Send(maxMtPtr, 1, MPI_INT, T6, 0, MPI_COMM_WORLD);
			//19
			calculation(maxMT, alpha, *MC, *MD, *ME, H, 0, 0, 0, *MA);
			//20
			MPI_Send(MA->get(0), H * N, MPI_INT, T6, 0, MPI_COMM_WORLD);
			break;
		case T2:
			//1
			//2
			MPI_Recv(MT->get(0), MT->rows*MT->cols, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(MD->get(0), MD->rows*MD->cols, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			//3
			MPI_Send(MT->get(0), H * N, MPI_INT, T1, 0, MPI_COMM_WORLD);
			MPI_Send(MD->get(0), H * N, MPI_INT, T1, 0, MPI_COMM_WORLD);
			//4
			MPI_Send(MT->get(2 * H * N), H * N, MPI_INT, T3, 0, MPI_COMM_WORLD);
			MPI_Send(MD->get(2 * H * N), H * N, MPI_INT, T3, 0, MPI_COMM_WORLD);
			//5
			MPI_Recv(ME->get(0), ME->rows*ME->cols, MPI_INT, T1, 0, MPI_COMM_WORLD, &stat);
			//6
			MPI_Send(ME->get(H * N), H * N, MPI_INT, T3, 0, MPI_COMM_WORLD);
			//7
			MPI_Recv(MC->get(0), MC->rows*MC->cols, MPI_INT, T3, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(alphaPtr, 1, MPI_INT, T3, 0, MPI_COMM_WORLD, &stat);
			//8
			MPI_Send(MC->get(0), N * N, MPI_INT, T1, 0, MPI_COMM_WORLD);
			MPI_Send(alphaPtr, 1, MPI_INT, T1, 0, MPI_COMM_WORLD);
			//9
			maxMT = maxValue(*MT, H, 2 * H);
			//10
			MPI_Recv(maxMtBufPtr, 1, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			//11
			maxMT = max(maxMT, maxMtBuf);
			//12
			MPI_Recv(maxMtBufPtr, 1, MPI_INT, T1, 0, MPI_COMM_WORLD, &stat);
			//13
			maxMT = max(maxMT, maxMtBuf);
			//14
			MPI_Recv(maxMtBufPtr, 1, MPI_INT, T3, 0, MPI_COMM_WORLD, &stat);
			//15
			maxMT = max(maxMT, maxMtBuf);
			//16
			MPI_Send(maxMtPtr, 1, MPI_INT, T1, 0, MPI_COMM_WORLD);
			//17
			MPI_Send(maxMtPtr, 1, MPI_INT, T3, 0, MPI_COMM_WORLD);
			//18
			MPI_Send(maxMtPtr, 1, MPI_INT, T5, 0, MPI_COMM_WORLD);
			//19
			calculation(maxMT, alpha, *MC, *MD, *ME, H, 0, H, 0, *MA);
			//20
			MPI_Send(MA->get(0), H * N, MPI_INT, T5, 0, MPI_COMM_WORLD);
			break;
		case T3:
			//2
			MPI_Recv(MC->get(0), MC->rows*MC->cols, MPI_INT, T4, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(alphaPtr, 1, MPI_INT, T4, 0, MPI_COMM_WORLD, &stat);
			//3
			//4
			MPI_Recv(MT->get(0), MT->rows*MT->cols, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(MD->get(0), MD->rows*MD->cols, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			//5
			//6
			MPI_Recv(ME->get(0), ME->rows*ME->cols, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			//7
			MPI_Send(MC->get(0), N * N, MPI_INT, T2, 0, MPI_COMM_WORLD);
			MPI_Send(alphaPtr, 1, MPI_INT, T2, 0, MPI_COMM_WORLD);
			//8
			//9
			maxMT = maxValue(*MT, 0, H);
			//10
			MPI_Recv(maxMtBufPtr, 1, MPI_INT, T4, 0, MPI_COMM_WORLD, &stat);
			//11
			maxMT = max(maxMT, maxMtBuf);
			//12
			//13
			//14
			//15
			MPI_Send(maxMtPtr, 1, MPI_INT, T2, 0, MPI_COMM_WORLD);
			//16
			//17
			MPI_Recv(maxMtPtr, 1, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			//18
			MPI_Send(maxMtPtr, 1, MPI_INT, T4, 0, MPI_COMM_WORLD);
			//19
			calculation(maxMT, alpha, *MC, *MD, *ME, H, 0, 0, 0, *MA);
			//20
			MPI_Send(MA->get(0), H * N, MPI_INT, T4, 0, MPI_COMM_WORLD);
			break;
		case T4:
			//1
			alpha = 1;
			MC->fill(1);
			//2
			MPI_Send(MC->get(0), N * N, MPI_INT, T3, 0, MPI_COMM_WORLD);
			MPI_Send(alphaPtr, 1, MPI_INT, T3, 0, MPI_COMM_WORLD);
			//3
			//4
			MPI_Recv(MT->get(0), MT->rows*MT->cols, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(MD->get(0), MD->rows*MD->cols, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			//5
			//6
			MPI_Recv(ME->get(0), ME->rows*ME->cols, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			//7
			MPI_Send(MC->get(0), N * N, MPI_INT, T5, 0, MPI_COMM_WORLD);
			MPI_Send(alphaPtr, 1, MPI_INT, T5, 0, MPI_COMM_WORLD);
			//8
			//9
			maxMT = maxValue(*MT, 0, H);
			//10
			MPI_Send(maxMtPtr, 1, MPI_INT, T3, 0, MPI_COMM_WORLD);
			//11
			//12
			//13
			//14
			//15
			//16
			//17
			//18
			MPI_Recv(maxMtPtr, 1, MPI_INT, T3, 0, MPI_COMM_WORLD, &stat);
			//19
			calculation(maxMT, alpha, *MC, *MD, *ME, H, H, 0, 0, *MA);
			//20
			MPI_Recv(MA->get(0), H * N, MPI_INT, T3, 0, MPI_COMM_WORLD, &stat);
			//21
			MPI_Send(MA->get(0), MA->rows*MA->cols, MPI_INT, T5, 0, MPI_COMM_WORLD);
			break;
		case T5:
			//1
			MT->fill(1);
			MD->fill(1);
			//2
			MPI_Send(MT->get(0), 3 * H * N, MPI_INT, T2, 0, MPI_COMM_WORLD);
			MPI_Send(MD->get(0), 3 * H * N, MPI_INT, T2, 0, MPI_COMM_WORLD);
			//3
			MPI_Send(MT->get(5 * H * N), H * N, MPI_INT, T6, 0, MPI_COMM_WORLD);
			MPI_Send(MD->get(5 * H * N), H * N, MPI_INT, T6, 0, MPI_COMM_WORLD);
			//4
			MPI_Send(MT->get(3 * H * N), H * N, MPI_INT, T4, 0, MPI_COMM_WORLD);
			MPI_Send(MD->get(3 * H * N), H * N, MPI_INT, T4, 0, MPI_COMM_WORLD);
			//5
			MPI_Recv(ME->get(0), ME->rows*ME->cols, MPI_INT, T6, 0, MPI_COMM_WORLD, &stat);
			//6
			MPI_Send(ME->get(0), H * N, MPI_INT, T4, 0, MPI_COMM_WORLD);
			//7
			MPI_Recv(MC->get(0), MC->rows*MC->cols, MPI_INT, T4, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(alphaPtr, 1, MPI_INT, T4, 0, MPI_COMM_WORLD, &stat);
			//8
			MPI_Send(MC->get(0), N * N, MPI_INT, T6, 0, MPI_COMM_WORLD);
			MPI_Send(alphaPtr, 1, MPI_INT, T6, 0, MPI_COMM_WORLD);
			//9
			maxMT = maxValue(*MT, 4 * H, N);
			//10
			MPI_Send(maxMtPtr, 1, MPI_INT, T2, 0, MPI_COMM_WORLD);
			//11
			//12
			//13
			//14
			//15
			//16
			//17
			//18
			MPI_Recv(maxMtPtr, 1, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			//19
			calculation(maxMT, alpha, *MC, *MD, *ME, H, 3 * H, 4 * H, H, *MA);
			//20
			MPI_Recv(MA->get(0), H * N, MPI_INT, T2, 0, MPI_COMM_WORLD, &stat);
			//21
			MPI_Recv(MA->get(H * N), 2*H*N, MPI_INT, T4, 0, MPI_COMM_WORLD, &stat);
			//22
			MPI_Send(MA->get(0), MA->rows*MA->cols, MPI_INT, T6, 0, MPI_COMM_WORLD);
			break;
		case T6:
			//1
			ME->fill(1);
			//2
			MPI_Send(ME->get(0), 3 * H * N, MPI_INT, T1, 0, MPI_COMM_WORLD);
			//3
			MPI_Recv(MT->get(0), MT->rows*MT->cols, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(MD->get(0), MD->rows*MD->cols, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			//4
			//5
			MPI_Send(ME->get(3 * H * N), 2 * H * N, MPI_INT, T5, 0, MPI_COMM_WORLD);
			//6
			//7
			//8
			MPI_Recv(MC->get(0), MC->rows*MC->cols, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			MPI_Recv(alphaPtr, 1, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			//9
			maxMT = maxValue(*MT, 0, H);
			//10
			MPI_Send(maxMtPtr, 1, MPI_INT, T1, 0, MPI_COMM_WORLD);
			//11
			//12
			//13
			//14
			//15
			//16
			//17
			//18
			MPI_Recv(maxMtPtr, 1, MPI_INT, T1, 0, MPI_COMM_WORLD, &stat);
			//19
			calculation(maxMT, alpha, *MC, *MD, *ME, H, 5 * H, 0, 5 * H, *MA);
			//20
			MPI_Recv(MA->get(0), H * N, MPI_INT, T1, 0, MPI_COMM_WORLD, &stat);
			//21
			//22
			MPI_Recv(MA->get(H*N), 4*H*N, MPI_INT, T5, 0, MPI_COMM_WORLD, &stat);
			//23
			if(MA->cols < 13) {
				cout << *MA << endl;
			}
			break;
	}

	cout << "Task " << rank + 1 << " finished" << endl;
	
	if(rank == T6) {
		
		QueryPerformanceCounter(&endTime);
		double elapsedTime = ((double) (endTime.QuadPart - startTime.QuadPart))
			/ (double) performanceFrequency.QuadPart;
		cout << "PRG2: computations took " << (int) (elapsedTime * 1000) << " ms" << endl;
		
		ofstream os(fileName, ofstream::out | ofstream::app);
		os << "N: " << N << "\tProcess time: " 
			<< (int)(elapsedTime * 1000) << "\tms ";
		os.close();
		system("pause");
	}
	
	MPI_Finalize();

	return 0;
}