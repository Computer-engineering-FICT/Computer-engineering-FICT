using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using Microsoft.Win32;


/**
 * @author Sydora Sergiy IO-73
 * 1.11 F1: c = MAX(A)*(A*B)
 * 2.19 F2: v = MAX(MA + MB*MC)
 * 3.23 F3: e = MAX(MA*(B - C))
 */

namespace PROLab5
{    
        class Lab5
    {
        public static int N = 1200;
        static void Main(string[] args)
        {
            Console.WriteLine("Main thread started work");            

            Func1 f1 = new Func1();
            Func2 f2 = new Func2();
            Func3 f3 = new Func3();

/**            Thread thrf1 = new Thread(f1.run);
            Thread thrf2 = new Thread(f2.run);
            Thread thrf3 = new Thread(f3.run); */

            thrf5 = CreateThread();
            Thread thrf4 = CreateThread();

            Thread thrf1 = new Thread(f1.runfile);
            Thread thrf2 = new Thread(f2.runfile);
            Thread thrf3 = new Thread(f3.runfile);

            thrf1.Priority = ThreadPriority.BelowNormal;
            thrf2.Priority = ThreadPriority.Highest;
            thrf3.Priority = ThreadPriority.Normal;

            thrf1.Start();
            thrf2.Start();
            thrf3.Start();

            thrf1.Join();
            thrf2.Join();
            thrf3.Join();

            Console.WriteLine("Main thread finished work");
            Console.ReadKey(); 
        }
    }
}
