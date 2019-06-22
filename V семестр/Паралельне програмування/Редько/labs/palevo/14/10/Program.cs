
/*---Rudzik Dima
---IO-81
---Lab 2
---e = (A*B) - (C*D)
---MC = SORT(TRANS(MA)*MB)
-- C = SORT(A)*MB*/

using System;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    class Program
    {
        static int N = 1000;
        static void Main(string[] args)
        {
            Console.WriteLine("Enter N : ");
            N = int.Parse(Console.ReadLine());
            Thread t1 = new Thread(func1);
            t1.Start();
            Thread t2 = new Thread(func2);
            t2.Start();
            Thread t3 = new Thread(func3);
            t3.Start();

            t1.Join();
            t2.Join();
            t3.Join();
            Console.WriteLine("-----------------------------------press any key ");
            Console.ReadLine();
        }




//-------------------------func1
        static void func1()
        {   
            int[] a = inputVector(new int[N]);
            int[] b = inputVector(new int[N]);
            int[] c = inputVector(new int[N]);
            int[] d = inputVector(new int[N]);

            int result;
            int z = 0;
            int x = 0;

            Console.WriteLine("Func1 thread START");
            for (int i = 0; i < a.Length; i++) {
                z += a[i] * b[i];
                x += c[i] * d[i];
            }
            result = z - x;
            Console.Write("func1      (A*B) - (C*D) = " +(z-x));
            Console.Write("Func1 thread STOP");

        }
//-----------------------------------func 2
        static void func2() {
            int[][] ma = inputMatrix(new int[N][]);
            int[][] mb = inputMatrix(new int[N][]);
            int[][] result;
            int[][] ma1 = new int[ma.Length][];
            for (int i = 0; i < ma.Length; i++) {
                ma1[i] = new int[ma.Length];
            }
            Console.WriteLine("Func2 thread START ");
            for (int o = 0; o < ma.Length; o++) {
                for (int i = 0; i < ma.Length; i++) {
                    for (int j = 0; j < ma.Length; j++) {
                        ma1[o][i] += ma[o][i] * mb[j][i];
                    }
                }
            }
            for (int i = 0; i < ma.Length; i++) {
                sortVector1(ma1[i]);
            }
            result = ma1;
            Console.WriteLine("func 2    SORT(TRANS(MA)*MB) = ");
            printMatrix(result);
            Console.WriteLine("Func2 thread STOP. ");
        }

//--------------------------------func3
        static void func3() {
             int[] a = inputVector(new int[N]);
             int[][] mb = inputMatrix(new int[N][]);
             int[] result;
             int[] z = new int[a.Length];

            Console.WriteLine("Func3 thread START ");
            sortVector(a);
        
            for (int j = 0; j < a.Length; j++) {
                   z[j] = 0;
                }
            for (int i = 0; i < a.Length; i++) {
                for (int j = 0; j < a.Length; j++) {
                    z[i] += mb[i][j]*a[j];
                }
            }
            result = z;
            Console.WriteLine("Func 3   SORT(A)*MB  =     ");
            printVector(result);
            Console.WriteLine("Func3 thread STOP.");
        }




        public static void printMatrix(int[][] matr) {
            for (int i = 0; i < matr.Length; i++) {
                Console.WriteLine("");
                for (int j = 0; j < matr[i].Length; j++) {
                    Console.Write("\t " + matr[i][j]);
                }
            }
            Console.WriteLine("");
        }

        public static void printVector(int[] matr) {
            Console.WriteLine("");
            for (int j = 0; j < matr.Length; j++) {
                Console.Write("\t " + matr[j]);
            }
            Console.WriteLine("");
        }

        public static int[] inputVector(int[] vec) {
            int temp;

            //Console.WriteLine("Input what to put into vector:");
            while (true) {
                try {
                 //   temp = int.Parse(Console.ReadLine());
                    break;
                } catch (Exception e) {
                    Console.WriteLine("Wrong input exception");
                }
            }
            temp = 1; //----------------------------------------
            for (int j = 0; j < vec.Length; j++) {
                vec[j] = temp;
            }

            return vec;
        }

        public static int[][] inputMatrix(int[][] matr) {
            int temp;
            for (int i = 0; i < matr.Length; i++) {
                matr[i] = new int[N];
            }
           // Console.WriteLine("Input what to put into matrix:");
            while (true) {
                try {
                //    temp = int.Parse(Console.ReadLine());
                    break;
                } catch (Exception e) {
                    Console.WriteLine("Wrong input exception");
                }
            }
            temp = 1; //----------------------------------------
            for (int i = 0; i < matr.Length; i++) {
                for (int j = 0; j < matr[i].Length; j++) {
                    matr[i][j] = temp;
                }
            }
            return matr;
        }

        static void sortVector(int[] vec)
        {
            int temp;
            for (int j = 0; j < vec.Length; j++)
            {
                for (int o = 0; o < (j + 1); o++)
                {
                    if (vec[j] < vec[o])
                    {
                        vec[j] = vec[j] ^ vec[o];
                        vec[o] = vec[j] ^ vec[o];
                        vec[j] = vec[j] ^ vec[o];
                    }
                }
            }
        }


        static void sortVector1(int[] vec)
        {
            for (int j = 0; j < vec.Length; j++)
            {
                for (int o = 0; o < (j + 1); o++)
                {
                    if (vec[j] > vec[o])
                    {
                        vec[j] = vec[j] ^ vec[o];
                        vec[o] = vec[j] ^ vec[o];
                        vec[j] = vec[j] ^ vec[o];
                    }
                }
            }
        }
    }
}
