using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Threading;
namespace PROLab7
{


    class Matrix
    {
        private int size;
        private Vector[] matrix;

        public Matrix(int size)
        {
            this.size = size;
            this.matrix = new Vector[size];
            for (int i = 0; i < size; i++)
            {
                this.matrix[i] = new Vector(size);
            }
        }

        public Matrix(int size, int with)
        {
            this.size = size;
            this.matrix = new Vector[size];
            for (int i = 0; i < size; i++)
            {
                this.matrix[i] = new Vector(size, with);
            }
        }

        public void setMatrix(Vector[] mat)
        {
            this.matrix = mat;
        }

        public Vector[] getMatrix()
        {
            return this.matrix;
        }

        public int getSize()
        {
            return this.size;
        }

        public void transpose()
        {
            int help = 0;
            for (int i = 0; i < this.size; i++)
            {
                for (int j = 0; j < this.size; j++)
                {
                    help = this.matrix[j].getVector()[i];
                    this.matrix[j].getVector()[i] = this.matrix[i].getVector()[j];
                    this.matrix[i].getVector()[j] = help;
                }
            }
        }
        public void sortMatrix()
        {
            for (int i = 0; i < size; i++)
            {
                this.matrix[i].sortVectorDown();
            }
        }

        public void matrixInput()
        {
            Console.WriteLine("Input the matrix elements:");
            for (int i = 0; i < size; i++)
            {
                Console.WriteLine(i + 1 + " row");
                this.matrix[i].vectorInput();
            }
        }

        public void matrixOutput()
        {
            for (int i = 0; i < size; i++)
            {
                this.matrix[i].vectorOutput();
                Console.WriteLine();
            }
        }
        public void matrixFileOutput(String my_file)
        {
            FileStream fileout = new FileStream(my_file, FileMode.OpenOrCreate, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fileout);
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < this.size; j++)
                {
                    sw.Write(this.matrix[i].getVector()[j]);
                    sw.Write(" ");
                }
                sw.WriteLine();

                //this.matrix[i].vectorFileOutput(my_file);
            }
            sw.Close();
        }
    }
}

