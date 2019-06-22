using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Win32;
using System.Runtime.InteropServices;

/**
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *                                                             *
 *             Laboratory work #4. Threads in C# and Win32     *
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

namespace pro_lab5
{
    class Program
    {
        public struct SECURITY_ATTRIBUTES
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
        static extern bool SetThreadPriority(IntPtr hThread, ThreadPriority nPriority);


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


            IntPtr t1;
            IntPtr t2;
            IntPtr t3;
            uint a = 0;
            IntPtr b = new IntPtr(0);
            IntPtr c = new IntPtr(0);
            SECURITY_ATTRIBUTES q;
            q.nLength = 0;
            q.lpSecurityDescriptor = c;
            q.bInheritHandle = 0;

            t1 = CreateThread(ref q, 0, tasks.taskF1, b, 0, out a);
            SetThreadPriority(t1, ThreadPriority.Lowest);
            t2 = CreateThread(ref q, 0, tasks.taskF2, b, 0, out a);
            SetThreadPriority(t2, ThreadPriority.Highest);
            t3 = CreateThread(ref q, 0, tasks.taskF3, b, 0, out a);
            SetThreadPriority(t3, ThreadPriority.Lowest);


            //Thread t1 = new Th    read(tasks.taskF1);
            //Thread t2 = new Thread(tasks.taskF2);
            //Thread t3 = new Thread(tasks.taskF3);

            //t1.Start();
            //t2.Start();
            //t3.Start();

            CloseHandle(t1);
            CloseHandle(t2);
            CloseHandle(t3);


            Console.Read();
        }
    }
}
