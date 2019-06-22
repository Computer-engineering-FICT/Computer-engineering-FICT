// Лаба_1.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <stdio.h>
#include <iostream>

using namespace std;



int main()
{
	double a, b;
	double c;

	cout << "Enter first catet: " << endl;
	cin >> a;
	cout << "Enter second catet: " << endl;
	cin >> b;

	c = (a*b) / 2;
	
	cout << "Area: "<< c << endl;
	system("pause");
    return 0;
}

