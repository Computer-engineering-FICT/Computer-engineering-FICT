using System;
using System.Collections.Generic;
using System.Text;

namespace LabPP3
{
    class Function3
    {
        private int sizeOfArrays;
        private int[] t, p, s;
        private int[,] mo, mr, ms;
        private object block = new object();

        public void StartOfFunction(object arg)
        {
            this.sizeOfArrays = (int)arg;
            Methods methods = new Methods(sizeOfArrays);

            //lock (block)
            //{
            // Console.WriteLine("Start Function3");
            p = methods.FillingOfVector();
            s = methods.FillingOfVector();

            mo = methods.FillingOfMatrix();
            mr = methods.FillingOfMatrix();
            ms = methods.FillingOfMatrix();

            t = methods.SumOfVector(methods.MatrixToVector(methods.MultMatrix(mo, methods.VectorToMatrixOnColumn(p))), methods.MatrixToVector(methods.MultMatrix(methods.MultMatrix(mr, ms), methods.VectorToMatrixOnColumn(s))));

            methods.PutVector(t);

            //Console.WriteLine("End Function3");
            //}
        }
    }
}