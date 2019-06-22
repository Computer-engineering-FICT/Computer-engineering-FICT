#pragma once

#include <vector>

using namespace std;

class Vector
{

public:
	Vector(int N);
	~Vector(void);
	size_t getSize();
	long get(int i);
	void set(int i, long e);
	void fillWithOnes();

private:
	vector<long> v;

};