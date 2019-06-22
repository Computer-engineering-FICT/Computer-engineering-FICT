using System;
using System.Threading;
using LabPP3;

namespace ConsoleApplication
{
    public class Program
    {
        static void Main(string[] args)
        {
            
            Function1 instance1 = new Function1();
            Function2 instance2 = new Function2();
            Function3 instance3 = new Function3();
            ParameterizedThreadStart function1 = new ParameterizedThreadStart(instance1.StartOfFunction);
            ParameterizedThreadStart function2 = new ParameterizedThreadStart(instance2.StartOfFunction);
            ParameterizedThreadStart function3 = new ParameterizedThreadStart(instance3.StartOfFunction);
            Thread thread1 = new Thread(function1);
            Thread thread2 = new Thread(function2);
            Thread thread3 = new Thread(function3);
            thread1.Start(4);
            thread2.Start(5);
            thread3.Start(6);
        }
    }
}