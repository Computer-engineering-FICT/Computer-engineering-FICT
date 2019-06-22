using System;
using System.Threading;

namespace lab3
{
    class Lab3
    {
        private static readonly int N = 500;

        static void Main(string[] args)
        {
            Console.WriteLine("Lab 3 start");
            Console.WriteLine();
            Thread f1 = new Thread((new F1(N)).run);
            Thread f2 = new Thread((new F2(N)).run);
            Thread f3 = new Thread((new F3(N)).run);
            f1.Name = "F1";
            f2.Name = "F2";
            f3.Name = "F3";
            f1.Priority = ThreadPriority.Lowest;
            f2.Priority = ThreadPriority.Normal;
            f3.Priority = ThreadPriority.Highest;
            f1.Start();
            f2.Start();
            f3.Start();
            f1.Join();
            f2.Join();
            f3.Join();
            Console.WriteLine();
            Console.WriteLine("Lab 3 end");
            Console.Write("Press any key...");
            Console.ReadKey();
        }
    }
}
