using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace PROLab7
{
    class Func3
    {
        private Matrix MA;
        private Vector B, C;

        public Func3()
        {
            MA = new Matrix(Lab7.N);
            B = new Vector(Lab7.N);
            C = new Vector(Lab7.N);
        }

        public int F3(Matrix MA, Vector B, Vector C)
        {
            Vector help = Functions.matVecMult(MA, Functions.vectorSub(B, C));
            return help.findMax();
        }

        public void run() {
		    Console.WriteLine("Input matrix MA");
		    MA.inputMatrix();
		    Console.WriteLine("Input vector B");
		    B.inputVector();
            Console.WriteLine("Input vector C");
            C.inputVector();
		    int e = F3(MA, B, C);
		    Console.WriteLine("Result of Func3");
		    Console.WriteLine(e);		
	    }

        public void runfile()
        {
            Console.WriteLine("Func3 started work");

            TextReader sr = new StreamReader("Func3in.txt");

            MA.inputMatrix(sr);
            B.inputVector(sr);
            C.inputVector(sr);
            int e = F3(MA, B, C);

            TextWriter wr = new StreamWriter("Func3out.txt");
            wr.WriteLine("Result of Func3");
            wr.WriteLine(e);
            wr.Close();
            Console.WriteLine("Func3 finished work");
        }
    }
}
