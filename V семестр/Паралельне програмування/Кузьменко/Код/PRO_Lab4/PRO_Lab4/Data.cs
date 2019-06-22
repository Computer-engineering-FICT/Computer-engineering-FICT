using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*
 * ************************************************
 *                                                *                  
 *    Utils to work with vectors and matrix       *
 *                                                *
 *  Autor: Kuzmenko Volodia                       *
 *  Group: IO-21                                  *
 *  Date: 1.10.2014                               *
 *                                                *
 **************************************************
 */
namespace PRO_Lab4
{
    class Data
    {
        private int N;
        private int value;
        protected Data(int n, int value)
        {
            this.N = n;
            this.value = value;
        }
        public void setN(int n)
        {
            this.N = n;
        }
        public void setValue(int value)
        {
            this.value = value;
        }

        protected  int[] vector_input() {

		int[] A = new int[N];
		for (int i = 0; i < A.Length; i++) {
			A[i] = value;
		}
		return A;
	}

	protected  int[,] matrix_input() {
		int[,] MA = new int[N,N];
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				MA[i,j] = value;
			}
		}
		return MA;
	}

	protected void vector_output(int[] vector) {
		for (int j = 0; j < vector.Length; j++) {
			Console.Write("|" + vector[j] + "|");
		}
		Console.WriteLine();
	}

	protected void matrix_output(int[,] matrix) {

		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				Console.Write("|" + matrix[i,j] + "|");
			}
			Console.WriteLine();
		}

	}

	protected int[,] multMatr(int[,] MA,  int[,] MZ) {
		int[,] MT = new int[N,N];
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				int s = 0;
				for (int k = 0; k < N; k++) {
					s += MA[i,k] * MZ[k,j];
					MT[i,j] = s;
				}
			}
		}
		return MT;
	}

	protected int[] multingMatrixOnVector(int[,] MA,int[] A) {
		int[] R = new int[N];
		for (int i = 0; i < A.Length; i++) {
			int s = 0;
			for (int j = 0; j < A.Length; j++) {
				s += MA[i,j] * A[j];
			}
			R[i] = s;
		}
		return R;
	}

	protected int[] addVec(int[] B, int[] C) {
		int[] K = new int[B.Length];
		for (int i = 0; i < K.Length; i++) {
			K[i] = B[i] + C[i];
		}
		return K;
	}

	protected  int[,] addMatr(int[,] MA, int[,] MB) {
        int[,] MM = new int[N, N];
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				MM[i,j] = MA[i,j] + MB[i,j];
			}
		}
		return MM;
	}

	protected int[] sortVector(int[] A) {
		int[] B = A;
		Array.Sort(B);
		return B;
	}

	protected int[,] sortMatr(int[,] MA) {
        int[][] MC = new int[N][];
        for (int i = 0; i < N; i++)
        {
            MC[i] = new int[N];
            for (int j = 0; j < N; j++)
            {
                MC[i][j] = MA[i,j];
            }
        }

		for (int i = 0; i < N; i++) {
			MC[i] = sortVector(MC[i]);
		}
        int[,] MR = new int[N, N];
        
        for (int i = 0; i < N; i++)
        {
            for (int j = 0; j < N; j++)
            {
                MR[i, j] = MC[i][j];
            }
        }
         
		return MR;
	}

	protected int maxElement(int[,] MD) {
		int m = MD[0,0];
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				if (m < MD[i,j])
					m = MD[i,j];
			}
		}
		return m;
	}




    }
}
