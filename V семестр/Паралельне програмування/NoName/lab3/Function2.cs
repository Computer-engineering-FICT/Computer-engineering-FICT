using System;
using System.Collections.Generic;
using System.Text;

namespace LabPP3
{
    class Function2
    {
        private int sizeOfArrays;
        private int[,] mf, mg, ml;
        private object block = new object();
        private int min;

        public void StartOfFunction(object arg)
        {
            this.sizeOfArrays = (int)arg;
            Methods methods = new Methods(sizeOfArrays);

            //lock (block)
            //{
            //Console.WriteLine("Start Function2");
            mg = methods.FillingOfMatrix();
            ml = methods.FillingOfMatrix();

            min = methods.MinOfMatrix(methods.MultMatrix(mg, ml));

            Console.WriteLine(min);
            //Console.WriteLine("End Function2");
            //}
        }
    }
}
