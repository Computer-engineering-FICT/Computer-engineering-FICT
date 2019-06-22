#pragma once
#include <iostream>;

class Methods
{
public:
	Methods(int sizeOfArrays);

	~Methods();

	int* fillVectorOfOne();// {
//		int* vector = new int[sizeOfArrays];
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			vector[i] = 1;
//		}
//		return vector;
//	}
//
	int** fillMatrixOfOne(); //{
//		int** matrix = new int[sizeOfArrays];
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			*matrix = new int[sizeOfArrays];
//		}
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			for (int j = 0; j < sizeOfArrays; j++) {
//				matrix[i][j] = 1;
//			}
//		}
//
//		return matrix;
//	}
//
	int* fillVectorOfRandom(); //{
//		int[] vector = new int[sizeOfArrays];
//		Random rand = new Random();
//		for (int i = 0; i < sizeOfArrays; i++) {
//			vector[i] = rand.nextInt(15) - 5;
//		}
//		return vector;
//	}
//
	int** fillMatrixOfRandom(); //{
//		int[][] matrix = new int[sizeOfArrays][sizeOfArrays];
//		Random rand = new Random();
//		for (int i = 0; i < sizeOfArrays; i++) {
//			for (int j = 0; j < sizeOfArrays; j++) {
//				matrix[i][j] = rand.nextInt(15) - 5;
//			}
//		}
//
//		return matrix;
//	}
//
	void putVector(int* vector); //{
//		for (int i = 0; i < sizeOfArrays; i++) {
//			System.out.print(vector[i] + " ");
//		}
//		System.out.println();
//	}
//
	void putMatrix(int** matrix); //{
//		for (int i = 0; i < sizeOfArrays; i++) {
//			for (int j = 0; j < sizeOfArrays; j++) {
//				System.out.print(matrix[i][j] + " ");
//			}
//			System.out.println();
//		}
//	}
//
	int* sumOfVectors(int* vector1, int* vector2); //{
//		int[] result = new int[sizeOfArrays];
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			result[i] = vector1[i] + vector2[i];
//		}
//
//		return result;
//	}
//
	int** sumOfMatrix(int** matrix1, int** matrix2); //{
//		int[][] resultMatrix = new int[sizeOfArrays][sizeOfArrays];
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			for (int j = 0; j < sizeOfArrays; j++) {
//				resultMatrix[i][j] = matrix1[i][j] + matrix2[i][j];
//			}
//		}
//
//		return resultMatrix;
//	}
//
	int** vectorToMatrixOnRow(int* vector); //{
//		int[][] matrix = new int[sizeOfArrays][sizeOfArrays];
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			matrix[0][i] = vector[i];
//		}
//
//		return matrix;
//	}
//
	int** vectorToMatrixOnColumn(int* vector); //{
//		int[][] matrix = new int[sizeOfArrays][sizeOfArrays];
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			matrix[i][0] = vector[i];
//		}
//
//		return matrix;
//	}
//
	int* matrixToVector(int** matrix);// {
//		int[] vector = new int[sizeOfArrays];
//		int indexOfVector = 0;
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			for (int j = 0; j < sizeOfArrays; j++) {
//				if (matrix[i][j] != 0) vector[indexOfVector++] = matrix[i][j];
//			}
//		}
//
//		return vector;
//	}
//
	int** multMatrix(int** matrix1, int** matrix2); //{
//		int[][] resultMatrix = new int[sizeOfArrays][sizeOfArrays];
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			for (int j = 0; j < sizeOfArrays; j++) {
//				for (int k = 0; k < sizeOfArrays; k++) {
//					resultMatrix[i][j] += matrix1[i][k] * matrix2[k][j];
//				}
//			}
//		}
//
//		return resultMatrix;
//	}
//
	int** transMatrix(int** matrix); //{
//		int[][] transMatr = new int[sizeOfArrays][sizeOfArrays];
//
//		for (int i = 0; i < sizeOfArrays; i++) {
//			for (int j = 0; j < sizeOfArrays; j++) {
//				transMatr[i][j] = matrix[j][i];
//			}
//		}
//		return transMatr;
//	}
//
private:
	int sizeOfArrays;
};

