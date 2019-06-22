//Δενόκ³ν Δενθρ ²Ο-21
//ΟΟ, Λΰα 4 OpenMP
//P=8
//A=sort(Z) * (MO * MK) - a*E
//09.04.2015
#include <iostream>
#include <omp.h>
using namespace std;

const int N = 3200;
int a, A[N], Z[N], E[N], MO[N][N], MK[N][N];
const int P = 8;
const int H = N / P;

void fillVector(int[]);
void generateVector(int[]);
void generateMatrix(int[][N]);
void copyVector(int[], int[]);
void copyPartVector(int[], int[], int, int);
void copyMatrix(int[][N], int[][N]);
void showVector(int[]);
void merge(int, int, int, int, int[]);

int main()
{
	int x = 0;
	for (int i = 0; i < N; i++)
		A[i] = 0;
#pragma omp parallel num_threads(P) private (x) shared (Z,MO,a)
	{
		x = omp_get_thread_num();
#pragma omp critical (sect1)
		cout << "T" << x + 1 << " started\n";

		if (x == 0){
			fillVector(Z);
			generateVector(E);
		}
		if (x == 1)
			generateMatrix(MO);
		if (x == 2){
			generateMatrix(MK);
			a = 1;
		}

#pragma omp barrier
		;
		int temp = 0;
		int a, V[N], MO[N][N];
#pragma omp critical (sect2)
		{
			a = ::a;
			copyMatrix(::MO, MO);
			copyVector(Z, V);
		}
#pragma omp for
		for (int p = 0; p < 8; p++){
			for (int i = p * H; i <= (p + 1) * H; i++)
				for (int j = p * H; j < (p + 1) * H - 1; j++)
					if (V[j + 1] < V[j]){
						temp = V[j];
						V[j] = V[j + 1];
						V[j + 1] = temp;
					}
			copyPartVector(V, Z, p*H, (p + 1)*H);
		}
#pragma omp for
		for (int p = 0; p < P; p += 2){
			merge(p*H, (p + 1)*H, (p + 1)*H, (p + 2) * H, Z);
		}
#pragma omp for
		for (int p = 0; p < P; p += 4){
			merge(p*H, (p + 2)*H, (p + 2)*H, (p + 4) * H, Z);
		}
#pragma omp master
		merge(0, P*H / 2, P*H / 2, P*H, Z);
#pragma omp barrier
		;
#pragma omp critical (sect3)
		copyVector(Z, V);
#pragma omp barrier
		;
#pragma omp for
		for (int p = 0; p < 8; p++){
			for (int k = p*H; k < (p + 1)*H; k++){
				for (int i = 0; i < N; i++)
					for (int j = 0; j < N; j++)
					{
						A[k] += Z[i] * (MO[i][j] * MK[j][k]);
					}
				A[k] -= a*E[k];
			}
		}
#pragma omp critical (sect4)
		cout << "T" << x + 1 << " finished\n";
	}
#pragma omp master
	if (N <= 16)
		showVector(A);
	system("pause");

}

void fillVector(int X[]){
	for (int i = 0; i < N; i++)
		X[i] = 1;
}
void generateVector(int X[]){
	for (int i = 0; i < N; i++)
		X[i] = 1;
}
void generateMatrix(int X[][N]){
	for (int i = 0; i < N; i++)
		for (int j = 0; j < N; j++)
			X[i][j] = 1;
}

void copyVector(int from[], int to[]){
	for (int i = 0; i < N; i++)
		to[i] = from[i];
}

void copyPartVector(int vFrom[], int vTo[], int start, int finish){
	for (int i = start; i < finish; i++)
		vTo[i] = vFrom[i];
}

void copyMatrix(int from[][N], int to[][N])
{
	for (int i = 0; i < N; i++)
		for (int j = 0; j < N; j++)
			to[i][j] = from[i][j];
}
void showVector(int v[]){
	for (int i = 0; i < N; i++)
		cout << v[i] << " ";
	cout << "\n";
}

void merge(int start1, int end1, int start2, int end2, int Z[]){
	int L[N];
	int globstart = start1;
	copyVector(Z, L);
	while (start1 != end1 && start2 != end2){
		if (L[start1] <= L[start2]){
			Z[globstart] = L[start1];
			globstart++;
			start1++;
		}
		else if (L[start2] < L[start1]){
			Z[globstart] = L[start2];
			globstart++;
			start2++;
		}
	}
	if (start1 == end1)
		while (start2 != end2){
			Z[globstart] = L[start2];
			globstart++;
			start2++;
		}
	else if (start2 == end2){
		while (start1 != end1){
			Z[globstart] = L[start1];
			globstart++;
			start1++;
		}
	}
}