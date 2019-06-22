#pragma once

#include <string>

class Lab4
{
public:
	static int **MoveL(int matrix[][], int i);
	static int **MoveC(int matrix[][], int j);

	static int getSumL(int i);

	static int getSumC(int j);

	static int getMinL();

	static int getMaxC(int i);

	static int getNext1(int i, int indexJ);

	static bool isConflict();

	static void put1(int i, int j);

	static void init();

	static void main(std::wstring args[]);
	static void print();
private:
	static int N;
	static int count1;
	static int matrix[N][N];
	static double res[N * N][2];
	static int reduced;
};
