using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace pro_lab4
{
    class Tasks : Data
    {

        public Tasks(int n, int value) : base(n, value)
        {
        }

//-----------------------------------------------------------------
        public void taskF1()
        {
            System.Console.WriteLine("Task F1 started");
            Vector va, vb, vc, vd, ve;
            Matrix ma, mz;
            va = inputVector();
            vb = inputVector();
            vc = inputVector();
            vd = inputVector();
            ma = inputMatrix();
            mz = inputMatrix();
            ve = va + vb + vc + vd * (ma * mz);
            outputVector(ve, "f1.txt");
            System.Console.WriteLine("Task F1 ended");
        }

//----------------------------------------------------------------
        public void taskF2()
        {
            System.Console.WriteLine("Task F2 started");
            Matrix ma, mb, mc, md;
            ma = inputMatrix();
            mb = inputMatrix();
            mc = inputMatrix();
            md = (ma * mb) * transpose(mc);
            outputMatrix(md, "f2.txt");
            System.Console.WriteLine("Task F2 ended");
        }

//-----------------------------------------------------------------
        public void taskF3()
        {
            System.Console.WriteLine("Task F3 started");
            Vector va, vb, ve;
            Matrix ma, mb, mm;
            va = inputVector();
            vb = inputVector();
            ma = inputMatrix();
            mb = inputMatrix();
            mm = inputMatrix();
            ve = vb * (ma * mb) + sort(va) * mb;
            outputVector(ve, "f3.txt");
            System.Console.WriteLine("Task F3 ended");
        }


        private Matrix transpose(Matrix m)
        {
            for (int i = 0; i < m.size(); i++)
            {
                for (int j = i + 1; j < m.size(); j++)
                {
                    int temp = m.get(i, j);
                    m.set(i, j, m.get(j, i));
                    m.set(j, i, temp);
                }
            }
            return m;
        }

        private Vector sort(Vector vector)
        {
            int[] res = new int[vector.size()];
            for (int i = 0; i < res.Length; i++)
            {
                res[i] = vector.get(i);
            }
            Array.Sort(res);
            Vector sortedVector = new Vector(res.Length);
            for (int j = 0; j < sortedVector.size(); j++)
            {
                sortedVector.set(j, res[j]);
            }
            return sortedVector;
        }


    }
}
