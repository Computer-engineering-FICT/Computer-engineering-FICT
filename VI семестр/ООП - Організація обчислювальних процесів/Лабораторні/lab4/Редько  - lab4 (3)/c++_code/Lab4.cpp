#include "Lab4.h"

int **Lab4::MoveL(int matrix[][], int i)
{
	for (int j = 0; j < sizeof(matrix) / sizeof(matrix[0]); j++)
	{
		int temp = matrix[reduced][j];
		matrix[reduced][j] = matrix[i][j];
		matrix[i][j] = temp;
	}
	return matrix;
}

int **Lab4::MoveC(int matrix[][], int j)
{
	for (int i = 0; i < sizeof(matrix) / sizeof(matrix[0]); i++)
	{
		int temp = matrix[i][reduced];
		matrix[i][reduced] = matrix[i][j];
		matrix[i][j] = temp;
	}
	return matrix;
}

int Lab4::getSumL(int i)
{
	int s = 0;
	for (int j = 0; j < sizeof(matrix) / sizeof(matrix[0]); j++)
	{
		s += matrix[i][j];
	}
	return s;
}

int Lab4::getSumC(int j)
{
	int s = 0;
	for (int i = 0; i < sizeof(matrix) / sizeof(matrix[0]); i++)
	{
		s += matrix[i][j];
	}
	return s;
}

int Lab4::getMinL()
{
	int index = reduced;
	int s = getSumL(reduced);
	if (s == 0)
	{
		s = N * N;
	}
	for (int i = reduced + 1; i < sizeof(matrix) / sizeof(matrix[0]); i++)
	{
		int tempSum = getSumL(i);
		if ((s > tempSum) && (tempSum > 0))
		{
			s = tempSum;
			index = i;
		}
	}
	return index;
}

int Lab4::getMaxC(int i)
{
	int index = reduced;
	int s;
	if (matrix[i][reduced] != 1)
	{
		s = 0;
	}
	else
	{
		s = getSumC(reduced);
	}
	for (int j = reduced + 1; j < sizeof(matrix) / sizeof(matrix[0]); j++)
	{
		if (matrix[i][j] == 1)
		{
			int tempSum = getSumC(j);
			if (s < tempSum)
			{
				s = tempSum;
				index = j;
			}
		}
	}
	return index;
}

int Lab4::getNext1(int i, int indexJ)
{
	for (int j = indexJ + 1; j < sizeof(matrix) / sizeof(matrix[0]); j++)
	{
		if (matrix[i][j] == 1)
		{
			return j;
		}
	}
	return -1;
}

bool Lab4::isConflict()
{
	for (int i = 0; i < sizeof(matrix) / sizeof(matrix[0]); i++)
	{
		int sum = 0;
		for (int j = 0; j <= i; j++)
		{
			sum += matrix[i][j];
		}
		if ((sum != i + 1) && (sum != 0) && (sum != 1))
		{
			return true;
		}
	}
	return false;
}

void Lab4::put1(int i, int j)
{
	if (matrix[i][j] != 1)
	{
		matrix[i][j] = 1;
	}
	else
	{
		if (j + 1 < N)
		{
			put1(i, j + 1);
		}
		else
		{
			if (i + 1 < N)
			{
				put1(i + 1, 0);
			}
			else
			{
				put1(0, 0);
			}
		}
	}
}

void Lab4::init()
{
	reduced = 0;
//JAVA TO C++ CONVERTER NOTE: The following call to the 'RectangularArrays' helper class reproduces the rectangular array initialization that is automatic in Java:
//ORIGINAL LINE: matrix = new int[N][N];
	matrix = RectangularArrays::ReturnRectangularIntArray(N, N);
	for (int i = 0; i < count1; i++)
	{
		put1(static_cast<int>(Math::random() * N), static_cast<int>(Math::random() * N));
	}
}

void Lab4::main(std::wstring args[])
{
	for (int i = 0; i < N * N; i++)
	{
		count1 = i + 1;
		res[i][1] = static_cast<double>(count1)*100 / (N*N);
		for (int j = 0; j < 100; j++)
		{
			for (int z = 0; z < 100; z++)
			{
				init();
				while (reduced < sizeof(matrix) / sizeof(matrix[0]))
				{
					matrix = MoveL(matrix, getMinL());
					matrix = MoveC(matrix, getMaxC(reduced));
					reduced++;
				}
				if (isConflict())
				{
					res[i][0]++;
				}
			}
		}
		res[i][0] /= 100;
		std::cout << res[i][1] + std::wstring(L"; ") + res[i][0] + std::wstring(L";") << std::endl;
	}
}

void Lab4::print()
{
	for (int i = 0; i < sizeof(matrix) / sizeof(matrix[0]); i++)
	{
		for (int j = 0; j < sizeof(matrix) / sizeof(matrix[0]); j++)
		{
			std::cout << matrix[i][j] + std::wstring(L" ");
		}
		std::cout << std::endl;
	}
}

int Lab4::N = 20;
int Lab4::count1 = 1;
int Lab4::reduced = 0;
