#include "stdafx.h"
#include <stdio.h>
#include <locale.h>
#include <algorithm>
#include <vector>
#include <conio.h>
#pragma warning(disable : 4996)

//const int point = 1; // ����� ��� ��� ���������� ����� � �������� 3
const int Nmax = 1e2 + 17; // ������������ ����� �����, ����������� �� �������
const int inf = 1e3; // ���������� �������

int g_s[Nmax][Nmax] = { 0 }; // ������� ��������
bool arr[Nmax] = { 0 }; // ³����� �������
std::vector <int> way; // �������

void output1(int&); // ���� �������� 1
void output2(int&); // ���� �������� 2
void output3(int&); // ���� �������� 3
void copy(int*, int*, int&); // ����� ������ � � ������� �
void floid(int[Nmax][Nmax], int&); // �������� ������-�������
void dfs(int, int&); // ����� � ������� (����� ����)
void printf(); // ��������� �����

int main(void)
{
	setlocale(LC_CTYPE, "RUSSIAN");

	freopen("input.txt", "r", stdin);
	//freopen("output.txt", "w", stdout);

	int m; // ʳ������ �����
	int n; // ʳ������ ������
	int v, u; // �������

	scanf("%d%d", &n, &m);
	for (int i = 1; i <= m; i++)
	{
		scanf("%d%d", &v, &u);

		g_s[v][u] = 1;
	}

	output1(n);
	output2(n);
	output3(n);
	_getch();
}

void copy(int* a, int* b, int& n)
{
	for (int i = 1; i <= n; i++)
		for (int z = 1; z <= n; z++)
			*(a + i*Nmax + z) = *(b + i*Nmax + z);
}

void floid(int mas[Nmax][Nmax], int& n)
{
	for (int i = 1; i <= n; i++)
		for (int z = 1; z <= n; z++)
			if (i == z) mas[i][z] = 0;
			else if (mas[i][z] == 0) mas[i][z] = -1;

			for (int i = 1; i <= n; i++)
				for (int z = 1; z <= n; z++)
					for (int k = 1; k <= n; k++)
						if (mas[i][k] != -1 && mas[k][z] != -1)
							if (mas[i][z] == -1) mas[i][z] = mas[i][k] + mas[k][z];
							else mas[i][z] = std::min(mas[i][z], mas[i][k] + mas[k][z]);
}

void output1(int& n)
{
	int g[Nmax][Nmax];
	copy(&g[0][0], &g_s[0][0], n);

	floid(g, n);

	printf("������� �i�������:\n%3s", "");
	for (int i = 1; i <= n; i++) printf("%4d", i);
	printf("\n");

	for (int i = 1; i <= n; i++, printf("\n"))
	{
		printf("%-3d", i);
		for (int z = 1; z <= n; z++)
			if (g[i][z] != -1) printf("%4d", g[i][z]);
			else printf(" NaN");
	}

	printf("\n\n������� ���������i:\n%3s", "");
	for (int i = 1; i <= n; i++) printf("%4d", i);
	printf("\n");

	for (int i = 1; i <= n; i++, printf("\n"))
	{
		printf("%-3d", i);
		for (int z = 1; z <= n; z++)
			if (i == z) printf("%4d", 1);
			else if (g[i][z] != -1) printf("%4d", 1);
			else printf(" NaN");
	}
}

void output2(int& n)
{
	for (int i = 1; i <= n; i++)
	{
		printf("\n\n�����, �� ������������� � ������� %d:\n", i);

		for (int i = 1; i <= n; i++) arr[i] = 0;
		way.clear();

		dfs(i, n);
	}
}

void output3(int& n)
{
	printf("\n");

	int g[Nmax][Nmax];
	copy(&g[0][0], &g_s[0][0], n);

	floid(g, n);

	char f = 1;
	for (int i = 1; i<n; i++)
		for (int z = 1; z <= n; z++)
			if (g[i][z] == -1)
			{
				f = 0;
				break;
			}

	if (f)
	{
		printf("���� �������������.\n");
		return;
	}

	f = 2;
	for (int i = 1; i <= n; i++)
		for (int z = i; z <= n; z++)
			if (g[i][z] == -1)
			{
				f--; break;
			}

	for (int i = 1; i <= n; i++)
		for (int z = 1; z <= i; z++)
			if (g[i][z] == -1)
			{
				f--;
				break;
			}

	if (f) printf("���� �����i����������.\n");

	copy(&g[0][0], &g_s[0][0], n);

	for (int i = 1; i <= n; i++)
		for (int z = 1; z <= n; z++)
			if (g[i][z]) g[z][i] = 1;

	floid(g, n);

	f = 1;
	for (int i = 1; i<n; i++)
		for (int z = 1; z <= n; z++)
			if (g[i][z] == -1)
			{
				f = 0;
				break;
			}

	if (f) printf("���� �����������.\n");
}

void printf(void)
{
	int n = way.size();
	for (int i = 0; i<n; i++) printf("%3d", way[i]);
	printf("\n");
}

void dfs(int v, int& n)
{
	way.push_back(v);
	if (v == way[0] && way.size() != 1) printf();
	else for (int i = 1; i <= n; i++)
		if (!arr[i] && g_s[v][i])
		{
			arr[i] = 1;
			dfs(i, n);
			arr[i] = 0;
		}

	way.pop_back();
}
