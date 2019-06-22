#include<iostream>
#include<fstream>
#include<stdio.h>
#include<stdlib.h>
#include<iomanip>
#include <iterator>
#include<list>
#include<stack>
#include<string>
#include<conio.h>
#include<cstring>
using namespace std;
fstream File;
int n, k1, V, mark[25];

typedef int Matrix[25][25];
Matrix S; //матриця суміжності

string s;

void Output(Matrix, int, int);  // виводить матрицю
void matrix_sm(Matrix);  // будує матрицю суміжності
void DFS(int, int[]);
void BFS(int, int[]);
void method1();
void method2();

int main()
{

	int k, m;
	setlocale(LC_ALL, "Ukr");
	//system("color F0");
	File.open("C:\\Users\\user\\Desktop\\граф4.txt");
	if (File)
	{
		File >> n >> m;
		File.close();
	}
	else cout << "Не удалось открыть файл";

	matrix_sm(S);

	cout << "Введите номер вершины с которой начать обход: "; cin >> V;
	method1();
	method2();
	//BFS(0, mark);


	system("pause");
}


void matrix_sm(Matrix A)
{
	int n, m, v, u;
	File.open("C:\\Users\\user\\Desktop\\граф4.txt");
	if (File)
	{
		File >> n >> m;
		for (int i = 0; i < m; i++)
		{
			File >> v >> u;
			A[v - 1][u - 1] = 1;
			//	A[u - 1][v - 1] = 1; //v
		}
		File.close();
	}
	else cout << "Не удалось открыть файл";
}


void Output(Matrix A, int n, int m)
{
	cout << "     ";
	for (int i = 0; i < m; i++)
		printf("%-3d", i + 1);
	cout << endl;

	for (int i = 0; i < n; i++)
	{
		printf("\n%-3d", i + 1);

		for (int j = 0; j < m; j++)
			if (A[i][j] == 99) cout << " " << "oo"; else printf("%3d", A[i][j]);
	}
}


void DFS(int v, int mark[25])
{
	mark[v] = 1;
	s = s + char(v + 49);
	cout << right << setw(4) << v + 1 << setw(15) << k1 << setw(18) << s << endl;

	for (int i = 0; i < n; i++)
		if (S[v][i] == 1 && mark[i] != 1) { k1++;  DFS(i, mark); }
	s.erase(s.length() - 1, 1);
	cout << right << setw(4) << "-" << setw(15) << "-" << setw(18) << s << endl;

}
void method1()
{
	int v;
	for (int i = 0; i < n; i++)
		mark[i] = 0;
	cout << "Поиск в глубину" << endl;

	cout << left << setw(14) << "Вершина" << setw(17) << "DFS-номер" << "Стек" << endl;
	v = V;
	v--;
	mark[v] = 1;
	k1 = 1;
	DFS(v, mark);

}

void BFS(int v, int mark[25])
{
	s = s + char(v + 49);

	mark[v] = 1;
	cout << right << setw(4) << v + 1 << setw(15) << k1 << setw(18) << s << endl;
	while (s.length())
	{
		for (int i = 0; i < n; i++)
			if (S[v][i] == 1 && mark[i] == 0) {
				s = s + char(i + 49); mark[i] = 1; k1++;
				cout << right << setw(4) << i + 1 << setw(15) << k1 << setw(18) << s << endl;
			}

		s = s.substr(1, s.length() - 1);
		cout << right << setw(4) << '-' << setw(15) << '-' << setw(18) << s << endl;
		v = int(s[0])-49 ;
	}
}

void method2()
{
	int v = V;
	for (int i = 0; i < n; i++)
		mark[i] = 0;
	cout << endl << "Поиск в ширину" << endl;
	cout << left << setw(14) << "Вершина" << setw(17) << "BFS-номер" << "Очередь" << endl;
	v--;
	mark[v] = 1;
	k1 = 1;

	BFS(v, mark);
}

