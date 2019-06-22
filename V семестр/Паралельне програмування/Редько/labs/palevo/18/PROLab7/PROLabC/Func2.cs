using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Threading;

namespace PROLab7
{
    class Func2
    {
        private Matrix MA, MB, MC;
        public Func2()
        {
            MA = new Matrix(Lab7.N);
            MB = new Matrix(Lab7.N);
            MC = new Matrix(Lab7.N);
        }

        public int F2(Matrix MA, Matrix MB, Matrix MC)
        {
            Matrix help = Functions.matrixMult(MB, MC);
            help = Functions.matrixSum(MA, help);            
            return help.findMax();
        }

        public void run() {
		    Console.WriteLine("Input matrix MA");
		    MA.inputMatrix();
		    Console.WriteLine("Input matrix MB");
		    MB.inputMatrix();
		    Console.WriteLine("Input matrix MC");
		    MC.inputMatrix();
		    int v = F2(MA, MB, MC);
		    Console.WriteLine("Result of Func2");
            Console.WriteLine("Result of Func2: " + v);
	    }

        public void runfile()
        {
            Console.WriteLine("Func2 started work");

            TextReader sr = new StreamReader("Func1in.txt");
            
            MA.inputMatrix(sr);
            MB.inputMatrix(sr);
            MC.inputMatrix(sr);
            Thread.Sleep(2000);
            int v = F2(MA, MB, MC);

            TextWriter wr = new StreamWriter("Func2out.txt");

            wr.WriteLine("Result of Func2: " + v);
            wr.Close();
            Console.WriteLine("Func2 finished work");
        }

    }
}
