using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using Win32;



//--------------------------------------------
//-----ПРО. Лаб 3. C#
//-----Грубьй Павел ИВ-73
//-----a = max(MB + MC*MZ)
//-----10.03.2010

namespace Lab3
{


    class Program
    {
        public static int N = 3000;
        public static int P = 4;
        public static int H = N / P;

        public static int[,] MB = new int[N, N];
        public static int[,] MZ = new int[N, N];
        public static int[,] MX = new int[N, N];

        volatile public static int[,] MC = new int[N, N];

        public static int a = int.MinValue;

        public static Mutex Mtx;

        public static EventWaitHandle E2, E3;
        public static EventWaitHandle[] events = new EventWaitHandle[2];

        public static Semaphore sem1, sem2, sem4;
        public static Semaphore[] semaphores = new Semaphore[3];

        static void Main(string[] args)
        {
            Mtx = new Mutex(false);

            E2 = new ManualResetEvent(false);
            E3 = new ManualResetEvent(false);
            events[0] = E2;
            events[1] = E3;

            sem1 = new Semaphore(0, 1);
            sem2 = new Semaphore(0, 1);
            sem4 = new Semaphore(0, 1);
            semaphores[0] = sem1;
            semaphores[1] = sem2;
            semaphores[2] = sem4;

            Thread t1 = new Thread(T1);
            Thread t2 = new Thread(T2);
            Thread t3 = new Thread(T3);
            Thread t4 = new Thread(T4);

            t1.Start();
            t2.Start();
            t3.Start();
            t4.Start();

            Console.WriteLine("Main: End");
            Console.ReadKey();
        }

        static void T1()
        {
            Console.Write("Task 1 started.\n");

	        Console.Write("Task 1 waits for E2, E3\n");
	        EventWaitHandle.WaitAll(events);

	        Console.Write("Task 1 started calculations.\n");
	        kernel(0,MC,MZ,MB);
	       // Console.Write("Task 1 ended calculations.\n");

	        sem1.Release();

	        //Console.Write("Task 1 finished.\n");
        }

        static void T2()
        {
            Console.Write("Task 2 started.\n");

            Console.Write("Task 2 inputs data.\n");
            matrixInput(MB);
            matrixInput(MZ);
            E2.Set();

            Console.Write("Task 2 waits for E3\n");
            E3.WaitOne();

            Console.Write("Task 2 started calculations.\n");
            kernel(1, MC, MZ, MB);
           // Console.Write("Task 2 ended calculations.\n");

            sem2.Release();

            //Console.Write("Task 2 finished.\n");
        }

        static void T3()
        {
            Console.Write("Task 3 started.\n");

            Console.Write("Task 3 inputs data.\n");
            matrixInput(MC);
            E3.Set();

            Console.Write("Task 3 waits for E3\n");
            E2.WaitOne();

            Console.Write("Task 3 started calculations.\n");
            kernel(2, MC, MZ, MB);
            //Console.Write("Task 3 ended calculations.\n");

            Semaphore.WaitAll(semaphores);
            if (N <= 8) matrixOutput(MX);
            Console.Write("a= ");
            Console.WriteLine(a);

            //Console.Write("Task 3 finished.\n");
        }

        static void T4()
        {
            Console.Write("Task 4 started.\n");

            Console.Write("Task 4 waits for E2, E3\n");
            EventWaitHandle.WaitAll(events);

            Console.Write("Task 4 started calculations.\n");
            kernel(3, MC, MZ, MB);
            //Console.Write("Task 4 ended calculations.\n");

            sem4.Release();

            //Console.Write("Task 4 finished.\n");
        }

        static void matrixInput(int[,] matrix)
        {
	        for (int i=0; i<N; i++){
 		        for (int j=0; j<N; j++){
                    matrix[i,j] = 1;
 		        }
 	        }
         }

        static void matrixOutput(int[,] matrix)
        {
            String s = "";
	        for (int i=0; i<N; i++){
 		        for (int j=0; j<N; j++){
                    s += matrix[i, j].ToString() + " ";
	            }
                s += "\n";
            }
            Console.Write(s);
        }

        static void kernel(int id, int[,] M1, int[,] M2, int[,] M3)
        {
            HiPerfTimer pt = new HiPerfTimer();     // create a new PerfTimer object
            pt.Start();                             // start the timer

            int max = 0;

            for (int j = H * id; j < H * (id + 1); j++)
            {
                //M1*M2		
                for (int i = 0; i < N; i++)
                {
                    MX[i, j] = 0;
                    for (int k = 0; k < N; k++)
                    {
                        MX[i, j] += M1[i, k] * M2[j, k];
                    }
                }
                //max(M3 + (M1*M2))
                for (int i = 0; i < N; i++)
                {
                    MX[i, j] += M3[i, j];
                    if (max < MX[i, j])
                        max = MX[i, j];
                }
            }
            Mtx.WaitOne();
             if (a < max) a = max;
            Mtx.ReleaseMutex();

            pt.Stop();                              // stop the timer

            Console.Write("Task ");
            Console.Write(id+1);
            Console.Write(" time: {0} (ms)\n", pt.Duration); // print the duration of the timed code

        }
    }
}