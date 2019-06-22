using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
/*
 * ************************************************
 *                                                *
 *         Laboratory work #4.                    *
 *         Threads in C#                          *                  
 *                                                *
 * 	 Task:                                        *
 * 	    F1: 1.24 E = A + C * (MA * MZ) + B        *      
 *      F2: 2.14 MC = SORT(MA + MB * MM)          *      
 *      F3: 3.18 p = MAX(SORT(MS) + MA* MM)       *  
 *                                                *
 *  Autor: Kuzmenko Volodia                       *
 *  Group: IO-21                                  *
 *  Date: 1.10.2014                               *
 *                                                *
 **************************************************
 */
namespace PRO_Lab4
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Input N");
            String lineN = Console.ReadLine();
            int n;
            int.TryParse(lineN , out n);

            Console.WriteLine("Input value");
            String lineValue = Console.ReadLine();
            int value;
            int.TryParse(lineValue, out value);
            Console.WriteLine();

            Tasks tasks = new Tasks(n,value);
            System.Int32 stackSizeT1 = 1000;
            System.Int32 stackSizeT2 = 1000;
            System.Int32 stackSizeT3 = 1000;

            Thread t1 = new Thread(tasks.Task1, stackSizeT1);
            Thread t2 = new Thread(tasks.Task2, stackSizeT2 );
            Thread t3 = new Thread(tasks.Task3, stackSizeT3);

            t1.Name = "Thread 1 to F1";
            t1.Priority = ThreadPriority.Normal;
            
            t2.Name = "Thread 2 to F2";
            t2.Priority = ThreadPriority.Normal;
            
            t3.Name = "Thread 3 to F3";
            t3.Priority = ThreadPriority.Normal;

            t1.Start();
            t2.Start();
            t3.Start();

            Console.ReadLine();

        }
    }
}
