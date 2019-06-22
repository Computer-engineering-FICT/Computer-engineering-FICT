using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace PROLab7
{
    class Matrix
    {
        private Vector[] matr;

        public Matrix(int length)
        {
            matr = new Vector[length];
            for (int i = 0; i < matr.Length; i++)
            {
                matr[i] = new Vector(matr.Length);
            }
        }

        public Vector getString(int i)
        {
            return matr[i];
        }

        public int getElement(int i, int j)
        {
            return matr[i].getElement(j);
        }

        public void setElement(int i, int j, int func)
        {
            matr[i].setElement(j, func);
        }

        public void setString(int i, Vector func)
        {
            matr[i] = func;
        }

        public int getLength()
        {
            return matr.Length;
        }

        public int findMax()
        {
            int max = matr[0].findMax();
            int help;
            for (int i = 1; i < matr.Length; i++)
            {
                help = matr[i].findMax();
                if (help > max)
                {
                    max = help;
                }
            }
            return max;
        }

        public void inputMatrix()
        {
            for (int i = 0; i < matr.Length; i++)
            {
                matr[i] = new Vector(matr.Length);
                matr[i].inputVector();
            }
        }

        public void inputMatrix(TextReader sr)
        {
            for (int i = 0; i < matr.Length; i++)
            {
                matr[i] = new Vector(matr.Length);
                matr[i].inputVector(sr);
            }
        }  

        public String outputMatrix()
        {
            String s = "";
            for (int i = 0; i < matr.Length; i++)
            {
                s = s + matr[i].outputVector() + "\n";
            }
            return s;
        } 
    }
}
