using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace proLab5
{
    class Matrix
    {
        private double[,] A;
        private int m, n;
        
        public Matrix(int m, int n) {
		this.m = m;
		this.n = n;
		A = new double[m,n];
	}

        public Matrix(int m, int n, double s) {
		this.m = m;
		this.n = n;
		A = new double[m,n];
		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
				A[i,j] = s;
			}
		}
	}
       
        public Matrix(double[,] A, int m, int n)
        {
            this.A = A;
            this.m = m;
            this.n = n;
        }

        public double[,] getArray()
        {
            return A;
        }

        /**
         * C = A + B
         * 
         * @param B
         *            another matrix
         * @return A + B
         */

        public Matrix plus(Matrix B)
        {
            checkMatrixDimensions(B);
            Matrix X = new Matrix(m, n);
            double[,] C = X.getArray();
            for (int i = 0; i < m; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    C[i,j] = A[i,j] + B.A[i,j];
                }
            }
            return X;
        }

        /**
         * Get maximum element of matrix
         * 
         * @return maximum
         */

        public double getMax()
        {
            double max = Double.MinValue;
            for (int i = 0; i < m; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    if (A[i,j] > max)
                        max = A[i,j];
                }
            }
            return max;
        }

        /**
         * Linear algebraic matrix multiplication, A * B
         * 
         * @param B
         *            another matrix
         * @return Matrix product, A * B
         * @exception IllegalArgumentException
         *                Matrix inner dimensions must agree.
         */

        public Matrix mul(Matrix B)
        {
            if (B.m != n)
            {
                  throw new ArgumentException("Matrix inner dimensions must agree.");
            }
            Matrix X = new Matrix(m, B.n);
            double[,] C = X.getArray();
            double[] Bcolj = new double[n];
            for (int j = 0; j < B.n; j++)
            {
                for (int k = 0; k < n; k++)
                {
                    Bcolj[k] = B.A[k,j];
                }
                for (int i = 0; i < m; i++)
                {
                    double[] Arowi = new double[m];
                    for (int k = 0; k < m; k++)
                    {
                        Arowi[k] = A[i,k];
                    }
                    double s = 0;
                    for (int k = 0; k < n; k++)
                    {
                        s += Arowi[k] * Bcolj[k];
                    }
                    C[i,j] = s;
                }
            }
            return X;
        }

        /**
         * Multiply a matrix by a scalar, C = s*A
         * 
         * @param s
         *            scalar
         * @return s*A
         */

        public Matrix times(double s)
        {
            Matrix X = new Matrix(m, n);
            double[,] C = X.getArray();
            for (int i = 0; i < m; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    C[i,j] = s * A[i,j];
                }
            }
            return X;
        }

        public void saveMatrix(String fileName)
        {
            FileStream fileout = new FileStream(fileName, FileMode.OpenOrCreate, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fileout);
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < this.n; j++)
                {
                    sw.Write(this.A[i,j]);
                    sw.Write(" ");
                }
                sw.WriteLine();

                //this.matrix[i].vectorFileOutput(my_file);
            }
            sw.Close();
        }

        /** Check if size(A) == size(B) **/

        private void checkMatrixDimensions(Matrix B)
        {
            if (B.m != m || B.n != n)
            {
             throw new System.ArgumentException("Matrix dimensions must agree.");
            }
        }
    }
}
