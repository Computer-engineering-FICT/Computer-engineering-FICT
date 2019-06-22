//#include "longop.h"
#include <iostream>
#include <cstdlib>

extern "C" int test(int c);
using namespace std;

int main() {
	int array[2] = {12,13};
	int array2[2] = {-3,5};
	int array3[2];
	int num = 2;
	//addLongop(array3, array2, array, num);
	test(num);
	cout << test(2);
	return 0;
}
