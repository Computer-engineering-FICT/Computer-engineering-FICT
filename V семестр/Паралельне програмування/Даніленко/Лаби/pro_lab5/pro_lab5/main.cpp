#include<omp.h>

#include<Windows.h>
#include<stdio.h>
#include<time.h>

/*1.4 C = A + SORT(B) * (MA * ME).
2.4 MG = MAX(MH) * (MK * ML).
3.4 O = SORT(P) * SORT (MR * MS).
*/
using namespace std;

const int dimension = 3;
const int maxRandom = 20;

void printVector(int *A)
{
	printf("\n");
	for (int i = 0; i < dimension; i++)
	{
		printf("%d ", A[i]);
	}
	printf("\n");
}
void printMatrix(int **MA)
{
	printf("\n");
	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			printf("%d ", MA[i][j]);
		}
		printf("\n");
	}
	printf("\n");
}

int multipleVectors(int *A, int *B)
{
	int result = 0;
	for (int i = 0; i < dimension; i++)
	{
		result = result + A[i] * B[i];
	}
	return result;
}

int *multipleVectorMatrix(int *A, int **MA)
{
	int* result = new int[dimension];
	for (int i = 0; i < dimension; i++)
	{
		result[i] = 0;
		for (int j = 0; j < dimension; j++)
		{
			result[i] = result[i] + MA[i][j] * A[j];
		}
	}
	return result;
}

int* addVectors(int *A, int *B)
{
	int *result = new int[dimension];
	for (int i = 0; i < dimension; i++)
	{
		result[i] = A[i] + B[i];
	}
	return result;
}


int **multipleMatrix(int **MA, int **MB)
{
	int **result = new int*[dimension];
	for (int i = 0; i < dimension; i++)
	{
		result[i] = new int[dimension];
	}

	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			result[i][j] = 0;
			for (int k = 0; k < dimension; k++)
			{
				result[i][j] = result[i][j] + MA[i][k] * MB[k][j];
			}
		}
	}
	return result;
}

int minElement(int **MA)
{
	int result = MA[0][0];
	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			if (result > MA[i][j]) {
				result = MA[i][j];
			}
		}
	}
	return result;
}

int maxElement(int **MA) {
	int result = MA[0][0];
	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			if (result < MA[i][j]) {
				result = MA[i][j];
			}
		}
	}
	return result;
}

int **sortMatrix(int **MA)
{
	int buffer = 0;
	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			for (int k = 0; k < j - 1; k++)
			{
				if (MA[i][k] < MA[i][k + 1])
				{
					buffer = MA[i][k];
					MA[i][k] = MA[i][k + 1];
					MA[i][k + 1] = buffer;
				}
			}
		}
	}
	return MA;
}

int *sortVector(int *V)
{
	int buffer = 0;
	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			if (V[i] < V[j])
			{
				buffer = V[i];
				V[i] = V[j];
				V[j] = buffer;
			}
		}
	}
	return V;
}

int **Max()
{
	int **result = new int*[dimension];
	for (int i = 0; i < dimension; i++)
	{
		result[i] = new int[dimension];
	}
	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			srand((unsigned)time(NULL) / rand());
			result[i][j] = rand() % maxRandom;
		}
	}
	return result;
}

int **multipleCisloMatrix(int **MA, int **MB)
{
	int **result = new int*[dimension];
	for (int i = 0; i < dimension; i++)
	{
		result[i] = new int[dimension];
	}

	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			result[i][j] = 0;
			for (int k = 0; k < dimension; k++)
			{
				result[i][j] = result[i][j] + MA[i][k] * MB[k][j];
			}
		}
	}
	return result;
}

int **addMatrix(int **MA, int **MB)
{
	int **result = new int*[dimension];
	for (int i = 0; i < dimension; i++)
	{
		result[i] = new int[dimension];
	}

	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			result[i][j] = MA[i][j] + MB[i][j];
		}
	}
	return result;
}

int **randomMatrix()
{
	int **result = new int*[dimension];
	for (int i = 0; i < dimension; i++)
	{
		result[i] = new int[dimension];
	}
	for (int i = 0; i < dimension; i++)
	{
		for (int j = 0; j < dimension; j++)
		{
			srand((unsigned)time(NULL) / rand());
			result[i][j] = rand() % maxRandom;
		}
	}
	return result;
}

int *randomVector()
{
	int *result = new int[dimension];
	for (int i = 0; i < dimension; i++)
	{
		srand((unsigned)time(NULL) / rand());
		result[i] = rand() % maxRandom;
	}
	return result;
}
//1.4 C = A + SORT(B) * (MA * ME).
void function1()
{
	printf("Thread1 started \n");
	int* B = randomVector();
	int* A = randomVector();
	int** MA = randomMatrix();
	int** ME = randomMatrix();

	int* result = addVectors(A, multipleVectorMatrix(sortVector(B), multipleMatrix(MA, ME)));
	printf("Thread1 finished\n");
	printVector(result);
	ExitThread(0);
}
//2.4 MG = MAX(MH) * (MK * ML)
void function2()
{
	printf("Thread2 started \n");

	int** MH = randomMatrix();
	int** MK = randomMatrix();
	int** ML = randomMatrix();

	int **result = multipleCisloMatrix(Max(), multipleMatrix(MK, ML));
	printf("Thread2 finished\n");
	printMatrix(result);
	ExitThread(0);
}
//3.4 O = SORT(P) * SORT (MR * MS)
void function3()
{
	printf("Thread3 started \n");

	int* P = randomVector();
	int** MR = randomMatrix();
	int** MS = randomMatrix();

	int *result = multipleVectorMatrix(sortVector(P), sortMatrix(multipleMatrix(MR, MS)));
	printf("Thread3 finished\n");
	printVector(result);
	ExitThread(0);
}

int main() {
	printf("Lab5 started \n");

	omp_set_num_threads(3);
#pragma omp parallel
	{
#pragma omp sections
		{
#pragma omp section
			{
				function1();
			}
#pragma omp section
			{
				function2();

			}
#pragma omp section
			{
				function3();

			}
		}
	}

	printf("Lab5 finished \n");

	getchar();
	return 0;
}

