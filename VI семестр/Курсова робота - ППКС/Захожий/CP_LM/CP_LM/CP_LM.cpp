/*********************************
 *            ПРО-2              *
 * Курсовая работа. Система с ЛП *
 * MA = (MX * MC) * ME - MM * MD *
 *  Захожий Игорь, группа ИВ-73  *
 *          07.05.2010           *
 *********************************/

#include "stdafx.h"
#include <iostream>
#include <stdlib.h>
#include "mpi.h"
#include "Matrix.h"

using namespace std;

int N = 8;
int P;
int H;

Matrix multiplyMatrixesH(Matrix MM1, Matrix MM2, int Hfrom, int Hto)
{
    Matrix result(Hto - Hfrom, MM2.getColCount());
    for (int i = 0; i < result.getRowCount(); i++)
	{
        for (int j = 0; j < result.getColCount(); j++) 
		{
            for (int k = 0; k < MM1.getColCount(); k++) 
			{
                result.set(i, j,
                        result.get(i, j) + MM1.get(i + Hfrom, k) * MM2.get(k, j));
            }
        }
    }
    return result;
}

void T0(int Tid)
{
	MPI_Status status;
	Matrix MA(N);
	Matrix MX(N);
	Matrix MC(N);
	Matrix ME(N);
	Matrix MM(N);
	Matrix MD(N);
	MX.fillWithOnes();
	MC.fillWithOnes();
	ME.fillWithOnes();
	MM.fillWithOnes();
	MD.fillWithOnes();
	int buf1Size = MC.getSize() + ME.getSize() + MD.getSize();
	long* buf1 = new long[buf1Size];
	MC.writeToBufer(buf1);
	long* ptr = (long*) ((size_t) buf1 + MC.getSize() * sizeof(long));
	ME.writeToBufer(ptr);
	ptr = (long*) ((size_t) ptr + ME.getSize() * sizeof(long));
	MD.writeToBufer(ptr);
	ptr = (long*) ((size_t) ptr + MD.getSize() * sizeof(long));
	int buf2Size;
	long* buf2;
	int Trec = P / 2;
	int prevTrec = P;
	while (Trec >= 4)
	{
		buf2Size = (MX.getColCount() + MM.getColCount()) * H * (prevTrec - Trec);
		buf2 = new long[buf2Size];
		ptr = buf2;
		for (int i = H * Trec; i < (prevTrec * H); i++)
		{
			for (int j = 0; j < MX.getColCount(); j++)
			{
				*ptr = MX.get(i, j);
				ptr = (long*) ((size_t) ptr + sizeof(long));
			}
		}
		for (int i = H * Trec; i < (prevTrec * H); i++)
		{
			for (int j = 0; j < MM.getColCount(); j++)
			{
				*ptr = MM.get(i, j);
				ptr = (long*) ((size_t) ptr + sizeof(long));
			}
		}
		MPI_Send((void*) buf1, buf1Size, MPI_LONG, Trec, Trec, MPI_COMM_WORLD);
		MPI_Send((void*) buf2, buf2Size, MPI_LONG, Trec, Trec, MPI_COMM_WORLD);
		delete[] buf2;
		prevTrec = Trec;
		Trec /= 2;
	}
	buf2Size = (MX.getColCount() + MM.getColCount()) * H * 2;
	buf2 = new long[buf2Size];
	ptr = buf2;
	for (int i = H; i < (3 * H); i++)
	{
		for (int j = 0; j < MX.getColCount(); j++)
		{
			*ptr = MX.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	for (int i = H; i < (3 * H); i++)
	{
		for (int j = 0; j < MM.getColCount(); j++)
		{
			*ptr = MM.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	MPI_Send((void*) buf1, buf1Size, MPI_LONG, 1, 1, MPI_COMM_WORLD);
	MPI_Send((void*) buf2, buf2Size, MPI_LONG, 1, 1, MPI_COMM_WORLD);
	delete[] buf2;
	buf2Size = (MX.getColCount() + MM.getColCount()) * H;
	buf2 = new long[buf2Size];
	ptr = buf2;
	for (int i = 3 * H; i < (4 * H); i++)
	{
		for (int j = 0; j < MX.getColCount(); j++)
		{
			*ptr = MX.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	for (int i = 3 * H; i < (4 * H); i++)
	{
		for (int j = 0; j < MM.getColCount(); j++)
		{
			*ptr = MM.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	MPI_Send((void*) buf1, buf1Size, MPI_LONG, 3, 3, MPI_COMM_WORLD);
	MPI_Send((void*) buf2, buf2Size, MPI_LONG, 3, 3, MPI_COMM_WORLD);
	delete[] buf1;
	delete[] buf2;
	cout << "Thread T" << (Tid + 1) << " has begun to calculate the function." << endl;
	Matrix temp1 = multiplyMatrixesH(multiplyMatrixesH(MX, MC, 0, H),
                  ME, 0, H);
    Matrix temp2 = multiplyMatrixesH(MM, MD, 0, H);
    for (int i = 0; i < H; i++) 
	{
        for (int j = 0; j < MA.getColCount(); j++) 
		{
            MA.set(i, j, temp1.get(i, j) - temp2.get(i, j));
        }
    }
	cout << "Thread T" << (Tid + 1) << " has ended to calculate the function." << endl;
	buf1Size = MA.getColCount() * H;
	buf1 = new long[buf1Size];
	MPI_Recv((void*) buf1, buf1Size, MPI_LONG, 3, Tid, MPI_COMM_WORLD, &status);
	ptr = buf1;
	for (int i = 3 * H; i < (4 * H); i++)
	{
		for (int j = 0; j < MA.getColCount(); j++)
		{
			MA.set(i, j, *ptr);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	delete[] buf1;
	buf1Size = MA.getColCount() * 2 * H;
	buf1 = new long[buf1Size];
	MPI_Recv((void*) buf1, buf1Size, MPI_LONG, 1, Tid, MPI_COMM_WORLD, &status);
	ptr = buf1;
	for (int i = H; i < (3 * H); i++)
	{
		for (int j = 0; j < MA.getColCount(); j++)
		{
			MA.set(i, j, *ptr);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	delete[] buf1;
	int Tsend = P / 2;
	int prevTsend = P;
	while (Tsend >= 4)
	{
		buf1Size = MA.getColCount() * H * (prevTsend - Tsend);
		buf1 = new long[buf1Size];
		MPI_Recv((void*) buf1, buf1Size, MPI_LONG, Tsend, Tid, MPI_COMM_WORLD, &status);
		ptr = buf1;
		for (int i = Tsend * H; i < (prevTsend * H); i++)
		{
			for (int j = 0; j < MA.getColCount(); j++)
			{
				MA.set(i, j, *ptr);
				ptr = (long*) ((size_t) ptr + sizeof(long));
			}
		}
		delete[] buf1;
		prevTsend = Tsend;
		Tsend /= 2;
	}
	MA.writeToFile("MA.txt");
}

void T0i(int Tid)
{
	MPI_Status status;
	int Tprev = Tid;
	int divider = 2;
	int temp = P / divider;
	while (temp != Tid)
	{
		temp += (P / divider);
		if (temp >= P)
		{
			divider *= 2;
			temp = P / divider;
		}
	}
	int prevDivider = divider / 2;
	temp = 0;
	while (temp < Tid)
	{
		temp += (P / prevDivider);
	}
	temp -= (P / prevDivider);
	Tprev = temp;
	Matrix MA((P / divider) * H, N);
	Matrix MX((P / divider) * H, N);
	Matrix MC(N);
	Matrix ME(N);
	Matrix MM((P / divider) * H, N);
	Matrix MD(N);
	long* ptr;
	int buf1Size = MC.getSize() + ME.getSize() + MD.getSize();
	long* buf1 = new long[buf1Size];
	int buf2Size = MX.getSize() + MM.getSize();
	long* buf2 = new long[buf2Size];
	MPI_Recv((void*) buf1, buf1Size, MPI_LONG, Tprev, Tid, MPI_COMM_WORLD, &status);
	MPI_Recv((void*) buf2, buf2Size, MPI_LONG, Tprev, Tid, MPI_COMM_WORLD, &status);
	MC.readFromBufer(buf1);
	ptr = (long*) ((size_t) buf1 + MC.getSize() * sizeof(long));
	ME.readFromBufer(ptr);
	ptr = (long*) ((size_t) ptr + ME.getSize() * sizeof(long));
	MD.readFromBufer(ptr);
	MX.readFromBufer(buf2);
	ptr = (long*) ((size_t) buf2 + MX.getSize() * sizeof(long));
	MM.readFromBufer(ptr);
	delete[] buf2;
	int nextDivider = divider * 2;
	int Trec = Tid + (P / nextDivider);
	while ((P / nextDivider) >= 4)
	{
		buf2Size = (MX.getColCount() + MM.getColCount()) * H * (P / nextDivider);
		buf2 = new long[buf2Size];
		ptr = buf2;
		for (int i = H * (Trec - Tid); i < ((Trec - Tid + P / nextDivider) * H); i++)
		{
			for (int j = 0; j < MX.getColCount(); j++)
			{
				*ptr = MX.get(i, j);
				ptr = (long*) ((size_t) ptr + sizeof(long));
			}
		}
		for (int i = H * (Trec - Tid); i < ((Trec - Tid + P / nextDivider) * H); i++)
		{
			for (int j = 0; j < MM.getColCount(); j++)
			{
				*ptr = MM.get(i, j);
				ptr = (long*) ((size_t) ptr + sizeof(long));
			}
		}
		MPI_Send((void*) buf1, buf1Size, MPI_LONG, Trec, Trec, MPI_COMM_WORLD);
		MPI_Send((void*) buf2, buf2Size, MPI_LONG, Trec, Trec, MPI_COMM_WORLD);
		delete[] buf2;
		nextDivider *= 2;
		Trec = Tid + (P / nextDivider);
	}
	buf2Size = (MX.getColCount() + MM.getColCount()) * H * 2;
	buf2 = new long[buf2Size];
	ptr = buf2;
	for (int i = H; i < (3 * H); i++)
	{
		for (int j = 0; j < MX.getColCount(); j++)
		{
			*ptr = MX.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	for (int i = H; i < (3 * H); i++)
	{
		for (int j = 0; j < MM.getColCount(); j++)
		{
			*ptr = MM.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	MPI_Send((void*) buf1, buf1Size, MPI_LONG, (Tid + 1), (Tid + 1), MPI_COMM_WORLD);
	MPI_Send((void*) buf2, buf2Size, MPI_LONG, (Tid + 1), (Tid + 1), MPI_COMM_WORLD);
	delete[] buf2;
	buf2Size = (MX.getColCount() + MM.getColCount()) * H;
	buf2 = new long[buf2Size];
	ptr = buf2;
	for (int i = 3 * H; i < (4 * H); i++)
	{
		for (int j = 0; j < MX.getColCount(); j++)
		{
			*ptr = MX.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	for (int i = 3 * H; i < (4 * H); i++)
	{
		for (int j = 0; j < MM.getColCount(); j++)
		{
			*ptr = MM.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	MPI_Send((void*) buf1, buf1Size, MPI_LONG, (Tid + 3), (Tid + 3), MPI_COMM_WORLD);
	MPI_Send((void*) buf2, buf2Size, MPI_LONG, (Tid + 3), (Tid + 3), MPI_COMM_WORLD);
	delete[] buf1;
	delete[] buf2;
	cout << "Thread T" << (Tid + 1) << " has begun to calculate the function." << endl;
	Matrix temp1 = multiplyMatrixesH(multiplyMatrixesH(MX, MC, 0, H),
                  ME, 0, H);
    Matrix temp2 = multiplyMatrixesH(MM, MD, 0, H);
    for (int i = 0; i < H; i++) 
	{
        for (int j = 0; j < MA.getColCount(); j++) 
		{
            MA.set(i, j, temp1.get(i, j) - temp2.get(i, j));
        }
    }
	cout << "Thread T" << (Tid + 1) << " has ended to calculate the function." << endl;
	buf1Size = MA.getColCount() * H;
	buf1 = new long[buf1Size];
	MPI_Recv((void*) buf1, buf1Size, MPI_LONG, (Tid + 3), Tid, MPI_COMM_WORLD, &status);
	ptr = buf1;
	for (int i = 3 * H; i < (4 * H); i++)
	{
		for (int j = 0; j < MA.getColCount(); j++)
		{
			MA.set(i, j, *ptr);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	delete[] buf1;
	buf1Size = MA.getColCount() * 2 * H;
	buf1 = new long[buf1Size];
	MPI_Recv((void*) buf1, buf1Size, MPI_LONG, (Tid + 1), Tid, MPI_COMM_WORLD, &status);
	ptr = buf1;
	for (int i = H; i < (3 * H); i++)
	{
		for (int j = 0; j < MA.getColCount(); j++)
		{
			MA.set(i, j, *ptr);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	delete[] buf1;
	nextDivider = divider * 2;
	int Tsend = Tid + (P / nextDivider);
	while ((P / nextDivider) >= 4)
	{
		buf1Size = MA.getColCount() * H * (P / nextDivider);
		buf1 = new long[buf1Size];
		MPI_Recv((void*) buf1, buf1Size, MPI_LONG, Tsend, Tid, MPI_COMM_WORLD, &status);
		ptr = buf1;
		for (int i = H * (Tsend - Tid); i < ((Tsend - Tid + P / nextDivider) * H); i++)
		{
			for (int j = 0; j < MA.getColCount(); j++)
			{
				MA.set(i, j, *ptr);
				ptr = (long*) ((size_t) ptr + sizeof(long));
			}
		}
		delete[] buf1;
		nextDivider *= 2;
		Tsend = Tid + (P / nextDivider);
	}
	buf1Size = MA.getSize();
	buf1 = new long[buf1Size];
	MA.writeToBufer(buf1);
	MPI_Send((void*) buf1, buf1Size, MPI_LONG, Tprev, Tprev, MPI_COMM_WORLD);
}

void T2i3i(int Tid)
{
	MPI_Status status;
	Matrix MA(H, N);
	Matrix MX(H, N);
	Matrix MC(N);
	Matrix ME(N);
	Matrix MM(H, N);
	Matrix MD(N);
	long* ptr;
	int buf1Size = MC.getSize() + ME.getSize() + MD.getSize();
	long* buf1 = new long[buf1Size];
	int buf2Size = MX.getSize() + MM.getSize();
	long* buf2 = new long[buf2Size];
	int Tsend;
	if ((Tid % 4) == 2)
	{
		Tsend = Tid - 1;
	}
	else
	{
		Tsend = Tid - 3;
	}
	MPI_Recv((void*) buf1, buf1Size, MPI_LONG, Tsend, Tid, MPI_COMM_WORLD, &status);
	MPI_Recv((void*) buf2, buf2Size, MPI_LONG, Tsend, Tid, MPI_COMM_WORLD, &status);
	MC.readFromBufer(buf1);
	ptr = (long*) ((size_t) buf1 + MC.getSize() * sizeof(long));
	ME.readFromBufer(ptr);
	ptr = (long*) ((size_t) ptr + ME.getSize() * sizeof(long));
	MD.readFromBufer(ptr);
	delete[] buf1;
	MX.readFromBufer(buf2);
	ptr = (long*) ((size_t) buf2 + MX.getSize() * sizeof(long));
	MM.readFromBufer(ptr);
	delete[] buf2;
	cout << "Thread T" << (Tid + 1) << " has begun to calculate the function." << endl;
	Matrix temp1 = multiplyMatrixesH(multiplyMatrixesH(MX, MC, 0, H),
                  ME, 0, H);
    Matrix temp2 = multiplyMatrixesH(MM, MD, 0, H);
	for (int i = 0; i < MA.getRowCount(); i++) 
	{
        for (int j = 0; j < MA.getColCount(); j++) 
		{
            MA.set(i, j, temp1.get(i, j) - temp2.get(i, j));
        }
    }
	cout << "Thread T" << (Tid + 1) << " has ended to calculate the function." << endl;
	buf1Size = MA.getSize();
	buf1 = new long[buf1Size];
	MA.writeToBufer(buf1);
	MPI_Send((void*) buf1, buf1Size, MPI_LONG, Tsend, Tsend, MPI_COMM_WORLD);
}

void T1i(int Tid)
{
	MPI_Status status;
	Matrix MA(2 * H, N);
	Matrix MX(2 * H, N);
	Matrix MC(N);
	Matrix ME(N);
	Matrix MM(2 * H, N);
	Matrix MD(N);
	long* ptr;
	int buf1Size = MC.getSize() + ME.getSize() + MD.getSize();
	long* buf1 = new long[buf1Size];
	int buf2Size = MX.getSize() + MM.getSize();
	long* buf2 = new long[buf2Size];
	MPI_Recv((void*) buf1, buf1Size, MPI_LONG, (Tid - 1), Tid, MPI_COMM_WORLD, &status);
	MPI_Recv((void*) buf2, buf2Size, MPI_LONG, (Tid - 1), Tid, MPI_COMM_WORLD, &status);
	MPI_Send((void*) buf1, buf1Size, MPI_LONG, (Tid + 1), (Tid + 1), MPI_COMM_WORLD);
	MC.readFromBufer(buf1);
	ptr = (long*) ((size_t) buf1 + MC.getSize() * sizeof(long));
	ME.readFromBufer(ptr);
	ptr = (long*) ((size_t) ptr + ME.getSize() * sizeof(long));
	MD.readFromBufer(ptr);
	delete[] buf1;
	MX.readFromBufer(buf2);
	ptr = (long*) ((size_t) buf2 + MX.getSize() * sizeof(long));
	MM.readFromBufer(ptr);
	delete[] buf2;
	buf2Size = H * (MX.getColCount() + MM.getColCount());
	buf2 = new long[buf2Size];
	ptr = buf2;
	for (int i = H; i < MX.getRowCount(); i++)
	{
		for (int j = 0; j < MX.getColCount(); j++)
		{
			*ptr = MX.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	for (int i = H; i < MM.getRowCount(); i++)
	{
		for (int j = 0; j < MM.getColCount(); j++)
		{
			*ptr = MM.get(i, j);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	MPI_Send((void*) buf2, buf2Size, MPI_LONG, (Tid + 1), (Tid + 1), MPI_COMM_WORLD);
	delete[] buf2;
	cout << "Thread T" << (Tid + 1) << " has begun to calculate the function." << endl;
	Matrix temp1 = multiplyMatrixesH(multiplyMatrixesH(MX, MC, 0, H),
                  ME, 0, H);
    Matrix temp2 = multiplyMatrixesH(MM, MD, 0, H);
	for (int i = 0; i < H; i++) 
	{
        for (int j = 0; j < MA.getColCount(); j++) 
		{
            MA.set(i, j, temp1.get(i, j) - temp2.get(i, j));
        }
    }
	cout << "Thread T" << (Tid + 1) << " has ended to calculate the function." << endl;
	buf1Size = H * MA.getColCount();
	buf1 = new long[buf1Size];
	MPI_Recv((void*) buf1, buf1Size, MPI_LONG, (Tid + 1), Tid, MPI_COMM_WORLD, &status);
	ptr = buf1;
	for (int i = H; i < (MA.getRowCount()); i++)
	{
		for (int j = 0; j < MA.getColCount(); j++)
		{
			MA.set(i, j, *ptr);
			ptr = (long*) ((size_t) ptr + sizeof(long));
		}
	}
	delete[] buf1;
	buf1Size = MA.getSize();
	buf1 = new long[buf1Size];
	MA.writeToBufer(buf1);
	MPI_Send((void*) buf1, buf1Size, MPI_LONG, (Tid - 1), (Tid - 1), MPI_COMM_WORLD);
}

int main(int argc, char *argv[])
{
	int Tid;
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &Tid);
	MPI_Comm_size(MPI_COMM_WORLD, &P);
	H = N / P;
	cout << "Thread T" << (Tid + 1) << " has started." << endl;
	if (Tid == 0)
	{
		T0(Tid);
	}
	else
	{
		if ((Tid % 4) == 0)
		{
			T0i(Tid);
		}
		else
		{
			if (((Tid % 4) == 2) || ((Tid % 4) == 3))
			{
				T2i3i(Tid);
			}
			else
			{
				T1i(Tid);
			}
		}
	}
	cout << "Thread T" << (Tid + 1) << " has finished." << endl;
	return 0;
}