// ����_3.cpp: ���������� ����� ����� ��� ����������� ����������.
//

#include "stdafx.h"
#include <iostream>
#include <stdio.h>
#include "math.h"

using namespace std;


int main()
{
	setlocale(LC_ALL, "Russian");

	int n;
	double a;
	stop:
	cout << "������� n: " << endl;
	cin >> n;
	if (n <= 0)
	{
		cout << "��� �������� �� ��������, ��� ��� ����� ����������� ������� �� '0'" << endl;
		goto stop;
	}
	else if (n == 1 || n == 2)
	{
		cout << "��� �������� �� ��������, ��� ��� ����� ����������� ������� �� '0' " << endl;
		goto stop;
	}
	cout << "��������� ..." << endl;

	for (int i = 0; i <= n; i++)
	{
		a = ((i - 1.) / (i + 1.)) + sin(((i - 3) ^ 3) / (i + 1.));
		if (a > 0)
		{
			cout << a << endl;
		}
	}

	system("pause");
    return 0;
}

