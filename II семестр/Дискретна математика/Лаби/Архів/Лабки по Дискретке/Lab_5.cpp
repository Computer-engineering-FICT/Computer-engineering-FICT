#include<iostream>
#include<fstream>
#include<iomanip>
#include<stdio.h>
#include<conio.h>
using namespace std;
FILE*f;
int m, n;
char filename[15];
void OpenFile()
{
	puts("enter filename");
	cin >> filename;
	f = fopen(filename, "r");
	fscanf(f, "%d%d", &n, &m);
	if (f != NULL)
		puts("Ok");
	else
		cout << "file not find..." << endl;
	cout << "Enter any key to contunie..." << endl;
	_getch();
	fclose(f);
}
void Read(int * A, int * B, int**D)
{
	f = fopen(filename, "r");
	for (int i = 0; i<m; i++)
	{
		fscanf(f, "%d%d", &A[i], &B[i]);
	}
	int p = 0;
	int z = 0;
	for (int i = 0; i<n; i++)
	{
		for (int j = 0; j<n; j++)
		{
			D[i][j] = 0;
		}
	}
	for (int i = 0; i<m; i++)
	{
		p = A[i];
		z = B[i];
		D[p - 1][z - 1] = D[p - 1][z - 1] + 1;
	}
	fclose(f);
}
void DFSR(int i, bool*flag, int&lable, int*top, int**D)
{
	flag[i] = true;
	for (int j = 0; j<n; j++) //������ ������� �������
	{
		if (D[i][j]>0 && flag[j] == false) //���� ������� ������ � �� ���������
		{
			DFSR(j, flag, lable, top, D);
		}
	}
	top[i] = lable;
	lable--;
}
void TopSort(int**D)
{
	bool * flag = new bool[n]; //����� �������� ������
	for (int i = 0; i<n; i++)  //��������� �� ������� �� ����������
		flag[i] = false;
	int * top = new int[n];  //����� top ������
	int k = 1, v; //����
	int lable = n;
	for (int i = 0; i<n; i++)
	{
		if (!flag[i])
			DFSR(i, flag, lable, top, D);
	}
	cout << "Topologic sort: " << endl;
	int numb = 1;
	for (int z = 0; z<n; z++)
	{
		for (int j = 0; j<n; j++)
		{
			if (top[j] == numb)
			{
				cout << j + 1 << " ";
				numb++;
			}
		}
	}
	cout << endl;
	_getch();
}
void main()
{
	
	OpenFile();
	int*A = new int[m];
	int*B = new int[m];
	int ** D = new int*[n];
	for (int i = 0; i<n; i++)
	{
		D[i] = new int[n];
	}
	Read(A, B, D);
	TopSort(D);
	system("pause");
}

