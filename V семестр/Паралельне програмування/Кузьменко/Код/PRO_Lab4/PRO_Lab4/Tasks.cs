

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

/*
 * ************************************************
 *                                                *                  
 *    Tasks  for calculating                      *
 *                                                *
 *  Autor: Kuzmenko Volodia                       *
 *  Group: IO-21                                  *
 *  Date: 1.10.2014                               *
 *                                                *
 **************************************************
 */
namespace PRO_Lab4
{
    class Tasks : Data
    {
              public Tasks(int n, int value) : base(n, value)
        {

        }
              public void Task1()
              {
                  
                int []A,B,C,E;
                int [,] MA,MZ;
		
                Console.WriteLine("Input vector A in T1");
                A = vector_input();
                Console.WriteLine("Output vector A from T1");
                vector_output(A);
		
                Console.WriteLine("Input vector B in T1");
                B = vector_input();
                Console.WriteLine("Output vector B from T1");
                vector_output(B);

                Console.WriteLine("Input vector C in T1");
                C = vector_input();
                Console.WriteLine("Output vector C from T1");
                vector_output(C);
		
                Console.WriteLine("Input matrix MA in T1 ");
                MA = matrix_input();
                Console.WriteLine("Output matrix MA from T1");
                matrix_output(MA);
		
                Console.WriteLine("Input matrix MZ in T1");
                MZ = matrix_input();
                Console.WriteLine("Output matrix MZ from T1");
                matrix_output(MZ);

                Console.WriteLine("Calculation T1...");

                Thread.Sleep(1000);
		
                E = func1(A, B, C, MA, MZ);
                Console.WriteLine("F1:");
                vector_output(E);
                Console.WriteLine("Task 1 finished");
            }
            public void Task2()
            {
                  
                Console.WriteLine("Task 2 started");
		
		        int[,] MA, MB, MC, MM;
		        Console.WriteLine("Input matrix MA in T2");
		        MA = matrix_input();
		        Console.WriteLine("Output matrix MA from T2");
		        matrix_output(MA);

		        Console.WriteLine("Input matrix MB in T2");
		        MB = matrix_input();
		        Console.WriteLine("Output matrix MB from T2");
		        matrix_output(MB);

		        Console.WriteLine("Input matrix MM in T2");
		        MM = matrix_input();
		        Console.WriteLine("Output matrix MM from T2");
		        matrix_output(MM);

		        Console.WriteLine("Calculation T2... ");
		
	            Thread.Sleep(5000);
		
		        MC = func2(MA, MB, MM);
	            Console.WriteLine("F2: ");
		        matrix_output(MC);

                Console.WriteLine("Task 2 finished");
            }
            public void Task3()
            {
                Console.WriteLine("Task 3 started");
		        int[,] MA, MS, MM;
		        int P;
                Thread.Sleep(0);
		        Console.WriteLine("Input matrix MA in T3");
		        MA = matrix_input();
		        Console.WriteLine("Output matrix MA from T3");
		        matrix_output(MA);

		        Console.WriteLine("Input matrix MM in T3");
		        MM = matrix_input();
		        Console.WriteLine("Output matrix MM from T3");
		        matrix_output(MM);

		        Console.WriteLine("Input matrix MS in T3");
		        MS = matrix_input();
		        Console.WriteLine("Output matrix MS from T3");
		        matrix_output(MS);

		        Console.WriteLine("Calculation T3...");
		
                Thread.Sleep(6000);
		
		        P = func3(MA, MM, MS);
		        Console.WriteLine("F3: ");
		        Console.WriteLine(P);

		        Console.WriteLine("Task 3 finished");
            }

            private int[] func1(int[] A, int[] B, int[] C, int[,] MA, int[,] MZ)
            {
                return addVec(addVec(multingMatrixOnVector(multMatr(MA, MZ), C), A), B);
            }

            private int[,] func2(int[,] MA, int[,] MB, int[,] MM)
            {
                return sortMatr(addMatr(multMatr(MB, MM), MA));
            }

            private int func3(int[,] MA, int[,] MM, int[,] MS)
            {
                return maxElement(addMatr(sortMatr(MS), multMatr(MA, MM)));
            }

    }
}
