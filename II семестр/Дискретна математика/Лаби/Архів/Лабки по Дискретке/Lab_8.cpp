// Diskretka 8.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <fstream>
#include <iostream>

void Choose();
void Route();
void Distance();
int Search(int, int);
void Min(int);
int Rout(int, int, int, int);
void Perev();
int Searchh(int, int, int);
//int Check(int, int, int);

int Per[20];
int f = 0;
int A[20];
int m, n;//number of vertices and edges
int Sum[20][20];
int Dis[20];
int Mas[20][3];//array of relations
float ver=-100;

using namespace std;

int main(){
	ifstream in("Graph.txt");
	ofstream out("output.txt");
	in >> m >> n;
	for (int i = 0; i < n; i++)
		for (int j = 0; j < 3; j++)
			in >> Mas[i][j];
		//Check(0, 0, 0);
		//int Dis[20];
	for (int i = 0; i < n; i++)
		Sum[Mas[i][0] - 1][Mas[i][1] - 1] = 1;
	Perev();
	Choose();
	return 0;
}
void Choose(){
	cout << "Choose variant:" << endl;
	cout << "1 - the shortest route between two vertices and its length" << endl;
	cout << "2 - the shortest distance from a given vertex to all other vertices" << endl;
	float c;
	cin >> c;
	system("cls");
	if (c == 1)
		Route();
	else if (c == 2)
		Distance();
}
void Route(){
	float second;
	cout << "Input two vertices:";
	cin >> ver >> second;
	if (ver<1 || ver> m || second <1 || second > m || floor(ver) != ver || floor(second) != second){
		cout << "Incorrect data" << endl;
		Route();
	}
	else{
		int t = second;
		Search(ver - 1, -1);
		cout << "Length: " << Dis[t - 1] << endl;
		int g = Dis[t - 1];
		if (g == 0)
			cout << "There isn`t route" << endl;
		else{
			for (int i = 0; i < m; i++)
				Dis[i] = 0;
			Rout(ver - 1, -1, t, g);
			cout << "Route: " << ver;
			for (int h = f - 1; h >= 0; h--)
				cout << "-" << A[h];
			for (int i = f - 1; i >= 0; i--)
				A[i] = 0;
			f = 0;
			cout << endl;
		}
		system("pause");
		for (int i = 0; i < m; i++)
			Dis[i] = 0;
		Choose();
	}
}
void Distance(){
	cout << "Input vertix: ";
	cin >> ver;
	if (floor(ver) != ver || ver<1 || ver>m){
		cout << "Incorrect data" << endl;
		Distance();
	}
	else{
		Search(ver - 1, -1);
		Min(ver);
	}
}
int Search(int ver1, int ver2){
	for (int i = 0; i < m; i++){
		if (Sum[ver1][i] == 1){
			if (i == ver - 1 || ver2 == i) continue;
			for (int j = 0; j < n; j++)
			if (Mas[j][0] == ver1 + 1 && Mas[j][1] == i + 1)
			if (Dis[i] != 0 && Dis[i] <= Dis[ver1] + Mas[j][2]) break;
			else{
				Dis[i] = Dis[ver1] + Mas[j][2];
				Search(i, ver1);
				break;
			}
		}
		else if (i == m - 1) return 0;
	}
	return 0;
}
void Min(int ver2){
	for (int i = 0; i < m; i++)
	if (i == ver - 1);
	else{
		cout << "vertix " << i + 1 << ": " << Dis[i] << endl;
	}
	system("pause");
	for (int i = 0; i < m; i++)
		Dis[i] = 0;
	Choose();
}
int Rout(int ver1, int ver2, int k, int length){
	for (int i = 0; i < m; i++){
		if (Sum[ver1][i] == 1){
			if (i == ver - 1 || ver2 == i) continue;
			for (int j = 0; j < n; j++)
			if (Mas[j][0] == ver1 + 1 && Mas[j][1] == i + 1)
			if (Dis[i] != 0 && Dis[i] <= Dis[ver1] + Mas[j][2]) break;
			else{
				Dis[i] = Dis[ver1] + Mas[j][2];
				if (i == k - 1 && Dis[i] == length){
					A[f] = i + 1;
					f++;
					return 1;
				}
				if (Rout(i, ver1, k, length) == 1){
					A[f] = i + 1;
					f++;
					return 1;
				}
				break;
			}
		}
		else if (i == m - 1) return 0;
	}
	return 0;
}
/*int Check(int ver1,int ver2, int u){
	Per[u] = ver1;
	for (int g = 0; g < u; g++)
	if (Per[g] == ver1){
		cout << "Negative cycle" << endl;
		system("pause");
		exit(1);
	}
	for (int i = 0; i < m; i++){
		if (Sum[ver1][i] == 1){
			if (i == ver - 1 || ver2 == i) continue;
			for (int j = 0; j < n; j++)
			if (Mas[j][0] == ver1 + 1 && Mas[j][1] == i + 1)
			if (Dis[i] != 0 && Dis[i] <= Dis[ver1] + Mas[j][2]) break;
			else{
				Dis[i] = Dis[ver1] + Mas[j][2];
				Check(i, ver1, u+1);
				break;
			}
		}
		else if (i == m - 1) return 0;
	}
	return 0;
}*/
void Perev(){
	int Vid[20][20];
	for (int i = 0; i<m; i++){
		for (int j = 0; j<m; j++){
			Vid[i][j] = Sum[i][j];
		}
	}
	for (int u = 0; u<m - 2; u++) {
		for (int i = 0; i < m - 2; i++) {
			for (int j = i + 1 + u; j < m - 1; j++) {
				for (int l = j + 1; l < m; l++) {
					if (Vid[i][j] == Vid[j - u][l] && Vid[i][l] == 0 && Vid[i][j] != 0) {
						Vid[i][l] = Vid[i][j] + 1;
					}
				}
			}
		}
	}
	for (int u = 0; u<m - 2; u++) {
		for (int i = m - 1; i > 1; i--) {
			for (int j = i - 1 - u; j > 0; j--) {
				for (int l = j - 1; l >= 0; l--) {
					if (Vid[i][j] == Vid[j + u][l] && Vid[i][l] == 0 && Vid[i][j] != 0) {
						Vid[i][l] = Vid[i][j] + 1;
					}
				}
			}
		}
	}
	for (int i = 0; i<m; i++){
		for (int j = 0; j<m; j++){
			if (Vid[i][j] == 0 && i != j)
				Vid[i][j] = -1;
		}
	}
	/*for (int i = 0; i<m; i++){
		for (int j = 0; j<m; j++) {
			printf("%3d", Vid[i][j]);
		}
		cout << endl;
	}
	system("pause");*/
	for (int i = 0; i < m; i++) {
		for (int j = i; j < m; j++) {
			if (Vid[j][i] != 0 && Vid[i][j] != 0 && Vid[i][j] != -1 && Vid[j][i] != -1){
				//cout << i + 1 << "-" << j + 1 << endl;
				f = 0;
				Searchh(i, -1, j);
				for (int y = 0; y < n; y++)
				if (Mas[y][0] == j + 1 && Mas[y][1] == i + 1)
				if (Dis[j] + Mas[y][2] <= 0){
					cout << "Negative cycle" << endl;
					system("pause");
					exit(1);
				}
			}
			for(int o=0; o<m; o++)
				Dis[o]=0;
		}
	}
}
int Searchh(int ver1, int ver2, int hd){
	for (int i = 0; i < m; i++){
		if (Sum[ver1][i] == 1){
			if (i == ver - 1 || ver2 == i) continue;
			for (int j = 0; j < n; j++)
			if (Mas[j][0] == ver1 + 1 && Mas[j][1] == i + 1)
			if (Dis[i] != 0 && Dis[i] <= Dis[ver1] + Mas[j][2]) break;
			else{
				Dis[i] = Dis[ver1] + Mas[j][2];
				if (i == hd)
					return -10;
				if(Searchh(i, ver1, hd)==-10)
					return -10;
				break;
			}
		}
		else if (i == m - 1) return 0;
	}
	return 500;
}