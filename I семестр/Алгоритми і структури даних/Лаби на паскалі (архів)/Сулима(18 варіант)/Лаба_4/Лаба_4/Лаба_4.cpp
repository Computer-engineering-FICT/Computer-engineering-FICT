// Лаба_4.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <iostream>

using namespace std;


int Res(int res)
{
	int k, m, z;
	for (int i = res; i <= (2 * res); i++)           //берет каждое число с промежутка
	{
		k = 0;
		for (int q = 1; q <= i; q++)                 //каждое выбранное число проверяет на делители
		{
			if (i%q == 0) k += 1;
		}
		if ((k == 2) || (k == 1))     //выведет только простые числа
		{
			for (int t = res; t <= (2 * res); t++)
			{
				m = 0;
				for (int r = 1; r <= t; r++)
				{
					if (t%r == 0) m += 1;
				}
				if ((m == 2) || (m == 1))
				{
					if ((i - t) == 2)
					{
						cout << i << " ^^ " << t << endl;
					}
				}
			}
		}
	}
	return res;
}


int main()
{
	int n;
	cout << "Enter n: " << endl;
	cin >> n;
	if (n <= 0)
	{
		cout << "Error!" << endl;
		system("pause");
		return 1;
	}
	Res(n);

	system("pause");
	return 0;
}