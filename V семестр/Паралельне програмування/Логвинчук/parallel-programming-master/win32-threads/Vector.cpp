#include "Data.h"

#include <iostream>
#include <cstdlib>

using namespace std;

Vector::Vector(int size, bool fill) 
{
	_size = size;
	_data = new int[size];
	if (fill)
		for (int i = 0; i < _size; i++)
			_data[i] = rand() % 100 + 1;
	else 
		for (int i = 0; i < _size; i++)
			_data[i] = 0;
}

Vector::~Vector()
{
	delete[] _data;
}

Vector* Vector::operator+(Vector &that)
{
	Vector* result = new Vector(_size, false);
	for (int i = 0; i < _size; i++)
		result->_data[i] = _data[i] + that._data[i];
	return result;
}

Vector* Vector::sort()
{	
	Vector* result = new Vector(_size, false);
	copy(_data, (int*) _data + _size, result->_data);
	int tmp;
	for (int i = 0; i < _size; i++)
		for (int j = 1; j < _size - i; j++)
			if (result->_data[j - 1] > result->_data[j])
			{
				tmp = result->_data[j - 1];
				result->_data[j - 1] = result->_data[j];
				result->_data[j] = tmp;
			}
	return result;
}

void Vector::setElement(int index, int value)
{
	_data[index] = value;
}

void Vector::print()
{
	if (_size < 6)
		for (int i = 0; i < _size; i++)
			printf("%6d ", _data[i]);
	else printf("Output is to cumbersome!");
	printf("\n");
}

int Vector::operator*(Vector &that)
{
	int result = 0;
	for (int i = 0; i < _size; i++)
		result += _data[i] * that._data[i];
	return result;
}

int Vector::getElement(int index)
{
	return _data[index];
}

int Vector::max()
{
	int max = 0;
	for (int i = 0; i < _size; i++)
		if (_data[i] > max)
			max = _data[i];
	return max;
}





