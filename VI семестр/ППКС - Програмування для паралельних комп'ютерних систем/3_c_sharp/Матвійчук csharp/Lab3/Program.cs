using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using Win32;



//--------------------------------------------
//-----ПРО. Лаб 3. C#
//-----Матвийчук Богдан ИВ-91
//-----a = max(B*l + C*(MO*MK))
//-----28.03.2012

namespace Lab3
{


    class Program
    {
        public static int N = 100;
        public static int P = 4;
        public static int H = N / P;

        public static int l;
        public static int[] C = new int[N];
        public static int[] B = new int[N];
        public static int[] V = new int[N];
        public static int[,] MK = new int[N, N];
        public static int[,] MX = new int[N, N];
        volatile public static int[,] MO = new int[N, N];

        public static int a = int.MinValue;

        public static Mutex Mtx;

        public static EventWaitHandle E1, E2, E4;
        public static EventWaitHandle[] events = new EventWaitHandle[3];

        public static Semaphore sem3, sem2, sem4;
        public static Semaphore[] semaphores = new Semaphore[3];

        public static object CS1 = new object();
        public static object CS2 = new object();

        static void Main(string[] args)
        {
            Mtx = new Mutex(false);
            E1 = new ManualResetEvent(false);
            E2 = new ManualResetEvent(false);
            E4 = new ManualResetEvent(false);

            events[0] = E1;
            events[1] = E2;
            events[2] = E4;

            sem3 = new Semaphore(0, 1);
            sem2 = new Semaphore(0, 1);
            sem4 = new Semaphore(0, 1);
            semaphores[0] = sem3;
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
            l = 1;
            VectorInput(B);
            VectorInput(C);
            E1.Set();
	        EventWaitHandle.WaitAll(events);
            int [] C1 = new int [N];
            lock (CS1)
            {
               C1 = C;
            }

            int [,] MK1 = new int [N,N];
            lock (CS2)
            {
                MK1 = MK;
            }

            kernel(0, MO, MK1, B, C1, l);
            Semaphore.WaitAll(semaphores);
            Console.Write("a= ");
            Console.WriteLine(a);
        }

        static void T2()
        {
            Console.Write("Task 2 started.\n");
            matrixInput(MO);
            E2.Set();
            EventWaitHandle.WaitAll(events);
            int[] C2 = new int[N];
            lock (CS1)
            {
                C2 = C;
            }

            int[,] MK2 = new int[N, N];
            lock (CS2)
            {
                MK2 = MK;
            }
            kernel(1, MO, MK2, B, C2, l);
            sem2.Release();

            //Console.Write("Task 2 finished.\n");
        }

        static void T3()
        {
            Console.Write("Task 3 started.\n");
            EventWaitHandle.WaitAll(events);
            int[] C3 = new int[N];
            lock (CS1)
            {
                C3 = C;
            }

            int[,] MK3 = new int[N, N];
            lock (CS2)
            {
                MK3 = MK;
            }
            kernel(2, MO, MK3, B, C3, l);
            sem3.Release();
         }

        static void T4()
        {
            Console.Write("Task 4 started.\n");
            matrixInput(MK);
            E4.Set();
            EventWaitHandle.WaitAll(events);
            int[] C4 = new int[N];
            lock (CS1)
            {
                C4 = C;
            }

            int[,] MK4 = new int[N, N];
            lock (CS2)
            {
                MK4 = MK;
            }
            kernel(3, MO, MK4, B, C4, l);
            sem4.Release();
        }

        static void matrixInput(int[,] matrix)
        {
	        for (int i=0; i<N; i++){
 		        for (int j=0; j<N; j++){
                    matrix[i,j] = 1;
 		        }
 	        }
         }

        static void VectorInput(int[] m)
        {
            for (int i = 0; i < N; i++)
            {
               m[i] = 1;
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

        static void kernel(int id, int[,] M1, int[,] M2, int[] V1, int[] V2,int al)
        {
            HiPerfTimer pt = new HiPerfTimer();     // create a new PerfTimer object
            pt.Start();                             // start the timer
            int max = 0;

            for (int j = H * id; j < H * (id + 1); j++)
            {
                V1[j] = V1[j] * al;
                //M1*M2; al*v1		
                for (int i = 0; i < N; i++)
                {
                    MX[i, j] = 0;
                    for (int k = 0; k < N; k++)
                    {
                        MX[i, j] += M1[i, k] * M2[j, k];
                    }
                }
                for (int i = 0; i < N; i++)
                {
                    V[j] += MX[i, j] * V2[j];
               }
                V[j] += V1[j];
                if (max < V[j])
                    max = V[j];
            }

            Mtx.WaitOne();
             if (a < max) a = max;
            Mtx.ReleaseMutex();

            pt.Stop();                              // stop the timer

            Console.Write("Task ");
            Console.Write(id+1);
            Console.Write(" end ");
            Console.Write('\n');
            Console.Write(" time: {0} (ms)\n", pt.Duration); // print the duration of the timed code

        }
    }
}