#define Console.WriteLine() System.out.println()

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;



/**
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *                                                             *
 *             Laboratory work #4. Threads in C#               *
 *                                                             *
 * Task: F1: E = A + B + C + D * (MA * MZ)                     *
 *       F2: MD = (MA * MB) * TRANS(MC)                        *
 *       F3: E = (MA * MM) * B + MB * SORT(A)                  *
 * 											                   *
 * @author Red'ko Alexander					                   *
 * @group IO-01								                   *
 * @date 30.09.12                                              *
 *                                                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */

namespace pro_lab4
 {
    class Program
    {

        static void Main(string[] args)
        {
            Console.WriteLine("Enter N: ");
            String line = Console.ReadLine();
            int n;
            int.TryParse(line, out n);
            int value;
            Console.WriteLine("Enter value: ");
            line = Console.ReadLine();
            int.TryParse(line, out value);
            Console.WriteLine();

            Tasks tasks = new Tasks(n, value);
            
            Thread t1 = new Thread(tasks.taskF1);
            Thread t2 = new Thread(tasks.taskF2);
            Thread t3 = new Thread(tasks.taskF3);

            t1.Start();
            t2.Start();
            t3.Start();

            Console.Read();
        }
    }
 }
