using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Threading;
using System.Runtime.InteropServices;

//--------------------------------------------------------------
//              Parallel and distributed computing             --
//                     Lab#6 - threads in Win32                --
//                   IO-73 Novotarsky Kirill                   --
//--------------------------------------------------------------
//Variant: 1.19, 2.27, 3.4                                     --
//Func1: d = MAX(B-C) + MIN(A+B);                              --
//Func2: MD = MA*(MB*TRANS(MC));                               --
//Func3: B = SORT(A)*SORT(MB).                                 --
//---------------------------------------------------------------
//---------------------------------------------------------------
namespace PROLab6
{
    
    class Program
    {
        //[StructLayout(LayoutKind.Sequential)]
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
        //, SetLastError = true
        //[return: MarshalAs(UnmanagedType.Bool)]
        static extern bool CloseHandle(IntPtr hObject);


        [DllImport("kernel32.dll")]
        static extern bool SetThreadPriority(IntPtr hThread, ThreadPriority nPriority);
        
        
        
        static int N = 3;

        //adding vectors method
        public static Vector addVectors(Vector A, Vector B)
        {
            Vector help = new Vector(A.getSize());
            for (int i = 0; i < A.getSize(); i++)
            {
                help.getVector()[i] = A.getVector()[i] + B.getVector()[i];
            }
            return help;
        }

        //subing vectors method
        public static Vector subVectors(Vector A, Vector B)
        {
            Vector help = new Vector(A.getSize());
            for (int i = 0; i < A.getSize(); i++)
            {
                help.getVector()[i] = A.getVector()[i] - B.getVector()[i];
            }
            return help;
        }

        //vector*matrix
        public static Vector vectorMatrixMultiply(Matrix MA, Vector A)
        {
            Vector help = new Vector(A.getSize());
            for (int j = 0; j < help.getSize(); j++)
            {
                for (int z = 0; z < help.getSize(); z++)
                {
                    help.getVector()[j] = help.getVector()[j]
                      + A.getVector()[z] * MA.getMatrix()[z].getVector()[j];
                }
            }
            return help;

        }
        //matrix*matrix
        public static Matrix matrixMultiply(Matrix MA, Matrix MB)
        {
            Matrix help = new Matrix(MA.getSize());
            for (int i = 0; i < help.getSize(); i++)
                help.getMatrix()[i] = vectorMatrixMultiply(MA, MB.getMatrix()[i]);
            return help;
        }

        //Func1: d = MAX(B-C) + MIN(A+B);
        public static int func1(Vector A, Vector B, Vector C)
        {
            Vector buf = new Vector(A.getSize());
            buf = addVectors(A, B);
            int d = buf.minimum();
            buf = subVectors(B, C);
            d = d + buf.maximum();
            return d;
        }

        //Func2: MD = MA*(MB*TRANS(MC));
        public static Matrix func2(Matrix MA, Matrix MB, Matrix MC)
        {
            Matrix MD = new Matrix(MA.getSize());
            MC.transpose();
            MD = matrixMultiply(MB, MC);
            return matrixMultiply(MA, MD);
        }

        //Func3: B = SORT(A)*SORT(MB).
        public static Vector func3(Matrix MA, Vector A)
        {
            A.sortVectorUp();
            MA.sortMatrix();
            return vectorMatrixMultiply(MA, A);
        }
        static void makeFunc1()
        {
            Console.WriteLine("TASK ONE STARTS!");

            Vector A = new Vector(Program.N, 1);

            Vector B = new Vector(Program.N, 1);

            Vector C = new Vector(Program.N, 1);
            Console.WriteLine("func1:");

           // Thread.Sleep(100);
            //      FileStream fileout = new FileStream("D:/eclipse/workspace/Func1.txt", FileMode.OpenOrCreate, FileAccess.Write);
            //      StreamWriter sw = new StreamWriter(fileout);

            //   sw.WriteLine(Program.func1(A, B, C));
            //   sw.Close();
            Console.WriteLine(Program.func1(A, B, C));
        }
        static void makeFunc2()
        {
            Console.WriteLine("TASK TWO STARTS!");
            Matrix MA = new Matrix(Program.N, 1);
            Matrix MB = new Matrix(Program.N, 1);
            Matrix MC = new Matrix(Program.N, 1);

            Matrix MD = new Matrix(Program.N);
            Thread.Sleep(200);
            MD = Program.func2(MA, MB, MC);
            Console.WriteLine();
            Console.WriteLine("Func2:");
            MD.matrixOutput();
            //  MD.matrixFileOutput("D:/eclipse/workspace/Func2.txt");
        }
        static void makeFunc3()
        {
            Console.WriteLine("TASK THREE STARTS!");
            Vector A = new Vector(Program.N, 1);
            Matrix MB = new Matrix(Program.N, 1);
            Vector D = new Vector(Program.N);
            Console.WriteLine("Func3:");
            Thread.Sleep(20);
            D = Program.func3(MB, A);
            D.vectorOutput();
            //D.vectorFileOutput("D:/eclipse/workspace/Func3.txt");

        }
        
      
        static void Main(string[] args)
        {
            IntPtr hThreadA;
            IntPtr hThreadB;
            IntPtr hThreadC;
            uint a = 0;
            IntPtr b = new IntPtr(0);
            IntPtr c = new IntPtr(0);
            SECURITY_ATTRIBUTES q;
            q.nLength = 0;
            q.lpSecurityDescriptor = c;
            q.bInheritHandle = 0;
            hThreadA = CreateThread(ref q, 0, makeFunc1, b, 0, out a);
            SetThreadPriority(hThreadA, ThreadPriority.Highest);
            hThreadB = CreateThread(ref q, 0, makeFunc2, b, 0, out a);
            SetThreadPriority(hThreadB, ThreadPriority.Highest);
            hThreadC = CreateThread(ref q, 0, makeFunc3, b, 0, out a);
            SetThreadPriority(hThreadC, ThreadPriority.Lowest);
            //Thread td = new Thread(makeFunc1);
            //td.Start();
            //td.Join();
            //Thread td1 = new Thread(makeFunc2);
            //td1.Priority = ThreadPriority.Highest;
            //td1.Start();

            //Thread td2 = new Thread(makeFunc3);
            //td1.Priority = ThreadPriority.Lowest;
            //td2.Start();
            Console.ReadLine();
            CloseHandle(hThreadA);
            CloseHandle(hThreadB);
            CloseHandle(hThreadC);
            //Func1 F1 = new Func1("Func1", 1);
            //F1.t.join();
            //Func2 F2 = new Func2("Func2", 10);
            //Func3 F3 = new Func3("Func3", 10);
        }
    }
}
