using System;
using System.IO;

namespace proLab5
{
    class Vector
    {
        private double[] A;
        private int n;
        public Vector(double[] A)
        {
            this.A = A;
            n = A.Length;
        }

        public Vector(int n)
        {
            this.n = n;
            A = new double[n];
        }

        public Vector(int n, double s)
        {
            this.n = n;
            A = new double[n];
            for (int i = 0; i < n; i++)
                A[i] = s;
        }

        public double[] getArray()
        {
            return A;
        }

        public int getDimension()
        {
            return n;
        }

        public void set(int i, double s)
        {
            A[i] = s;
        }

    /**
	 * C = A - B
	 * 
	 * @param B
	 *            another vector
	 * @return A - B
	 */
	
	public Vector minus(Vector B) {
		checkVectorDimensions(B);
		Vector X = new Vector(n);
		double[] C = X.getArray();
		for (int i = 0; i < n; i++)
			C[i] = A[i] - B.A[i];
		return X;
	}

	/**
	 * C = A + B
	 * 
	 * @param B
	 *            another vector
	 * @return A + B
	 */
	
	public Vector plus(Vector B) {
		checkVectorDimensions(B);
		Vector X = new Vector(n);
		double[] C = X.getArray();
		for (int i = 0; i < n; i++)
			C[i] = A[i] + B.A[i];
		return X;
	}
	
	/**
	 * C = A * b
	 * 
	 * @param B
	 *            another vector
	 * @return A + B
	 */
	
	public Vector mulScalar(double b) {
		Vector X = new Vector(n);
		double[] C = X.getArray();
		for (int i = 0; i < n; i++)
			C[i] = A[i]*b;
		return X;
	}

	/**
	 * Sorting
	 * 
	 * @param B
	 *            vector to sort
	 * @return Sorted B
	 */

	public static Vector sort(Vector B) {
		Vector X = (Vector) B.clone();
		double[] C = X.getArray();
		Array.Sort(C);
		return X;
	}
	
	public Object clone() {
		return copy();
	}

	/**
	 * Make a deep copy of a vector
	 */
	
	public Vector copy() {
		Vector X = new Vector(n);
		double[] C = X.getArray();
		for (int i = 0; i < n; i++)
			C[i] = A[i];
		return X;
	}

       public void saveVector(String fileName) {
        FileStream fileout = new FileStream(fileName, FileMode.OpenOrCreate, FileAccess.Write);
        StreamWriter sw = new StreamWriter(fileout);


        for (int i = 0; i < this.n; i++){
			sw.Write(this.A[i]);
			sw.Write(" ");
            
		}
		sw.WriteLine();
        sw.Close();
	}
	
	/** Check if size(A) == size(B) **/

	private void checkVectorDimensions(Vector B) {
		if (B.n != n)
			throw new ArgumentException("Vector dimensions must agree.");
	}

    }
}
