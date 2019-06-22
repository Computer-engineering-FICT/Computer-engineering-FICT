using System;
using System.Collections.Generic;
using System.Text;

namespace PROLab7
{
    class Functions
    {
        public static int vectorScalarProduct(Vector A, Vector B)
        {
            int rez = 0;
            for (int i = 0; i < A.getLength(); i++)
            {
                rez = rez + A.getElement(i) * B.getElement(i);
            }
            return rez;
        }

        public static Vector vectorSum(Vector A, Vector B)
        {
            Vector rez = new Vector(A.getLength());
            for (int i = 0; i < rez.getLength(); i++)
            {
                rez.setElement(i, A.getElement(i) + B.getElement(i));
            }
            return rez;
        }

        public static Vector vectorSub(Vector A, Vector B)
        {
            Vector rez = new Vector(A.getLength());
            for (int i = 0; i < rez.getLength(); i++)
            {
                rez.setElement(i, A.getElement(i) - B.getElement(i));
            }
            return rez;
        }

        public static Matrix matrixSum(Matrix A, Matrix B)
        {
            Matrix rez = new Matrix(A.getLength());
            for (int i = 0; i < rez.getLength(); i++)
            {
                rez.setString(i, vectorSum(A.getString(i), B.getString(i)));
            }
            return rez;
        }

        public static Matrix matrixMult(Matrix A, Matrix B)
        {
            Matrix rez = new Matrix(A.getLength());
            int help;
            for (int i = 0; i < A.getLength(); i++)
            {
                for (int j = 0; j < A.getLength(); j++)
                {
                    help = 0;
                    for (int z = 0; z < rez.getLength(); z++)
                    {
                        help = help + A.getElement(i, z) * B.getElement(z, j);
                    }
                    rez.setElement(i, j, help);
                }
            }
            return rez;
        }

        public static Vector matVecMult(Matrix MA, Vector B)
        {
            Vector rez = new Vector(B.getLength());
            int help;
            for (int i = 0; i < MA.getLength(); i++)
            {
                help = 0;
                for (int j = 0; j < MA.getLength(); j++)
                {
                    help = help + MA.getElement(i, j) * B.getElement(j);                                        
                }
                rez.setElement(i, help);
            }
            return rez;
        }

    }
}
