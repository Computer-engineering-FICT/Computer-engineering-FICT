using System;
using System.Collections.Generic;
using System.Text;

namespace LabPP3
{
    class Function1
    {
        private int sizeOfArrays;
        private int[] a, b, c, d;
        private int[,] ma, md;

        public void StartOfFunction(object arg)
        {
            this.sizeOfArrays = (int)arg;
            Methods methods = new Methods(sizeOfArrays);
            //lock (block)
            //{
            // Console.WriteLine("Strat Function1");
            b = methods.FillingOfVector();
            c = methods.FillingOfVector();
            a = methods.FillingOfVector();
            ma = methods.FillingOfMatrix();
            md = methods.FillingOfMatrix();

            d = methods.SumOfVector(methods.MultOfVector(b, c), methods.MatrixToVector(methods.MultMatrix(methods.VectorToMatrixOnRow(a), methods.MultMatrix(ma, md))));
            
            
            methods.PutVector(d);
            //Console.WriteLine("End Function1");
            //}
        }
    }
}