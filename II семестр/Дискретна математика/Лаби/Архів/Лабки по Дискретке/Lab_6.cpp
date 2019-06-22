
#include "stdafx.h"
#include <stdio.h>
#include <conio.h>
#include <iostream>
#include <vector>

using namespace std;

const int Nmax = 117;
vector<int> g[Nmax];
vector<int> gr[Nmax];
vector <char> visit;
vector<int> order;
vector<int> component;
vector<vector<int>> components;
void dfs1(int v);
void dfs2(int v);
int main()
{
	freopen("input1.txt", "r", stdin);
	//freopen("output1.txt", "w", stdout);
	int n, m;
	cin >> n >> m;
	for (int i = 1; i <= m; i++)
	{
		int u, v;
		cin >> v >> u;
		g[v].push_back(u);
		gr[u].push_back(v);
	}
	visit.assign(n + 1, 0);
	for (int i = 1; i <= n; i++)
	{
		if (!visit[i]) dfs1(i);
	}
	visit.assign(n + 1, 0);
	for (int i = 0; i < n; i++)
	{
		int v = order[n - 1 - i];
		if (!visit[v])
		{
			component.clear();
			dfs2(v);
			components.push_back(component);
		}
	}
	for (int i = 0; i < components.size(); i++)
	{
		cout << "componenta " << i+1 << ": ";
		for (int k = 0; k < components[i].size();k++)
		{
			cout << components[i][k] << " ";
		}
		cout << endl;
	}
	_getch();
	return 0;
}
void dfs1(int v)
{
	visit[v] = 1;
	for (int i = 0; i < g[v].size(); i++)
	{
		if (!visit[g[v][i]]) dfs1(g[v][i]);
	}
	order.push_back(v);
}
void dfs2(int v)
{
	visit[v] = 1;
	component.push_back(v);
	for (int i = 0; i < gr[v].size(); i++)
	{
		if (!visit[gr[v][i]]) dfs2(gr[v][i]);
	}
}