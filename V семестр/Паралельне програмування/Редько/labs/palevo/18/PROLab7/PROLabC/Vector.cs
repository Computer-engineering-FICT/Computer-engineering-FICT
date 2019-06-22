using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace PROLab7
{
    class Vector
    {
        private int[] vect;

        public Vector(int length)
        {
            vect = new int[length]; 
        }

        public int getLength()
        {
            return vect.Length;
        }

        public int getElement(int i)
        {
            return vect[i];
        }

        public void setElement(int i, int func)
        {
            vect[i] = func;
        }

        public int findMax()
        {
            int max = vect[0];
            for (int i = 1; i < vect.Length; i++)
            {
                if (vect[i] > max)
                {
                    max = vect[i];
                }
            }
            return max;
        }

       	public void inputVector() {
	    	int i = 0;
		    while (i < vect.Length) {
                if (Lab7.N > 3)
                {
                    vect[i] = 1;
                }
                else
                {
                    vect[i] = Convert.ToInt32(Console.ReadLine());
                }
                i++;
            }
		}

        public void inputVector(TextReader sr)
        {
            int i = 0;
            while (i < vect.Length)
            {
                if (Lab7.N > 100)
                {
                    vect[i] = 1;
                }
                else
                {
                    vect[i] = Convert.ToInt32(sr.ReadLine());
                }                
                i++;
            }
        }

        public String outputVector()
        {
            String s = "";
            for (int i = 0; i < vect.Length; i++)
            {
                s = s + "   " + vect[i];
            }
            return s;
        }
    }
}
