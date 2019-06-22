#include "stdafx.h"
#include "Methods.h"


Methods::Methods(int sizeOfArrays)
{
	this->sizeOfArrays = sizeOfArrays;
}


Methods::~Methods()
{
}

int* Methods::fillVectorOfOne()
{
	int* vector = new int[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		vector[i] = 1;
	}
	return vector;
}

int** Methods::fillMatrixOfOne()
{
	int** matrix = new int*[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		matrix[i] = new int[sizeOfArrays];
	}

	for (int i = 0; i < sizeOfArrays; i++)
	{
		for (int j = 0; j < sizeOfArrays; j++)
		{
			matrix[i][j] = 1;
		}
	}

	return matrix;
}

int* Methods::fillVectorOfRandom() 
{
	int* vector = new int[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		vector[i] = rand() % 100 - 100;
	}

	return vector;
}

int** Methods::fillMatrixOfRandom()
{
	int** matrix = new int*[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		matrix[i] = new int[sizeOfArrays];
	}

	for (int i = 0; i < sizeOfArrays; i++)
	{
		for (int j = 0; j < sizeOfArrays; j++)
		{
			matrix[i][j] = rand() % 100 - 100;
		}
	}

	return matrix;
}

void Methods::putVector(int* vector)
{
	for (int i = 0; i < sizeOfArrays; i++)
	{
		std::cout << vector[i] << " ";
	}

	std::cout << '\n';
}

void Methods::putMatrix(int** matrix)
{
	for (int i = 0; i < sizeOfArrays; i++)
	{
		for (int j = 0; j < sizeOfArrays; j++)
		{
			std::cout << matrix[i][j] << " ";
		}
		std::cout << '\n';
	}
}

int* Methods::sumOfVectors(int* vector1, int* vector2)
{
	int* resVector = new int[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		resVector[i] = vector1[i] + vector2[i];
	}

	return resVector;
}

int** Methods::sumOfMatrix(int** matrix1, int** matrix2)
{
	int** resMatrix = new int*[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		resMatrix[i] = new int[sizeOfArrays];
	}

	for (int i = 0; i < sizeOfArrays; i++)
	{
		for (int j = 0; j < sizeOfArrays; j++)
		{
			resMatrix[i][j] = matrix1[i][j] + matrix2[i][j];
		}
	}

	return resMatrix;
}

int** Methods::vectorToMatrixOnRow(int* vector)
{
	int** matrix = new int*[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		matrix[i] = new int[sizeOfArrays];
	}

	for (int i = 0; i < sizeOfArrays; i++)
	{
		for (int j = 0; j < sizeOfArrays; j++)
		{
			matrix[i][j] = 0;
		}
	}

	for (int i = 0; i < sizeOfArrays; i++) {
		matrix[0][i] = vector[i];
	}

	return matrix;
}

int** Methods::vectorToMatrixOnColumn(int* vector)
{
	int** matrix = new int*[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		matrix[i] = new int[sizeOfArrays];
	}

	for (int i = 0; i < sizeOfArrays; i++)
	{
		for (int j = 0; j < sizeOfArrays; j++)
		{
			matrix[i][j] = 0;
		}
	}

	for (int i = 0; i < sizeOfArrays; i++) {
		matrix[i][0] = vector[i];
	}

	return matrix;
}

int* Methods::matrixToVector(int** matrix)
{
	int* vector = new int[sizeOfArrays];
	int indexOfVector = 0;

	for (int i = 0; i < sizeOfArrays; i++) {
		for (int j = 0; j < sizeOfArrays; j++) {
			if (matrix[i][j] != 0) vector[indexOfVector++] = matrix[i][j];
		}
	}

	return vector;
}

int** Methods::multMatrix(int** matrix1, int** matrix2)
{
	int** resultMatrix = new int*[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		resultMatrix[i] = new int[sizeOfArrays];
	}

	for (int i = 0; i < sizeOfArrays; i++)
	{
		for (int j = 0; j < sizeOfArrays; j++)
		{
			resultMatrix[i][j] = 0;
		}

	}

	for (int i = 0; i < sizeOfArrays; i++) {
		for (int j = 0; j < sizeOfArrays; j++) {
			for (int k = 0; k < sizeOfArrays; k++) {
				resultMatrix[i][j] += matrix1[i][k] * matrix2[k][j];
			}
		}
	}

	return resultMatrix;
}

int** Methods::transMatrix(int** matrix)
{
	int** transMatr = new int*[sizeOfArrays];

	for (int i = 0; i < sizeOfArrays; i++)
	{
		transMatr[i] = new int[sizeOfArrays];
	}

	for (int i = 0; i < sizeOfArrays; i++)
	{
		for (int j = 0; j < sizeOfArrays; j++)
		{
			transMatr[i][j] = 0;
		}
	}

	for (int i = 0; i < sizeOfArrays; i++) {
		for (int j = 0; j < sizeOfArrays; j++) {
			transMatr[i][j] = matrix[j][i];
		}
	}
	return transMatr;
}