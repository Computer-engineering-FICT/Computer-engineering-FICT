// Лаба_2.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <stdio.h>
#include <iostream>
#include <math.h>

using namespace std;


int main()
{
	int a1, a2, a3;
	int b1, b2, b3;
	int res1, res2, res3;

	cout << "Enter a-x, a-y, a-z: " << endl;
	cin >> a1 >> a2 >> a3;
	cout << "Enter b-x, b-y, b-z: " << endl;
	cin >> b1 >> b2 >> b3;


	if (a1 != 0 && a2 != 0 && a3 != 0 && b1 != 0 && b2!= 0 && b3 != 0)
	{
		res1 = a1 / b1;
		res2 = a2 / b2;
		res3 = a3 / b3;
	}
	else {
		cout << "Not REALLY" << endl;
		system("pause");
		return 1;  
	}

	if (res1 == res2 && res2 == res3 && res1 == res3)
	{
		cout << "Collinear vectors =)" << endl;
	}
	else if (res1 != res2 || res2 != res3 || res1 != res3)
	{
		cout << "Vector not collinear =(" << endl;
	}
	

	system("pause");
	return 0;
}