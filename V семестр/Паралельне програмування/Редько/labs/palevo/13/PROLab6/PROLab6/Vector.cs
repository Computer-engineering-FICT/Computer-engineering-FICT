using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Threading;
namespace PROLab6
{
    class Vector
    {
        private int size;
        private int[] vector;


        public Vector(int size)
        {
            this.size = size;
            this.vector = new int[size];
        }

        public Vector(int size, int with)
        {
            this.size = size;
            this.vector = new int[size];
            for (int i = 0; i < size; i++)
                this.vector[i] = with;
        }


        public void setVector(int[] vector)
        {
            this.vector = vector;
        }

        public int[] getVector()
        {
            return vector;
        }

        public int getSize()
        {
            return size;
        }

        public void sortVectorUp()
        {
            int buffer = 0;
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size - 1; j++)
                {
                    if (this.vector[j + 1] < this.vector[j])
                    {
                        buffer = this.vector[j + 1];
                        this.vector[j + 1] = this.vector[j];
                        this.vector[j] = buffer;
                    }
                }
            }
        }
        public void sortVectorDown()
        {
            int buffer = 0;
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size - 1; j++)
                {
                    if (this.vector[j + 1] > this.vector[j])
                    {
                        buffer = this.vector[j + 1];
                        this.vector[j + 1] = this.vector[j];
                        this.vector[j] = buffer;
                    }
                }
            }
        }

        public int minimum()
        {
            int result = this.vector[0];
            for (int i = 1; i < size; i++)
            {
                if (this.vector[i] < result) result = this.vector[i];
            }
            return result;
        }

        public int maximum()
        {
            int result = this.vector[0];
            for (int i = 1; i < size; i++)
            {
                if (this.vector[i] > result) result = this.vector[i];
            }
            return result;
        }

        public void vectorInput()
        {
            Console.WriteLine("Input the array elements:");
            for (int i = 0; i < this.size; i++)
            {
                this.vector[i] = Convert.ToInt32(Console.ReadLine());
            }
        }

        public void vectorOutput()
        {
            for (int i = 0; i < this.size; i++)
            {
                Console.Write(this.vector[i]);
                Console.Write("   ");
            }
            // Console.WriteLine();
        }
        public void vectorFileOutput(String my_file)
        {
            FileStream fileout = new FileStream(my_file, FileMode.OpenOrCreate, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fileout);


            for (int i = 0; i < this.size; i++)
            {
                sw.Write(this.vector[i]);
                sw.Write(" ");

            }
            sw.WriteLine();
            sw.Close();
        }
    }
}
