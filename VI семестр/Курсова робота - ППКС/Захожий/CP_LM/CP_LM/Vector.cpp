#include "stdafx.h"
#include "Vector.h"
#include <fstream>
#include <new>

Vector::Vector(int N)
{
	for (int i = 0; i < N; i++)
	{
		v.push_back(0);
	}
}

Vector::~Vector(void)
{
	v.~vector();
}

size_t Vector::getSize()
{
	return v.size();
}

long Vector::get(int i)
{
	return v[i];
}

void Vector::set(int i, long e)
{
	v[i] = e;
}

void Vector::fillWithOnes()
{
	for (size_t i = 0; i < v.size(); i++)
	{
		v[i] = 1;
	}
}