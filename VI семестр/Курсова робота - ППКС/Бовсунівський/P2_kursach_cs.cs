/*
 * Kursova P2
 * Bovsunivsky Oleg
 * Group IO-01
 * Task: Ah = Bh + C * (MO * ( MXh * MZ)) 
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace pro2_lab3_tar {
    class Program {
        private const int n = 600;
        private const int p = 4;
        private const int h = n / p;

        private static int[] A = new int[n];//out
        private static int[] B = new int[n];
        private static int[] C = new int[n];
        private static int[][] MO = new int[n][];
        private static int[][] MZ = new int[n][];
        private static int[][] MX = new int[n][];

        private static Mutex mutex = new Mutex(false);
        private static Semaphore semaphore = new Semaphore(0, 3);
        private static EventWaitHandle event1 = new ManualResetEvent(false);
        private static EventWaitHandle event2 = new ManualResetEvent(false);
        private static EventWaitHandle event3 = new ManualResetEvent(false);
        private static EventWaitHandle event4 = new ManualResetEvent(false);
        private static EventWaitHandle event5 = new ManualResetEvent(false);
        private static object lockObject = new object();

        //time
        static DateTime startTime;

        private static void Task1() {
            Console.WriteLine("Task1 started\n");
            int[] C1 = new int[n];
            int[][] MO1 = new int[n][];
            int[][] MZ1 = new int[n][];

            // Ожидание сигнал от T2 о завершении ввода.
            semaphore.WaitOne();

            // Копия MO1 = MO, MZ1 = MZ
            mutex.WaitOne();
            for (int i = 0; i < n; i++) {
                MO1[i] = new int[n];
                MZ1[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    MO1[i][j] = MO[i][j];
                    MZ1[i][j] = MZ[i][j];
                }
            }
            mutex.ReleaseMutex();
            // Копия С1 = С
            lock (lockObject) {
                for (int i = 0; i < n; i++) {
                    C1[i] = C[i];
                }
            }
            // Счет AH = BH + C1 * ( MO1 * ( MZ1 * MXH) )
            int[][] temp1 = new int[n][];
            for (int i = 0; i < h; i++) {
                temp1[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    temp1[i][j] = 0;
                    for (int k = 0; k < n; k++) {
                        temp1[i][j] += MZ1[k][j] * MX[i][k];
                    }
                }
            }
            int[][] temp2 = new int[n][];
            for (int i = 0; i < h; i++) {
                temp2[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    temp2[i][j] = 0;
                    for (int k = 0; k < n; k++) {
                        temp2[i][j] += MO1[k][j] * temp1[i][k];
                    }
                }
            }
            for (int i = 0; i < h; i++) {
                A[i] = 0;
                for (int j = 0; j < n; j++) {
                    A[i] += C1[j] * temp2[i][j];
                }
                A[i] += B[i];
            }
            // Сигнал Т2 о завершении счета
            event1.Set();
            Console.WriteLine("\nTask1 Finished");
        }

        private static void Task2() {
            Console.WriteLine("Task2 started\n");
            int[] C2 = new int[n];
            int[][] MO2 = new int[n][];
            int[][] MZ2 = new int[n][];

            // Ввод MX, B, C
            for (int i = 0; i < n; i++) {
                MX[i] = new int[n];
                B[i] = 1;
                C[i] = 1;
                for (int j = 0; j < n; j++) {
                    MX[i][j] = 1;
                }
            }

            // Ожидание сигнал от Т3 о завершении счетa
            event4.WaitOne();
            // Ожидание сигнал от Т4 о завершении счетa
            event5.WaitOne();

            // Сигнал T1, T3, T4 о завершении ввода
            semaphore.Release(3);

            // Копия MO2 = MO, MZ2 = MZ
            mutex.WaitOne();
            for (int i = 0; i < n; i++) {
                MO2[i] = new int[n];
                MZ2[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    MO2[i][j] = MO[i][j];
                    MZ2[i][j] = MZ[i][j];
                }
            }
            mutex.ReleaseMutex();
            // Копия С2 = С
            lock (lockObject) {
                for (int i = 0; i < n; i++) {
                    C2[i] = C[i];
                }
            }
            // Счет AH = BH + C1 * ( MO1 * ( MZ1 * MXH) )
            int[][] temp1 = new int[n][];
            for (int i = h; i < 2 * h; i++) {
                temp1[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    temp1[i][j] = 0;
                    for (int k = 0; k < n; k++) {
                        temp1[i][j] += MZ2[k][j] * MX[i][k];
                    }
                }
            }
            int[][] temp2 = new int[n][];
            for (int i = h; i < 2 * h; i++) {
                temp2[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    temp2[i][j] = 0;
                    for (int k = 0; k < n; k++) {
                        temp2[i][j] += MO2[k][j] * temp1[i][k];
                    }
                }
            }
            for (int i = h; i < 2 * h; i++) {
                A[i] = 0;
                for (int j = 0; j < n; j++) {
                    A[i] += C2[j] * temp2[i][j];
                }
                A[i] += B[i];
            }

            // Ожидание сигнал от Т1 о завершении счетa
            event1.WaitOne();
            // Ожидание сигнал от Т3 о завершении счетa
            event2.WaitOne();
            // Ожидание сигнал от Т4 о завершении счетa
            event3.WaitOne();
            // Вывод 
            Console.WriteLine("\n");
            if (n < 10) {
                for (int i = 0; i < n; i++) {
                    Console.WriteLine(A[i]);
                }
            }

            Console.WriteLine("\nTask2 Finished");

            Console.WriteLine("time=" + DateTime.Now.Minute + ":" + DateTime.Now.Second + ":" + DateTime.Now.Millisecond);
            DateTime diff = new DateTime((DateTime.Now - startTime).Ticks);
            Console.WriteLine("difference=" + diff.Minute + ":" + diff.Second + ":" + diff.Millisecond);
        }

        private static void Task3() {
            Console.WriteLine("Task3 started\n");
            int[] C3 = new int[n];
            int[][] MO3 = new int[n][];
            int[][] MZ3 = new int[n][];

            // Ввод MO
            for (int i = 0; i < n; i++) {
                MO[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    MO[i][j] = 1;
                }
            }

            // Сигнал Т2 о завершении ввода
            event4.Set();

            // Ожидание сигнал от Т2 о завершении ввода.
            semaphore.WaitOne();
            // Копия MO3 = MO, MZ3 = MZ
            mutex.WaitOne();
            for (int i = 0; i < n; i++) {
                MO3[i] = new int[n];
                MZ3[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    MO3[i][j] = MO[i][j];
                    MZ3[i][j] = MZ[i][j];
                }
            }
            mutex.ReleaseMutex();
            // Копия С3 = С
            lock (lockObject) {
                for (int i = 0; i < n; i++) {
                    C3[i] = C[i];
                }
            }
            // Счет AH = BH + C3 * ( MO3 * ( MZ3 * MXH) )
            int[][] temp1 = new int[n][];
            for (int i = 2 * h; i < 3 * h; i++) {
                temp1[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    temp1[i][j] = 0;
                    for (int k = 0; k < n; k++) {
                        temp1[i][j] += MZ3[k][j] * MX[i][k];
                    }
                }
            }
            int[][] temp2 = new int[n][];
            for (int i = 2 * h; i < 3 * h; i++) {
                temp2[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    temp2[i][j] = 0;
                    for (int k = 0; k < n; k++) {
                        temp2[i][j] += MO3[k][j] * temp1[i][k];
                    }
                }
            }
            for (int i = 2 * h; i < 3 * h; i++) {
                A[i] = 0;
                for (int j = 0; j < n; j++) {
                    A[i] += C3[j] * temp2[i][j];
                }
                A[i] += B[i];
            }
            // Сигнал Т2 о завершении счета
            event2.Set();
            Console.WriteLine("\nTask3 Finished");
        }


        private static void Task4() {
            Console.WriteLine("Task4 started\n");
            int[] C4 = new int[n];
            int[][] MO4 = new int[n][];
            int[][] MZ4 = new int[n][];

            // Ввод MZ
            for (int i = 0; i < n; i++) {
                MZ[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    MZ[i][j] = 1;
                }
            }

            // Сигнал Т2 о завершении ввода
            event5.Set();

            // Ожидание сигнал от Т2 о завершении ввода.
            semaphore.WaitOne();
            // Копия MO4 = MO, MZ4 = MZ
            mutex.WaitOne();
            for (int i = 0; i < n; i++) {
                MO4[i] = new int[n];
                MZ4[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    MO4[i][j] = MO[i][j];
                    MZ4[i][j] = MZ[i][j];
                }
            }
            mutex.ReleaseMutex();
            // Копия С4 = С
            lock (lockObject) {
                for (int i = 0; i < n; i++) {
                    C4[i] = C[i];
                }
            }
            // Счет AH = BH + C4 * ( MO4 * ( MZ4 * MXH) )
            int[][] temp1 = new int[n][];
            for (int i = 3 * h; i < n; i++) {
                temp1[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    temp1[i][j] = 0;
                    for (int k = 0; k < n; k++) {
                        temp1[i][j] += MZ4[k][j] * MX[i][k];
                    }
                }
            }
            int[][] temp2 = new int[n][];
            for (int i = 3 * h; i < n; i++) {
                temp2[i] = new int[n];
                for (int j = 0; j < n; j++) {
                    temp2[i][j] = 0;
                    for (int k = 0; k < n; k++) {
                        temp2[i][j] += MO4[k][j] * temp1[i][k];
                    }
                }
            }
            for (int i = 3 * h; i < n; i++) {
                A[i] = 0;
                for (int j = 0; j < n; j++) {
                    A[i] += C4[j] * temp2[i][j];
                }
                A[i] += B[i];
            }
            // Сигнал Т2 о завершении счета
            event3.Set();
            Console.WriteLine("\nTask4 Finished");
        }

        static void Main(string[] args) {
            startTime = DateTime.Now;
            Console.WriteLine("time=" + DateTime.Now.Minute + ":" + DateTime.Now.Second + ":" + DateTime.Now.Millisecond);

            Thread thread1 = new Thread(Task1);
            Thread thread2 = new Thread(Task2);
            Thread thread3 = new Thread(Task3);
            Thread thread4 = new Thread(Task4);

            thread1.Start();
            thread2.Start();
            thread3.Start();
            thread4.Start();

            Console.ReadKey();
        }
    }
}
