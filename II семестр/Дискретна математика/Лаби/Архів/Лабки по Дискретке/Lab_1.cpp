// Laba_Discr.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include<iostream>
#include<vector>
#include <iomanip>
#include<fstream>

using namespace std;

int matrSm[100][100];
int matrIn[100][100];

int main()
{
	setlocale(LC_ALL, "russian");
	ifstream in("input.txt");
	ofstream out("output.txt");
	int m, n;
	in >> n >> m;
	int tmp1, tmp2;
	vector < vector<int> > g(n + 1);
	for (int i = 0;i < m;i++)
	{
		in >> tmp1 >> tmp2;
		g[tmp1].push_back(tmp2);
	}
	for (int i = 1;i <= n;i++)
	{
		for (int j = 0;j < g[i].size();j++)
		{
			matrSm[i][g[i][j]] = 1;
		}
	}
	cout<<"Матрица смежности : \n";
	for (int i = 1;i <= n;i++)
	{
		for (int j = 1;j <= n;j++)
			cout << matrSm[i][j] << " ";
		cout << endl;
	}
	cout << "Матрица инцидентности: \n";
	int u = 0;
	for (int i = 1;i <= n;i++)
	{
		for (int j = 0;j < g[i].size();j++)
		{
			u++;
			if(g[i][j] == i)
			{
				matrIn[i][u] = 2;
			}
			else{
			matrIn[i][u] = -1;
			matrIn[g[i][j]][u] = 1;
			}
		}
	}
	for (int i = 1;i <= n;i++)
	{
		for (int j = 1;j <= m;j++)
			cout <<setw(2)<< matrIn[i][j] << " ";
		cout << endl;
	}
	system("pause");
	return 0;
}