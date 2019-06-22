using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.IO;
using System.Runtime.InteropServices;
using MPI;

/**
 * @author Sydora Sergiy IO-73
 * 1.11 F1: c = MAX(A)*(A*B)
 * 2.19 F2: v = MAX(MA + MB*MC)
 * 3.23 F3: e = MAX(MA*(B - C))
 */

namespace PROLab7
{    
    class Lab7
    {

        /**public struct SECURITY_ATTRIBUTES
        {
            public int nLength;
            public IntPtr lpSecurityDescriptor;
            public int bInheritHandle;
        }
        [DllImport("Kernel32.dll")]
        static extern IntPtr CreateThread([In] ref SECURITY_ATTRIBUTES
        SecurityAttributes, uint StackSize, ThreadStart StartFunction,
        IntPtr ThreadParameter, uint CreationFlags, out uint ThreadId);
          
        [DllImport("kernel32.dll")]
        static extern bool CloseHandle(IntPtr hObject);

        [DllImport("kernel32.dll")]
        static extern bool SetThreadPriority(IntPtr hThread, ThreadPriority nPriority);*/

        static void makeFunc1()
        {
            Func1 f1 = new Func1();
            if (N > 10)
            {
                f1.runfile();
            }
            else
            {
                f1.run();
            }
        }

        static void makeFunc2()
        {
            Func2 f2 = new Func2();
            if (N > 10)
            {
                f2.runfile();
            }
            else
            {
                f2.run();
            }
        }

        static void makeFunc3()
        {
            Func3 f3 = new Func3();
            if (N > 10)
            {
                f3.runfile();
            }
            else
            {
                f3.run();
            }
        }

        public static int N = 300;
        static void Main(string[] args)
        {
            Console.WriteLine("Main thread started work");
            //Console.WriteLine(args);
            Console.WriteLine("0");

            using (MPI.Environment env = new MPI.Environment(ref args))
            {
                //Console.WriteLine("1");
                switch (MPI.Communicator.world.Rank)
                {
                    case 0:
                        makeFunc1();
                        break;
                    case 1:
                        makeFunc2();
                        break;
                    case 2:
                        makeFunc3();
                        break;
                }
            }

            Console.WriteLine("Main thread finished work");
            Console.ReadKey(); 
        }
    }
}
