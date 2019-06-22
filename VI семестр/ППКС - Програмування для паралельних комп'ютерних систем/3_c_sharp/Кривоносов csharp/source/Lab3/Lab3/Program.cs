using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
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
 * File Program.cs                                             *
 *                                                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */

namespace lab3
{
    class Program : Operations
    {
        public const int N = 6;
        public const int P = 6;
        public const int H = N / P;

        public static EventWaitHandle Evn1_23456;
        public static EventWaitHandle Evn3_12456;
        public static EventWaitHandle Evn4_12356;

        public static EventWaitHandle EvnB1_23456;
        public static EventWaitHandle EvnB2_13456;
        public static EventWaitHandle EvnB3_12456;
        public static EventWaitHandle EvnB4_12356;
        public static EventWaitHandle EvnB5_12346;
        public static EventWaitHandle EvnB6_12345;
        

        public static object lock_E = new object();
        public static object monitor_b = new object();

        public static Mutex mutex_MX = new Mutex(false);

        public static Semaphore Sem_A2, Sem_A3, Sem_A4, Sem_A5, Sem_A6;

        public static volatile int alpha;
        public static int b = 0;
        

        public static Vector Z = new Vector(N);
        public static Vector B = new Vector(N);
        public static Vector C = new Vector(N);
        public static Vector E = new Vector(N);
        public static Vector A = new Vector(N);

        public static Matrix MX = new Matrix(N);
        public static Matrix MZ = new Matrix(N);


        /********************************* Задача Т1 *********************************/
        public static void T1()
        {
            Console.WriteLine("Task 1 started");
            /* 1. Введення B, MZ*/
            B = inputVector(N, 1);
            MZ = inputMatrix(N, 1);
            /* 2. Сигнал задачам Т2, Т3, Т4, T5, T6 про введення B, MZ*/
            Evn1_23456.Set();

            /* 3. Чекати на введення C, Z у задачі Т3 */
            Evn3_12456.WaitOne();

            /* 4. Чекати на введення α, E, MX у задачі T4 */

            Evn4_12356.WaitOne();

            /* 5. Обчислення: b1 = Bн*Cн  */
            int b1 = 0;
            for (int i = 0; i < H; i++)
            {
                b1 += B.get(i) * C.get(i);
            }
            /* 6. Обчислення: b = b + b1 */
            try
            {
                Monitor.Enter(monitor_b);
                b = b + b1;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }
            /* 7. Сигнал задачам Т2, Т3, Т4, T5,T6 про обчислення b */

            EvnB1_23456.Set();
            /* 8. Чекати на завершення обчислень b в Т2 */
            EvnB2_13456.WaitOne();
            /* 9. Чекати на завершення обчислень b в Т3 */
            EvnB3_12456.WaitOne();
            /* 10. Чекати на завершення обчислень b в Т4 */
            EvnB4_12356.WaitOne();
            /* 11. Чекати на завершення обчислень b в Т5 */
            EvnB5_12346.WaitOne();
            /* 12. Чекати на завершення обчислень b в Т6 */
            EvnB6_12345.WaitOne();

            /* 13. Копіювання: E1=E */
            Vector E1 = new Vector(N);
            lock (lock_E) {
              E1 = E;
            }
            /*14. Копіювання: МХ1 := МХ */
            Matrix MX1 = new Matrix(N);
            mutex_MX.WaitOne();
             MX1 = MX;
            mutex_MX.ReleaseMutex();
            /* 15. Копіювання: α1= α */
            int alpha1 = alpha;
            /* 16. Копіювання: b1 := b */
            try 
            {
                Monitor.Enter(monitor_b);
                b1 = b;
            }
            finally {
                Monitor.Exit(monitor_b);
            }

            /* 17. Обчислення: AН = b1*ZH + α1*E1*(MX1*MZH) */
             Vector buf = new Vector(H);
              buf = add(mult(b1, Z, 0, H), mult(alpha1, mult(E1, mult(MX1, MZ, 0, H), 0, H), 0, H), 0, H);
           
             for (int i = 0; i < H; i++)
            {
                A.set(i, buf.get(i));
            }
            /* 18. Чекати на завершення обчислень A в T2, T3, T4, Т5, Т6 */
             Sem_A2.WaitOne();
             Sem_A3.WaitOne();
             Sem_A4.WaitOne();
             Sem_A5.WaitOne();
             Sem_A6.WaitOne();
             /* 19. Виведення A */
             outputVector(A);
             Console.WriteLine("Task 1 finished");

            
        }

        /********************************* Задача Т2 *********************************/
        public static void T2()
        {
            Console.WriteLine("Task 2 started");
            /* 1. Чекати на введення B, MZ у задачі T1*/
            Evn1_23456.WaitOne();
            

            /* 2. Чекати на введення C, Z у задачі Т3 */
            Evn3_12456.WaitOne();

            /* 3. Чекати на введення α, E, MX у задачі T4 */

            Evn4_12356.WaitOne();

            /* 4. Обчислення: b2 = Bн*Cн  */
            int b2 = 0;
            for (int i = H; i < H*2; i++)
            {
                b2 += B.get(i) * C.get(i);
            }
            /* 5. Обчислення: b = b + b2 */
            try
            {
                Monitor.Enter(monitor_b);
                b = b + b2;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }
            /* 6. Сигнал задачам Т1, Т3, Т4, T5,T6 про обчислення b */

            EvnB2_13456.Set();
            /* 7. Чекати на завершення обчислень b в Т1 */
            EvnB1_23456.WaitOne();
            /* 8. Чекати на завершення обчислень b в Т3 */
            EvnB3_12456.WaitOne();
            /* 9. Чекати на завершення обчислень b в Т4 */
            EvnB4_12356.WaitOne();
            /* 10. Чекати на завершення обчислень b в Т5 */
            EvnB5_12346.WaitOne();
            /* 11. Чекати на завершення обчислень b в Т6 */
            EvnB6_12345.WaitOne();

            /* 12. Копіювання: E2=E */
            Vector E2 = new Vector(N);
            lock (lock_E)
            {
                E2 = E;
            }
            /*13. Копіювання: МХ2 := МХ */
            Matrix MX2 = new Matrix(N);
            mutex_MX.WaitOne();
            MX2 = MX;
            mutex_MX.ReleaseMutex();
            /* 14. Копіювання: α2= α */
            int alpha2 = alpha;
            /* 15. Копіювання: b1 := b */
            try
            {
                Monitor.Enter(monitor_b);
                b2 = b;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }

            /* 16. Обчислення: AН = b2*ZH + α2*E2*(MX2*MZH) */
            Vector buf = new Vector(H);
            buf = add(mult(b2, Z, H, 2*H), mult(alpha2, mult(E2, mult(MX2, MZ, H, 2*H), H, 2*H), H, 2*H), H, 2*H);

            for (int i = H; i < H*2; i++)
            {
                A.set(i, buf.get(i));
            }
            /* 17. Сигнал T1 про завершення обчислень A */
            Sem_A2.Release();
            Console.WriteLine("Task 2 finished");
        }

        /********************************* Задача Т3 *********************************/
        public static void T3()
        {
            Console.WriteLine("Task 3 started");
            /* 1. Введення C, Z*/
            C = inputVector(N, 1);
            Z = inputVector(N, 1);
            /* 2. Сигнал задачам Т1, Т2, Т4, T5, T6 про введення B, MZ*/
            Evn3_12456.Set();

            /* 3. Чекати на введення B, MZ  у задачі Т1 */
            Evn1_23456.WaitOne();

            /* 4. Чекати на введення α, E, MX у задачі T4 */

            Evn4_12356.WaitOne();

            /* 5. Обчислення: b3 = Bн*Cн  */
            int b3 = 0;
            for (int i = 2*H; i < H*3; i++)
            {
                b3 += B.get(i) * C.get(i);
            }
            /* 6. Обчислення: b = b + b1 */
            try
            {
                Monitor.Enter(monitor_b);
                b = b + b3;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }
            /* 7. Сигнал задачам Т1, Т2, Т4, T5,T6 про обчислення b */

            EvnB3_12456.Set();
            /* 8. Чекати на завершення обчислень b в Т1 */
            EvnB1_23456.WaitOne();
            /* 9. Чекати на завершення обчислень b в Т2 */
            EvnB2_13456.WaitOne();
            /* 10. Чекати на завершення обчислень b в Т4 */
            EvnB4_12356.WaitOne();
            /* 11. Чекати на завершення обчислень b в Т5 */
            EvnB5_12346.WaitOne();
            /* 12. Чекати на завершення обчислень b в Т6 */
            EvnB6_12345.WaitOne();

            /* 13. Копіювання: E3=E */
            Vector E3 = new Vector(N);
            lock (lock_E)
            {
                E3 = E;
            }
            /*14. Копіювання: МХ3 := МХ */
            Matrix MX3 = new Matrix(N);
            mutex_MX.WaitOne();
            MX3 = MX;
            mutex_MX.ReleaseMutex();
            /* 15. Копіювання: α3= α */
            int alpha3 = alpha;
            /* 16. Копіювання: b3 := b */
            try
            {
                Monitor.Enter(monitor_b);
                b3 = b;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }

            /* 17. Обчислення: AН = b3*ZH + α3*E3*(MX3*MZH) */
            Vector buf = new Vector(H);
            buf = add(mult(b3, Z, 2 * H, 3 * H), mult(alpha3, mult(E3, mult(MX3, MZ, 2 * H, 3 * H), 2 * H, 3 * H), 2 * H, 3 * H), 2 * H, 3 * H);

            for (int i = 2*H; i < H*3; i++)
            {
                A.set(i, buf.get(i));
            }

            /* 18. Сигнал T1 про завершення обчислень A */
            Sem_A3.Release();
            Console.WriteLine("Task 3 finished");
        }

        /********************************* Задача Т4 *********************************/
        public static void T4()
        {
            Console.WriteLine("Task 4 started");
            /* 1. Введення α, E, MX*/
            E = inputVector(N, 1);
            MX = inputMatrix(N, 1);
            alpha = 1;
            /* 2. Сигнал задачам Т1, Т2, Т3, T5, T6 про введення B, MZ*/
            Evn4_12356.Set();

            /* 3. Чекати на введення B, MZ  у задачі Т1 */
            Evn1_23456.WaitOne();

            /* 4. Чекати на введення C, Z  у задачі T3 */

            Evn3_12456.WaitOne();

            /* 5. Обчислення: b4 = Bн*Cн  */
            int b4 = 0;
            for (int i = 3 * H; i < H * 4; i++)
            {
                b4 += B.get(i) * C.get(i);
            }
            /* 6. Обчислення: b = b + b1 */
            try
            {
                Monitor.Enter(monitor_b);
                b = b + b4;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }
            /* 7. Сигнал задачам Т1, Т2, Т3, T5,T6 про обчислення b */

            EvnB4_12356.Set();
            /* 8. Чекати на завершення обчислень b в Т1 */
            EvnB1_23456.WaitOne();
            /* 9. Чекати на завершення обчислень b в Т2 */
            EvnB2_13456.WaitOne();
            /* 10. Чекати на завершення обчислень b в Т3 */
            EvnB3_12456.WaitOne();
            /* 11. Чекати на завершення обчислень b в Т5 */
            EvnB5_12346.WaitOne();
            /* 12. Чекати на завершення обчислень b в Т6 */
            EvnB6_12345.WaitOne();

            /* 13. Копіювання: E4=E */
            Vector E4 = new Vector(N);
            lock (lock_E)
            {
                E4 = E;
            }
            /*14. Копіювання: МХ4 := МХ */
            Matrix MX4 = new Matrix(N);
            mutex_MX.WaitOne();
            MX4 = MX;
            mutex_MX.ReleaseMutex();
            /* 15. Копіювання: α3= α */
            int alpha3 = alpha;
            /* 16. Копіювання: b3 := b */
            try
            {
                Monitor.Enter(monitor_b);
                b4 = b;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }

            /* 17. Обчислення: AН = b4*ZH + α4*E4*(MX4*MZH) */
            Vector buf = new Vector(H);

            buf = add(mult(b4, Z, 3 * H, 4 * H), mult(alpha3, mult(E4, mult(MX4, MZ, 3 * H, 4 * H), 3 * H, 4 * H), 3 * H, 4 * H), 3 * H, 4 * H);

            for (int i = 3 * H; i < H * 4; i++)
            {
                A.set(i, buf.get(i));
            }

            /* 18. Сигнал T1 про завершення обчислень A */
            Sem_A4.Release();
            Console.WriteLine("Task 4 finished");
        }
        /********************************* Задача Т5 *********************************/
        public static void T5()
        {
            Console.WriteLine("Task 5 started");
            /* 1. Чекати на введення B, MZ у задачі T1*/
            Evn1_23456.WaitOne();


            /* 2. Чекати на введення C, Z у задачі Т3 */
            Evn3_12456.WaitOne();

            /* 3. Чекати на введення α, E, MX у задачі T4 */

            Evn4_12356.WaitOne();

            /* 4. Обчислення: b5 = Bн*Cн  */
            int b5 = 0;
            for (int i = H*4; i < H * 5; i++)
            {
                b5 += B.get(i) * C.get(i);
            }
            /* 5. Обчислення: b = b + b5 */
            try
            {
                Monitor.Enter(monitor_b);
                b = b + b5;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }
            /* 6. Сигнал задачам Т1, Т2, Т3, T4,T6 про обчислення b */

            EvnB5_12346.Set();
            /* 7. Чекати на завершення обчислень b в Т1 */
            EvnB1_23456.WaitOne();
            /* 8. Чекати на завершення обчислень b в Т2 */
            EvnB2_13456.WaitOne();
            /* 9. Чекати на завершення обчислень b в Т3 */
            EvnB3_12456.WaitOne();
            /* 10. Чекати на завершення обчислень b в Т4 */
            EvnB4_12356.WaitOne();
            /* 11. Чекати на завершення обчислень b в Т6 */
            EvnB6_12345.WaitOne();

            /* 12. Копіювання: E5=E */
            Vector E5 = new Vector(N);
            lock (lock_E)
            {
                E5 = E;
            }
            /*13. Копіювання: МХ5 := МХ */
            Matrix MX5 = new Matrix(N);
            mutex_MX.WaitOne();
            MX5 = MX;
            mutex_MX.ReleaseMutex();
            /* 14. Копіювання: α5= α */
            int alpha5 = alpha;
            /* 15. Копіювання: b5 := b */
            try
            {
                Monitor.Enter(monitor_b);
                b5 = b;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }

            /* 16. Обчислення: AН = b5*ZH + α5*E5*(MX5*MZH) */
            Vector buf = new Vector(H);
            buf = add(mult(b5, Z, 4 * H, 5 * H), mult(alpha5, mult(E5, mult(MX5, MZ, 4 * H, 5 * H), 4 * H, 5 * H), 4 * H, 5 * H), 4 * H, 5 * H);

            for (int i = 4*H; i < H * 5; i++)
            {
                A.set(i, buf.get(i));
            }
            /* 17. Сигнал T1 про завершення обчислень A */
            Sem_A5.Release();
            Console.WriteLine("Task 5 finished");
        }
        /********************************* Задача Т6 *********************************/
        public static void T6()
        {
            Console.WriteLine("Task 6 started");
            /* 1. Чекати на введення B, MZ у задачі T1*/
            Evn1_23456.WaitOne();


            /* 2. Чекати на введення C, Z у задачі Т3 */
            Evn3_12456.WaitOne();

            /* 3. Чекати на введення α, E, MX у задачі T4 */

            Evn4_12356.WaitOne();

            /* 4. Обчислення: b6 = Bн*Cн  */
            int b6 = 0;
            for (int i = H * 5; i < H * 6; i++)
            {
                b6 += B.get(i) * C.get(i);
                
            }
            /* 5. Обчислення: b = b + b6 */
            try
            {
                Monitor.Enter(monitor_b);
                b = b + b6;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }
            /* 6. Сигнал задачам Т1, Т2, Т3, T4,T5 про обчислення b */

            EvnB6_12345.Set();
            /* 7. Чекати на завершення обчислень b в Т1 */
            EvnB1_23456.WaitOne();
            /* 8. Чекати на завершення обчислень b в Т2 */
            EvnB2_13456.WaitOne();
            /* 9. Чекати на завершення обчислень b в Т3 */
            EvnB3_12456.WaitOne();
            /* 10. Чекати на завершення обчислень b в Т4 */
            EvnB4_12356.WaitOne();
            /* 11. Чекати на завершення обчислень b в Т6 */
            EvnB5_12346.WaitOne();

            /* 12. Копіювання: E6=E */
            Vector E6 = new Vector(N);
            lock (lock_E)
            {
                E6 = E;
            }
            /*13. Копіювання: МХ6 := МХ */
            Matrix MX6 = new Matrix(N);
            mutex_MX.WaitOne();
            MX6 = MX;
            mutex_MX.ReleaseMutex();
            /* 14. Копіювання: α6 = α */
            int alpha6 = alpha;
            /* 15. Копіювання: b6 := b */
            try
            {
                Monitor.Enter(monitor_b);
                b6 = b;
            }
            finally
            {
                Monitor.Exit(monitor_b);
            }

            /* 16. Обчислення: AН = b6*ZH + α6*E6*(MX6*MZH) */
            Vector buf = new Vector(H);
           
            buf = add(mult(b6, Z, 5 * H, 6 * H), mult(alpha6, mult(E6, mult(MX6, MZ, 5 * H, 6 * H), 5 * H, 6 * H), 5 * H, 6 * H), 5 * H, 6 * H);

            for (int i = 5 * H; i < H * 6; i++)
            {
                A.set(i, buf.get(i));
            }
            /* 17. Сигнал T1 про завершення обчислень A */
            Sem_A6.Release();
            Console.WriteLine("Task 6 finished");
        }
        static void Main(string[] args)
        {
            System.Console.WriteLine("Lab3 started");
            Evn1_23456 = new ManualResetEvent(false);
            Evn3_12456 = new ManualResetEvent(false);
            Evn4_12356 = new ManualResetEvent(false);

            EvnB1_23456 = new ManualResetEvent(false);
            EvnB2_13456 = new ManualResetEvent(false);
            EvnB3_12456 = new ManualResetEvent(false);
            EvnB4_12356 = new ManualResetEvent(false);
            EvnB5_12346 = new ManualResetEvent(false);
            EvnB6_12345 = new ManualResetEvent(false);


            Sem_A2 = new Semaphore(0, 1);
            Sem_A3 = new Semaphore(0, 1);
            Sem_A4 = new Semaphore(0, 1);
            Sem_A5 = new Semaphore(0, 1);
            Sem_A6 = new Semaphore(0, 1);
           

            Thread t1 = new Thread(T1);
            Thread t2 = new Thread(T2);
            Thread t3 = new Thread(T3);
            Thread t4 = new Thread(T4);
            Thread t5 = new Thread(T5);
            Thread t6 = new Thread(T6);

            t1.Start();
            t2.Start();
            t3.Start();
            t4.Start();
            t5.Start();
            t6.Start();

            System.Console.WriteLine("Lab3 finished");
            System.Console.ReadLine();
        }
    }
}
