#include "StdAfx.h"
#include "Matrix.h"
#include <fstream>
#include <new>

Matrix::Matrix(int N)
{
	for (int i = 0; i < N; i++)
	{
		m.push_back(Vector(N));
	}
}

Matrix::Matrix(int H, int N)
{
	for (int i = 0; i < H; i++)
	{
		m.push_back(Vector(N));
	}
}

Matrix::~Matrix(void)
{
	m.~vector();
}

int Matrix::getRowCount()
{
	return m.size();
}

int Matrix::getColCount()
{
	return m[0].getSize();
}

int Matrix::getSize()
{
	return (getRowCount() * getColCount());
}

long Matrix::get(int i, int j)
{
	return m[i].get(j);
}

void Matrix::set(int i, int j, long e)
{
	m[i].set(j, e);
}

void Matrix::fillWithOnes()
{
	for (size_t i = 0; i < m.size(); i++)
	{
		m[i].fillWithOnes();
	}
}

void Matrix::writeToBufer(long* buf)
{
	int k = 0;
	for (int i = 0; i < this->getRowCount(); i++)
	{
		for (int j = 0; j < this->getColCount(); j++)
		{
			buf[k] = this->get(i, j);
			k++;
		}
	}
}

void Matrix::readFromBufer(long* buf)
{
	int k = 0;
	for (int i = 0; i < this->getRowCount(); i++)
	{
		for (int j = 0; j < this->getColCount(); j++)
		{
			this->set(i, j, buf[k]);
			k++;
		}
	}
}

void Matrix::writeToFile(char fileName[])
{
	ofstream outFile(fileName);
	for (size_t i = 0; i < m.size(); i++)
	{
		for (size_t j = 0; j < m[i].getSize(); j++)
		{
			outFile << m[i].get(j) << "	";
		}
		outFile << endl;
	}
	outFile.close();
}