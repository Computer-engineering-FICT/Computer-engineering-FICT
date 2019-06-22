/*
 * Lab4pro.cpp
 * A = sotr(B * MO + C * MX * MZ)                   
 * Cherednichenko Svyatoslav Sergiyovich, IO-01 
 * 23.03.2013                                   
 */

#include "stdafx.h"
#include <iostream>
#include <mpi.h> 
#include <time.h> 
using namespace std;

const int P = 5;
int N = 2400;
int H =  N/P;

int* Input_V(int n){
	int * result = new int[N];
	for(int i = 0; i < N; i++)
		result[i] = n;
	return result;
}

int** Input_M(int n){
	int ** result = new int*[N];
	for(int i = 0; i < N; i++)
		result[i] = new int[N];
	for(int i = 0; i < N; i++)
		for(int j = 0; j < N; j++)
			result[i][j] = n;
	return result;
}

int* Input_V(int n, int size){
	int * result = new int[size];
	for(int i = 0; i < size; i++)
		result[i] = n;
	return result;
}

int** Input_M(int n, int size){
	int ** result = new int*[size];
	for(int i = 0; i < size; i++)
		result[i] = new int[N];
	for(int i = 0; i < size; i++)
		for(int j = 0; j < N; j++)
			result[i][j] = n;
	return result;
}
int* Init_V(){
	return new int[N];
}

int** Init_M(){
	int ** result = new int*[N];
	for(int i = 0; i < N; i++)
		result[i] = new int[N];
	return result;
}

int* Init_V(int size){
	return new int[size];
}

int** Init_M(int size){
	int ** result = new int*[size];
	for(int i = 0; i < size; i++)
		result[i] = new int[N];
	return result;
}

void Output_V(int* v){
	for(int i = 0; i < N; i++)
		cout << v[i] << " ";
	cout << endl;
}

void Output_M(int** M){
	for(int i = 0; i < N; i++){
		for(int j = 0; j < N; j++)
			cout << M[i][j] << " ";
		cout << endl;
	}
	cout << endl;
}
int** Copy_M(int** MX){
	int ** result = new int*[N];
	for(int i = 0; i < N; i++)
		result[i] = new int[N];
	for(int i = 0; i < N; i++)
		for(int j = 0; j < N; j++)
			result[i][j] = MX[i][j];
	return result;
}
int* Copy_V(int* V){
	int* result = new int[N];
	for(int i = 0; i < N; i++)
		result[i] = V[i];
	return result;
}

void Copy_Paste(int* V1, int* V2,int l,int r){
	for(int i = l; i < r; i++)
		V1[i] = V2[i];
}

void SumV(int* a, int* b, int* res, int m, int m1){
	for (int i = m; i < m1; i++)
			res[i] = a[i-m] + b[i-m];
}

int** MulM(int** a, int** b, int m, int m1){
	int ** result = Input_M(0, m1-m);

	for (int i = m; i < m1; i++)
		for (int j = 0; j < N; j++)
			for (int k = 0; k < N; k++)
				result[i-m][j] = result[i-m][j] + a[k][j]*b[i-m][k];
	return result;
}

int* MulVM(int* a, int** b, int m, int m1){
	int * result = Input_V(0, m1-m);
	for (int i = m; i < m1; i++)
		for (int j = 0; j < N; j++)
			result[i-m] = result[i-m] + a[i] * b[i-m][j];
	return result;
}

void Sort(int *mas, int task){
    int k;
    int r;
    while(1){ 
        k=0;
        for (int i=(task-1)*H; i<(task*H)-1; i++){ 
            if (mas[i]<mas[i+1]){ 
                r=mas[i];
                mas[i]=mas[i+1];
                mas[i+1]=r;
                k++;
            }
        }
        if (k==0) break;
    }
}

int *Merge(int *m1, int *m2, int l1, int l2){
    int *ret = new int[l1+l2];
    int n = 0;
    while (l1 && l2){
        if (*m1 < *m2){
           ret[n] = *m1;
           m1++; l1--;}
        else {
           ret[n] = *m2;
           m2++; l2--;}
       n++;}
    if (l1 == 0){
        for (int i=0; i<l2; i++){
            ret[n++] = *m2++;}}
    else {
        for (int i=0; i<l1; i++){
           ret[n++] = *m1++;}}
    return ret;}

int* Merge(int* left, int* right){
	int a = 0, b = 0;
	int rS = sizeof (left)/sizeof(int);
	int lS = sizeof (right)/sizeof(int);
	int size = rS + lS;
    int* Merged = new int[size];
	for (int i = 0; i < size; i++){
		if (b < rS && a < lS)
			if (left[a] > right[b] && b < rS)
				Merged[i] = right[b++];
			else
				Merged[i] = left[a++];
		else
			if (b < rS)
				Merged[i] = right[b++];
			else
				Merged[i] = left[a++];
    }
	return Merged;
}
 
static void MergeSort(int* vector, int l, int r){
	int vS = sizeof (vector)/sizeof(int);
	if (vS == 1)
		return;
	int mid = (r - l) / 2;
	int* Merged = new int[r - l];
	int* array1 = new int[mid];
	int* array2 = new int[mid];
	for (int i = 0; i < r - l; i++){
		if (i < mid)
			array1[i] = vector[i + l];
		else
			array2[i - mid] = vector[i + l];
	}
	Merged = Merge(array1, array2);
	for (int i = l; i < r; i++)
		vector [i] = Merged[i-l];
}

int *alloc_V(int size,int number) {
    int *data = (int *)malloc(size*sizeof(int));
	for (int i=0; i<size; i++)
        data[i] = number;
    return data;
}

int *alloc_V(int size) {
    int *data = (int *)malloc(size*sizeof(int));
    return data;
}

int **alloc_M(int rows, int cols) {
    int *data = (int *)malloc(rows*cols*sizeof(int));
    int **array= (int **)malloc(rows*sizeof(int*));
    for (int i=0; i<rows; i++)
        array[i] = &(data[cols*i]);
    return array;
}

int **alloc_M(int rows, int cols, int number) {
	int *data = (int *)malloc(rows*cols*sizeof(int));
    int **array= (int **)malloc(rows*sizeof(int*));
    for (int i=0; i<rows; i++){
        array[i] = &(data[cols*i]);
		for(int j=0; j<cols; j++)
			array[i][j]=number;
	}
    return array;
}

int task1(){
	double t1, t2; 
	t1 = MPI_Wtime(); 
	cout << "task 1 started " << endl;
	int * B = alloc_V(N,1);
	int * C = alloc_V(N,1);
	int * A = Input_V(0);
	MPI_Send(&(B[0]), N, MPI_INT, 1, 0, MPI_COMM_WORLD);
	MPI_Send(&(C[0]), N, MPI_INT, 1, 0, MPI_COMM_WORLD);

	int** MO = alloc_M(N,N);
	int** MX = alloc_M(N,N);
	int** MZ = alloc_M(N,N);

	MPI_Recv(&(MO[0][0]), N*N, MPI_INT, 1, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(MX[0][0]), N*N, MPI_INT, 1, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(MZ[0][0]), N*N, MPI_INT, 1, 0, MPI_COMM_WORLD,
			 MPI_STATUS_IGNORE);

	SumV(MulVM(B, MO, 0, H), MulVM(C, MulM(MX, MZ, 0, H), 0, H), A, 0, H);
	Sort(A, 0);

	MPI_Recv(&(A[H]), 2*H-H, MPI_INT, 1, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MergeSort(A, 0, 2*H);

	MPI_Recv(&(A[2*H]), N-2*H, MPI_INT, 1, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MergeSort(A, 0, N);
	if(N<11){
		Output_V(A);
	}
	cout << "task 1 ended " << endl;
	t2 = MPI_Wtime(); 
	printf( "Elapsed time is %f\n", t2 - t1 );
	return 0;
}

int task2(){
	cout << "task 2 started " << endl;
	int** MO = alloc_M(N,N,1);
	int** MX = alloc_M(N,N,1);
	int** MZ = alloc_M(N,N,1);
	int * A = Input_V(0);

	int * B = alloc_V(N);
	int * C = alloc_V(N);
	MPI_Recv(&(B[0]), N, MPI_INT, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(C[0]), N, MPI_INT, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);


	MPI_Send(&(MO[0][0]), N*N, MPI_INT, 0, 0, MPI_COMM_WORLD);
	MPI_Send(&(MX[0][0]), N*N, MPI_INT, 0, 0, MPI_COMM_WORLD);
	MPI_Send(&(MZ[0][0]), N*N, MPI_INT, 0, 0, MPI_COMM_WORLD);

	MPI_Send(&(MO[0][0]), N*N, MPI_INT, 2, 0, MPI_COMM_WORLD);
	MPI_Send(&(MX[0][0]), N*N, MPI_INT, 2, 0, MPI_COMM_WORLD);
	MPI_Send(&(MZ[0][0]), N*N, MPI_INT, 2, 0, MPI_COMM_WORLD);

	MPI_Send(&(B[0]), N, MPI_INT, 2, 0, MPI_COMM_WORLD);
	MPI_Send(&(C[0]), N, MPI_INT, 2, 0, MPI_COMM_WORLD);

	SumV(MulVM(B, MO, H, 2*H), MulVM(C, MulM(MX, MZ, H, 2*H), H, 2*H), A, H, 2*H);
	Sort(A, 1);
	MPI_Send(&(A[H]), 2*H-H, MPI_INT, 0, 0, MPI_COMM_WORLD);

	MPI_Recv(&(A[2*H]), N-2*H, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);

	MPI_Send(&(A[2*H]), N-2*H, MPI_INT, 0, 0, MPI_COMM_WORLD);

	cout << "task 2 ended " << endl;
	return 0;
}

int task3(){
	cout << "task 3 started " << endl;
	int** MO = alloc_M(N,N);
	int** MX = alloc_M(N,N);
	int** MZ = alloc_M(N,N);
	int * A = Input_V(0);

	int * B = alloc_V(N);
	int * C = alloc_V(N);

	MPI_Recv(&(MO[0][0]), N*N, MPI_INT, 1, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(MX[0][0]), N*N, MPI_INT, 1, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(MZ[0][0]), N*N, MPI_INT, 1, 0, MPI_COMM_WORLD,
			 MPI_STATUS_IGNORE);

	MPI_Recv(&(B[0]), N, MPI_INT, 1, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(C[0]), N, MPI_INT, 1, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);

	for(int i = 1; i <= 2;i++){
		MPI_Send(&(MO[0][0]), N*N, MPI_INT, 2 + i, 0, MPI_COMM_WORLD);
		MPI_Send(&(MX[0][0]), N*N, MPI_INT, 2 + i, 0, MPI_COMM_WORLD);
		MPI_Send(&(MZ[0][0]), N*N, MPI_INT, 2 + i, 0, MPI_COMM_WORLD);

		MPI_Send(&(B[0]), N, MPI_INT, 2 + i, 0, MPI_COMM_WORLD);
		MPI_Send(&(C[0]), N, MPI_INT, 2 + i, 0, MPI_COMM_WORLD);
	}

	SumV(MulVM(B, MO, 2*H, 3*H), MulVM(C, MulM(MX, MZ, 2*H, 3*H), 2*H, 3*H), A, 2*H, 3*H);
	Sort(A, 2);

	MPI_Recv(&(A[3*H]), 4*H-3*H, MPI_INT, 3, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MergeSort(A, 3*H, 4*H);
	
	MPI_Recv(&(A[4*H]), N-4*H, MPI_INT, 4, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MergeSort(A, 3*H, N);

	MPI_Send(&(A[2*H]), N-2*H, MPI_INT, 1, 0, MPI_COMM_WORLD);
	cout << "task 3 ended " << endl;
	return 0;
}

int task4(){
	cout << "task 4 started " << endl;
	int** MO = alloc_M(N,N);
	int** MX = alloc_M(N,N);
	int** MZ = alloc_M(N,N);
	int * A = Input_V(0);

	int * B = alloc_V(N);
	int * C = alloc_V(N);

	MPI_Recv(&(MO[0][0]), N*N, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(MX[0][0]), N*N, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(MZ[0][0]), N*N, MPI_INT, 2, 0, MPI_COMM_WORLD,
			 MPI_STATUS_IGNORE);

	MPI_Recv(&(B[0]), N, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(C[0]), N, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);

	SumV(MulVM(B, MO, 3*H, 4*H), MulVM(C, MulM(MX, MZ, 3*H, 4*H), 3*H, 4*H), A, 3*H, 4*H);
	Sort(A, 3);

	MPI_Send(&(A[3*H]), 4*H-3*H, MPI_INT, 2, 0, MPI_COMM_WORLD);
	cout << "task 4 ended " << endl;
	return 0;
}
int task5(){
	cout << "task 5 started " << endl;
	int** MO = alloc_M(N,N);
	int** MX = alloc_M(N,N);
	int** MZ = alloc_M(N,N);
	int * A = Input_V(0);

	int * B = alloc_V(N);
	int * C = alloc_V(N);

	MPI_Recv(&(MO[0][0]), N*N, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(MX[0][0]), N*N, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(MZ[0][0]), N*N, MPI_INT, 2, 0, MPI_COMM_WORLD,
			 MPI_STATUS_IGNORE);

	MPI_Recv(&(B[0]), N, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
	MPI_Recv(&(C[0]), N, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);

	SumV(MulVM(B, MO, 4*H, N), MulVM(C, MulM(MX, MZ, 4*H, N), 4*H, N), A, 4*H, N);
	Sort(A, 4);
	MPI_Send(&(A[4*H]), (N-4*H), MPI_INT, 2, 0, MPI_COMM_WORLD);

	cout << "task 5 ended " << endl;
	return 0;
}

void work(int argc, char *argv[]){
	/**
	** створюється група процесів, в яку поміщаються всі процеси програми, 
	** і створюється область зв'язку, що описується наперед визначним комунікатором MPI_COMM_WORLD
	**/
	MPI_Init(&argc, &argv);
	int processID;

	/**
	** Функція повертає номер процесу, що викликав цю функцію
	**/
	MPI_Comm_rank(MPI_COMM_WORLD, &processID);

    if (processID == 0){		
	    task1();
	}
	if (processID == 1){			
   	    task2();
	}
	if (processID == 2){		
	    task3();
	}
	if (processID == 3){			
   	    task4();
	}
	if (processID == 4){			
   	    task5();
	}
	MPI_Finalize();

}

void main(int argc, char *argv[])
{
	/*int start;
	cout << "Enter start: ";
	cin >> start;*/
	work(argc, argv);
	cout << "enter any key to exit the program...";
	cin >> N;
}