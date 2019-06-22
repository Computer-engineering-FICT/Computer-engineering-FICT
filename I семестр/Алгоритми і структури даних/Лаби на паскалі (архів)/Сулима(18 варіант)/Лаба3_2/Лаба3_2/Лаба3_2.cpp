// Лаба3_2.cpp: определяет точку входа для консольного приложения.
//


#include "stdafx.h" 
#include "iostream" 
#include <math.h>
#include <conio.h>


using namespace std;

long double fact(int N)
{
	if (N < 0)
		return 0;
	if (N == 0)
		return 1;
	else
		return N * fact(N - 1);
}



int main()
{
	long double  a, q = 1, sum = 0;
	float x;

	cout << "Enter x = ";
	cin >> x;

	while (q<12)
	{
		a = pow(x, q) / fact(2 * q);
		//cout << "a("<< q <<") = " << a << endl;

		printf(" % 10.5f \n", a);

		q += 1;
		sum += a;
	}
	cout << endl;
	cout << "Your sum: " << sum << endl;

	system("pause");
	return 0;
}





