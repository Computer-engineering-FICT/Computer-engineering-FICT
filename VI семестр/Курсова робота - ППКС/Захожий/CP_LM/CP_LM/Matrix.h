#pragma once

#include "Vector.h"

class Matrix
{

public:
	Matrix(int N);
	Matrix(int H, int N);
	~Matrix(void);
	int getRowCount();
	int getColCount();
	int getSize();
	long get(int i, int j);
	void set(int i, int j, long e);
	void fillWithOnes();
	void writeToBufer(long* buf);
	void readFromBufer(long* buf);
	void writeToFile(char fileName[]);

private:
	vector<Vector> m;

};