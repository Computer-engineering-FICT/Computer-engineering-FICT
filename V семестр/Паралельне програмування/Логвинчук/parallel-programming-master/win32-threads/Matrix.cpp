#include "Data.h"

#include <iostream>
#include <cstdlib>

using namespace std;

Matrix::Matrix(int size, bool fill)
{
	_size = size;
	_data = new int*[size];
	for (int i = 0; i < size; i++)
		_data[i] = new int[size];

	if (fill)
		for (int i = 0; i < size; i++)
			for (int j = 0; j < size; j++)
				_data[i][j] = rand() % 100 + 1;
		
	else 
		for (int i = 0; i < size; i++)
			for (int j = 0; j < size; j++)
				_data[i][j] = 0;
}

Matrix::~Matrix()
{
	for (int i = 0; i < _size; i++)
		delete[] _data[i];
	delete[] _data;
}

Matrix* Matrix::operator+(Matrix &that)
{
	Matrix* result = new Matrix(_size, false);
	for (int i = 0; i < _size; i++)
		for (int j = 0; j < _size; j++)
			result->_data[i][j] = _data[i][j] + that._data[i][j];
	return result;
}

Matrix* Matrix::operator*(Matrix &that)
{
	Matrix* result = new Matrix(_size, false);
	for (int i = 0; i < _size; i++)
		for (int j = 0; j < _size; j++)
			for (int k = 0; k < _size; k++)
				result->_data[i][j] += _data[i][k] * that._data[k][j];
	return result;
}

Vector* Matrix::operator*(Vector &that)
{
	Vector* result = new Vector(_size, false);
	for (int i = 0; i < _size; i++)
		for (int j = 0; j < _size; j++)
			result->setElement(i, result-> getElement(i) + _data[i][j] * that.getElement(i));
	return result;
}

Matrix* Matrix::sort()
{
	Matrix* result = new Matrix(_size, false);
	copy(_data, (int**)_data + _size, result->_data);
	int tmp;
	for (int i = 0; i < _size; i++)
		for (int j = 1; j < _size - i; j++)
			if (result->_data[j - 1][0] > result->_data[j][0])
			{
				tmp = result->_data[j - 1][0];
				result->_data[j - 1][0] = result->_data[j][0];
				result->_data[j][0] = tmp;
			}
	return result;
}

Matrix* Matrix::transpose()
{
	Matrix* result = new Matrix(_size, false);
	for (int i = 0; i < _size; i++)
		for (int j = 0; j < _size; j++)
			result->_data[i][j] = _data[j][i];
	return result;
}

void Matrix::print()
{
	if (_size < 6)
		for (int i = 0; i < _size; i++)
		{
			for (int j = 0; j < _size; j++)
				printf("%6d ", _data[i][j]);
			printf("\n");
		}
	else
		printf("Output is to cumbersome!\n");
}
