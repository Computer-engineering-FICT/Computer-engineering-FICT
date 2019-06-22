using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace PROLab5
{
    class Func1
    {
        private Vector A, B;

        public Func1()
        {
            A = new Vector(Lab5.N);
            B = new Vector(Lab5.N);
        }

        static int F1(Vector A, Vector B)
        {
            Vector help = A;
            return help.findMax() + Functions.vectorScalarProduct(A, B);
        }

        public void run() {
		    Console.WriteLine("Input vector A");
		    A.inputVector();
		    Console.WriteLine("Input vector B");
		    B.inputVector();
		    int c = F1(A, B);
            Console.WriteLine("Result of Func1: " + c);
	    }

        public void runfile()
        {
            Console.WriteLine("Func1 started work");
            
            TextReader sr = new StreamReader("Func1in.txt");
            A.inputVector(sr);
            B.inputVector(sr);
            int c = F1(A, B);

            TextWriter wr = new StreamWriter("Func1out.txt");

            wr.WriteLine("Result of Func1: " + c);
            wr.Close();
            Console.WriteLine("Func1 finished work");
        }
    }
}
