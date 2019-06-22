using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pro_lab5
{
    class Data
    {
        private int n;
        private int value;

        protected Data (int n, int value)
        {
            this.setN(n);
            this.setValue(value);
        }

        protected Vector inputVector()
        {
            Vector vector = new Vector(n);
            for (int i = 0; i < n; i++)
            {
                vector.set(i, value);
            }
            return vector;
        }

        protected Matrix inputMatrix()
        {
            Matrix matrix = new Matrix(n);
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    matrix.set(i, j, value);
                }
            }
            return matrix;
        }

        protected void outputVector(Vector vector, String nameOfFile) {
            if (vector.size() < 5)
            {
                Console.WriteLine(vector.toString());
            }
            else
            {
                System.IO.File.WriteAllText(@nameOfFile, vector.toString());
            }

        }

        protected void outputMatrix(Matrix matrix, String nameOfFile) {
		    if(matrix.size() < 5)
            {
			    Console.WriteLine(matrix.toString());
		    }
            else
            {
                System.IO.File.WriteAllText(@nameOfFile, matrix.toString());
            }
        }

        protected void setN(int n)
        {
            if (n > 0)
            {
                this.n = n;
            }
        }

        protected void setValue(int value)
        {
            this.value = value;
        }

        protected int getValue()
        {
            return value;
        }
    }
}
