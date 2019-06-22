using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Runtime.InteropServices;
using System.IO;
using MPI;

//--------------------------------------------------------------
//              Parallel and distributed computing             --
//                     Lab#7 - threads in MPI                --
//                   IO-73 Novotarsky Kirill                   --
//--------------------------------------------------------------
//Variant: 1.19, 2.27, 3.4                                     --
//Func1: d = MAX(B-C) + MIN(A+B);                              --
//Func2: MD = MA*(MB*TRANS(MC));                               --
//Func3: B = SORT(A)*SORT(MB).                                 --
//---------------------------------------------------------------
//---------------------------------------------------------------
namespace PROLab7
{
    class Program
    {
       
        
        static int N = 4;

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

            Thread.Sleep(100);
                  FileStream fileout = new FileStream("D:/eclipse/workspace/Func1.txt", FileMode.OpenOrCreate, FileAccess.Write);
                  StreamWriter sw = new StreamWriter(fileout);
            
               sw.WriteLine(Program.func1(A, B, C));
               sw.Close();
            //Console.WriteLine(Program.func1(A, B, C));
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
           // MD.matrixOutput();
             MD.matrixFileOutput("D:/eclipse/workspace/Func2.txt");
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
            //D.vectorOutput();
            D.vectorFileOutput("D:/eclipse/workspace/Func3.txt");

        }      
        static void Main(string[] args)
        {
           // Console.WriteLine(args);
            using (MPI.Environment env = new MPI.Environment(ref args))
            {
                switch (MPI.Communicator.world.Rank)
                {
                    case 1:
                        makeFunc1();
                        break;
                    case 2:
                        makeFunc2();
                        break;
                    case 3:
                        makeFunc3();
                        break;
                }
               };
            

        }
    }
 }
