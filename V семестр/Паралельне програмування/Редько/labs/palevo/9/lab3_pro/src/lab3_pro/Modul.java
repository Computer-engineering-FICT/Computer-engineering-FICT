package lab3_pro;

import java.util.Arrays;

/**
 * Laboratory work #3
 * Skorik D.V. IO-911
 * Variant:
 * F1: 1.10:  b = MIN(C)
 * F2: 2.23: q = MAX(MA + MB - MC * MX)
 * F3: 3.16: d = MAX(MA*A - (MB * ME) * C)
 */
public final class Modul {
	public final static int N = 1000;
	
	public final static void fill_Matrix(int[][] matrix, int value) {
		for (int i = 0; i < matrix.length; i++) {
			Arrays.fill(matrix[i], value);
		}
	}
	
	public final static void Show_Vector(final int[] vector) {
		for (int i = 0; i < vector.length; i++) {
			System.out.print(vector[i] + " ");
		}
	}
	
	public final static int F1(final int[] vector) {
		int rresult = vector[0];
		for (int i = 1; i < N; i++) {
			if (rresult < vector[i]) {
				rresult = vector[i];
			}
		}
		return rresult;
	}
	
	public final static int[][] F2PART(final int[][] MA, final int[][] MB, final int[][] MC, final int[][] MX) {
		int[][] result = new int[N][N];
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				result[i][j] = MA[i][j]+MB[i][j];
				for (int k = 0; k < N; k++) {
					result[i][j] -= MC[i][k] * MX[k][j];
				}
			}
		}
		return result;
	}
	
	public final static int F2(final int[][] result) {
		int resultF = 0;
		int buf = result[1][1];
		for (int i = 1; i < N; i++) {
			for (int j = 1; j < N; j++) {
				if (result[i][j] > buf) {
					buf = result[i][j];
					}
			}
		}
		return resultF;
	}
	public final static int[] F3PART(final int[] A, final int[] C, final int[][] MA, final int[][] MB, final int[][] ME) {
		int[] resultt = new int[N];
		for (int i = 0; i < N; i++) {
			resultt[i] = 0;
			for (int j = 0; j < N; j++) {
				resultt[i] += (MA[j][i] * A[j]) - (MB[j][i] - ME[j][i])*C[j];
			}
		}
		return resultt;
	}
	
	public final static int F3(final int[] resultt) {
		int resultFF = 0;
		int buf = resultt[1];
		for (int i = 1; i < N; i++) {
			
				if (resultt[i] > buf) {
					buf = resultt[i];
					
			}
		}
		return resultFF;
	}
}
