// Лаба3_3.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h" 
#include "iostream" 
#include <math.h>
#include <conio.h>

using namespace std;


int main()
{
	int n;
	int res=0;
	cout << "Enter n: ";
	cin >> n;
	cout << endl;

	for (int i = 1; i <= n; i++)       //основной цыкл, который проверяет каждое число в диапазоне [1, n]
	{
		cout <<"Number "<< i <<"  :  ";

		for (int j = 1; j <= i; j++)    //цыкл, который проходит по каждому делителю
		{
			if (i%j==0)
			{
				cout << j << "; ";
				res += j;
			}
		}
		cout << endl;
		cout << "Sum: "<< res;
		res = 0;
		cout << endl;
	}



	cout << endl;
	system("pause");
    return 0;
}

