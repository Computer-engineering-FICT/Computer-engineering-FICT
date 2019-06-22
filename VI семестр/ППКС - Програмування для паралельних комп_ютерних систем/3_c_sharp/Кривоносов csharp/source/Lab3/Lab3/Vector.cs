using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/**
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *                                                             *
 *            Parallel and Distributed Computing               *
 *             Laboratory work #3. C#                          *
 *                                                             *
 * Task: A=(B*C)*Z+α*E*(MX*MZ)                                 *
 *                                                             *
 *                                                             *
 * @author Krivonosov Oleksii                                  *
 * @group IO-34                                                *
 * @date 24.03.16                                              *
 * File Vector.cs                                              *
 *                                                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */

namespace lab3
{
    class Vector
    {
        private int[] array;

        public Vector(int n)
        {
            array = new int[n];
        }

        public void set(int index, int value)
        {
            array[index] = value;
        }

        public int get(int index)
        {
            return array[index];
        }

        public int size()
        {
            return array.Length;
        }

        public String toString()
        {
            String res = "";
            for (int i = 0; i < array.Length; i++)
            {
                res += "   " + array[i];
            }
            return res;
        }


    }
}
