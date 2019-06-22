#include <iostream>
#include "longop.h"

using namespace std;

int main() {
	unsigned int a[24];
	unsigned int b[24];
	unsigned int c[24];
	unsigned int oneMinusA[25];
	unsigned int bPlusC[25];
	unsigned int result[50];
	char resultHex[500];
	char resultDec[800];

	unsigned int var1[2] = {0x144, 0x324};
	unsigned int var2[1] = {2};
	//unsigned int result[2];
	char text_buffer[50];

	fill_n(oneMinusA, 25, 0);
	fill_n(bPlusC, 25, 0);
	fill_n(result, 50, 0);

	unsigned int one[24];
	fill_n(one, 23, 0);
	one[23] = 1;
	/*fill_n(a, 23, 0);
	fill_n(b, 23, 0);
	fill_n(c, 23, 0);
	a[23] = 0;
	b[23] = 0xf;
	c[23] = 1;*/
	unsigned int var = 0x80000000;
	for (int i = 0; i < 24; i++) {
		a[i] = var;
		b[i] = 0x80000000;
		c[i] = 0xffffffff;
		var += 0x00001000;
	}
	
	subLongop(oneMinusA, a, one, 24);	//oneMinusA = 1 - a
	addLongop(bPlusC, c, b, 24);
	mulN_x_N(result, bPlusC, oneMinusA, 25);
	//for (int i = 0; i < 50; i++)
	//	cout << hex << result[i];
	
	strHex(resultHex, result, 50);
	cout << endl << "(1-A)(B+C) = " << resultHex << endl;
	//subLongop(result, var2, var1, 1);		result = var1 - var2
    
	fill_n(text_buffer, 50, 0);

	//strDec(50, resultDec, result);
	//cout << endl << "(1-A)(B+C) = " << resultDec << endl;
	return 0;
}
