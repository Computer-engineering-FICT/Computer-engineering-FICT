/*
 * PSC: Laba №05
 * Author: Kushnirenko Alexander
 * from group "IO-81"
 * F1: MAX(A + B + C)
 * F2: MAX(MB)
 * F3: SORT(B * MD) * (MA - MB)
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace lab5
{
    class Program
    {
        static int n = 1000;
        static void Main(string[] args)
        {
        	Console.WriteLine("Main thread starts.");
            Console.WriteLine("Enter n: ");
            n = int.Parse(Console.ReadLine());
            
            Thread t1 = new Thread(f1); 
            Thread t2 = new Thread(f2); 
            Thread t3 = new Thread(f3); 
            
            t1.Start();
            t2.Start();
            t3.Start();
            
            t1.Join();
            t2.Join();
            t3.Join();
            
            Console.WriteLine("Main thread ends.");
            Console.ReadKey();
        }

		// F1: MAX(A + B + C)
		static void f1()
		{
		
			Console.WriteLine("F1-thread: start");
			
			Vector vA = new Vector(n); vA.fill();
			Vector vB = new Vector(n); vB.fill();
			Vector vC = new Vector(n); vC.fill();
			
			Console.WriteLine("F1: MAX(A + B + C) = " +
			    VectorsAndMatricesArithmetic.getMax(
			        VectorsAndMatricesArithmetic.add(
			            VectorsAndMatricesArithmetic.add(vA, vB), vC
			        )
			    )
			);
			
			Console.WriteLine("F1-thread: end");
			
		}
		
		// F2: MAX(MB)
		static void f2()
		{
		
			Console.WriteLine("F2-thread: start");
			
			Matrix mB = new Matrix(n); mB.fill(1);
			
			Console.WriteLine("F2: MAX(MB) = " +
			    VectorsAndMatricesArithmetic.getMax(mB)
			);
			
			Console.WriteLine("F2-thread: end");
			
		}
		
		// F3: SORT(B * MD) * (MA - MB)
		static void f3()
		{
		
			Console.WriteLine("F3-thread: start");
			
			Vector vB = new Vector(n); vB.fill(1);
			Matrix mD = new Matrix(n); mD.fill(1);
			Matrix mA = new Matrix(n); mA.fill(1);
			Matrix mB = new Matrix(n); mB.fill(1);

			Console.WriteLine("F3: SORT(B * MD) * (MA - MB) = " +
			    VectorsAndMatricesArithmetic.multiply(
			        VectorsAndMatricesArithmetic.multiply(vB, mD).sorted(),
			        VectorsAndMatricesArithmetic.subtract(mA, mB)
			    ).toString()
			);
			
			Console.WriteLine("F3-thread: end");
		}

    }
    
    public class Vector
    {
    	public static int defaultSize = 3;
		public int[] v;
		public Vector(int n)
		{
			v = new int[n];
		}
		public Vector(int[] v)
		{
			this.v = v;
		}
		
		public void fill(int value)
		{
			for (int i = 0; i < v.Length; i++)
			{
				v[i] = value;
			}
		}

		public Vector sorted()
		{
		    int[] sortedVector = new int[v.Length];
            for (int i = 0; i < v.Length; i++)
            {
                sortedVector[i] = v[i];
            }
		    Array.Sort(sortedVector);
		    return new Vector(sortedVector);
		}

		public string toString()
		{
		    string result = "(" + v[0];
		    foreach(int i in v)
		    {
		    	result += ",\t" + i;
		    }
		    return result + ")";
		}
    }
    
    public class Matrix
    {
		public Vector[] m;

		public Matrix(int n)
		{
		    m = new Vector[n];
		    for (int i = 0; i < n; i++)
		    {
		        m[i] = new Vector(n);
		    }
		}

		public void fill(int value)
		{
		    for (int i = 0; i < m.Length; i++)
		    {
		        m[i].fill(value);
		    }
		}
	}

	public class VectorsAndMatricesArithmetic
	{

		public static Vector add(Vector left, Vector right)
		{
		    if (left.v.Length != right.v.Length)
		    {
		        Console.WriteLine("Error: adding two vectors with different length");
		        return null;
		    }
		    
	        Vector result = new Vector(left.v.Length);
	        for (int i = 0; i < result.v.Length; i++)
	        {
	            result.v[i] = left.v[i] + right.v[i];
	        }
	        return result;
		}

		public static int getMax(Vector v)
		{
		    int max = v.v[0];
		    for (int i = 1; i < v.v.Length; i++)
		    {
		        if (max < v.v[i])
		        {
		        	max = v.v[i];
		        }
		    }
		    return max;
		}

		public static int getMax(Matrix ma)
		{
		    int max = getMax(ma.m[0]);
		    for (int i = 1; i < ma.m.Length; i++)
		    {
		        int m = getMax(ma.m[i]);
		        if (max < m)
		        {
		        	max = m;
		        }
		    }
		    return max;
		}

		public static Vector multiply(Vector v, Matrix m)
		{
		    if (v.v.Length != m.m.Length)
		    {
		        Console.WriteLine("Error: multiplying vector by matrix with different size");
		        return null;
		    }

	        Vector vC = new Vector(v.v.Length);
	        for (int i = 0; i < v.v.Length; i++)
	        {
	            vC.v[i] = 0;
	            for (int j = 0; j < v.v.Length; j++)
	            {
	                vC.v[i] += v.v[i] * m.m[i].v[j];
	            }
	        }
	        return vC;
		    
		}

		public static Matrix subtract(Matrix left, Matrix right)
		{
		    if (left.m.Length != right.m.Length)
		    {
		        Console.WriteLine("Error: subtracting two matrices with different length");
		        return null;
		    }

	        Matrix result = new Matrix(left.m.Length);
	        for (int i = 0; i < result.m.Length; i++)
	        {
	            for (int j = 0; j < result.m.Length; j++)
	            {
	                result.m[i].v[j] = left.m[i].v[j] - right.m[i].v[j];
	            }
	        }
	        return result;
		}

	}
}
