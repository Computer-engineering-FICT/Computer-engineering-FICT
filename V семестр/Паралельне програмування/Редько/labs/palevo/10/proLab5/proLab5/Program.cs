using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

/**
 * Lab5 
 * PRO 
 * IV-73 
 * Grubyi P. V. 
 * Var 
 * 1.21 D = SORT(A) + SORT(B) - SORT(C) 
 * 2.29 MD=(MA+MB)*(MA*MC)*(MB+MA) 
 * 3.6 A = MAX(MB)*C
 * 
 */
namespace proLab5
{
    class Program
    {
        static void Main(string[] args)
        {
            int n = 2000;
            //Function1
            Vector A1 = new Vector(n, 1);
            Vector B1 = new Vector(n, 1);
            Vector C1 = new Vector(n, 1);
            //Function2
            Matrix MA2 = new Matrix(n, n, 1);
            Matrix MB2 = new Matrix(n, n, 1);
            Matrix MC2 = new Matrix(n, n, 1);
            //Function3
            Matrix MB3 = new Matrix(n, n, 1);
            Vector C3 = new Vector(n, 1);

            //Init
            F1 f1 = new F1("F1", ThreadPriority.Lowest, A1, B1, C1);
            F2 f2 = new F2("F2", ThreadPriority.AboveNormal, MA2, MB2, MC2);
            F3 f3 = new F3("F3", ThreadPriority.Normal, MB3, C3);
            f2.t.Join();
        }
    }
}
