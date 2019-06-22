using System;
using System.Collections.Generic;
using System.Text;

namespace LabPP3
{
    class Methods
    {
        static object block = new object();
        private int sizeOfArrays;

        public Methods(int sizeOfArrays)
        {
            this.sizeOfArrays = sizeOfArrays;
        }

        public int[] FillingOfVector()
        {
            int[] vector = new int[sizeOfArrays];

            for (int i = 0; i < sizeOfArrays; i++)
            {
                vector[i] = 1;
            }

            return vector;
        }

        public int[,] FillingOfMatrix()
        {
            int[,] matrix = new int[sizeOfArrays, sizeOfArrays];

            for (int i = 0; i < sizeOfArrays; i++)
            {
                for (int j = 0; j < sizeOfArrays; j++)
                {
                    matrix[i, j] = 1;
                }
            }

            return matrix;
        }

        public void PutVector(int[] vector)
        {
            lock (block)
            {
                for (int i = 0; i < sizeOfArrays; i++)
                {
                    Console.Write(vector[i] + " ");
                }

                Console.WriteLine();
            }
        }

        public void PutMatrix(int[,] matrix)
        {
            lock (block)
            {
                for (int i = 0; i < sizeOfArrays; i++)
                {
                    for (int j = 0; j < sizeOfArrays; j++)
                    {
                        Console.Write(matrix[i, j] + " ");
                    }
                    Console.WriteLine();
                }

                Console.WriteLine();
            }
        }

        public int[] SumOfVector(int[] vector1, int[] vector2)
        {
            int[] resVector = new int[sizeOfArrays];

            for (int i = 0; i < sizeOfArrays; i++)
            {
                resVector[i] = vector1[i] + vector2[i];
            }

            return resVector;
        }
        
        public int[] MultOfVector(int[] vector1, int[] vector2)
        {
            int[] resVector = new int[sizeOfArrays];

            for (int i = 0; i < sizeOfArrays; i++)
            {
                resVector[i] = vector1[i] * vector2[i];
            }

            return resVector;
        }

        public int[,] SumOfMatrix(int[,] matrix1, int[,] matrix2)
        {
            int[,] resMatrix = new int[sizeOfArrays, sizeOfArrays];

            for (int i = 0; i < sizeOfArrays; i++)
            {
                for (int j = 0; j < sizeOfArrays; j++)
                {
                    resMatrix[i, j] = matrix1[i, j] + matrix2[i, j];
                }
            }

            return resMatrix;
        }

        public int[,] VectorToMatrixOnRow(int[] vector)
        {
            int[,] matrix = new int[sizeOfArrays, sizeOfArrays];

            for (int i = 0; i < sizeOfArrays; i++)
            {
                matrix[0, i] = vector[i];
            }

            return matrix;
        }

        public int[,] VectorToMatrixOnColumn(int[] vector)
        {
            int[,] matrix = new int[sizeOfArrays, sizeOfArrays];

            for (int i = 0; i < sizeOfArrays; i++)
            {
                matrix[i, 0] = vector[i];
            }

            return matrix;
        }

        public int[] MatrixToVector(int[,] matrix)
        {
            int[] vector = new int[sizeOfArrays];
            int indexOfVector = 0;

            for (int i = 0; i < sizeOfArrays; i++)
            {
                for (int j = 0; j < sizeOfArrays; j++)
                {
                    if (matrix[i, j] != 0) vector[indexOfVector++] = matrix[i, j];
                }
            }

            return vector;
        }

        public int[,] MultMatrix(int[,] matrix1, int[,] matrix2)
        {
            int[,] resultMatrix = new int[sizeOfArrays, sizeOfArrays];

            for (int i = 0; i < sizeOfArrays; i++)
            {
                for (int j = 0; j < sizeOfArrays; j++)
                {
                    for (int k = 0; k < sizeOfArrays; k++)
                    {
                        resultMatrix[i, j] += matrix1[i, k] * matrix2[k, j];
                    }
                }
            }

            return resultMatrix;
        }

        public int[,] TransMatrix(int[,] matrix)
        {
            int[, ] transMatr = new int[sizeOfArrays, sizeOfArrays];

            for (int i = 0; i < sizeOfArrays; i++)
            {
                for (int j = 0; j < sizeOfArrays; j++)
                {
                    transMatr[i, j] = matrix[j, i];
                }
            }
            return transMatr;
        }
        
        public int MinOfMatrix(int[,] matrix)
        {
            int res = 9999;

            for (int i = 0; i < sizeOfArrays; i++)
            {
                for (int j = 0; j < sizeOfArrays; j++)
                {
                    if (matrix[i, j] < res)
                    {
                        res = matrix[i, j];
                    }
                }
            }

            return res;
        }
        
    }
}