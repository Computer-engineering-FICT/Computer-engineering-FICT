#pragma once
#include <iostream>;

class Methods
{
public:
	Methods(int sizeOfArrays);

	~Methods();

	int* fillVectorOfOne();
	int** fillMatrixOfOne();
	int* fillVectorOfRandom();
	int** fillMatrixOfRandom();
	void putVector(int* vector); 
	void putMatrix(int** matrix);
	int* sumOfVectors(int* vector1, int* vector2);
	int** sumOfMatrix(int** matrix1, int** matrix2); 
	int** vectorToMatrixOnRow(int* vector);
	int** vectorToMatrixOnColumn(int* vector);
	int* matrixToVector(int** matrix);
	int** multMatrix(int** matrix1, int** matrix2); 
	int** transMatrix(int** matrix); 
private:
	int sizeOfArrays;
};

