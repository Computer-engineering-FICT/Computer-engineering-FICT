/*
 * ************************************************
 *                                                *                  
 *    Utils to work with vectors and matrix       *
 *                                                *
 *  Autor: Kuzmenko Volodia                       *
 *  Group: IO-21                                  *
 *  Date: 24.09.2014                              *
 *                                                *
 **************************************************
 */

import java.util.Arrays;
import java.util.Scanner;

public class Data {
	private static int N;
	private static int value;

	protected Data(int N, int value) {
		Data.N = N;
		Data.value = value;
	}

	protected synchronized static int[] vector_input() {

		int[] A = new int[N];
		for (int i = 0; i < A.length; i++) {
			A[i] = value;
		}
		return A;
	}

	protected synchronized static int[][] matrix_input() {
		int[][] MA = new int[N][N];
		for (int i = 0; i < MA.length; i++) {
			for (int j = 0; j < MA[i].length; j++) {
				MA[i][j] = value;
			}
		}
		return MA;
	}

	protected static void vector_output(int[] vector) {
		for (int j = 0; j < vector.length; j++) {
			System.out.print("|" + vector[j] + "|");
		}
		System.out.println();
	}

	protected static void matrix_output(int[][] matrix) {

		for (int i = 0; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				System.out.print("|" + matrix[i][j] + "|");
			}
			System.out.println();
		}

	}

	protected static int[][] multMatr(final int[][] MA, final int[][] MZ) {
		int[][] MT = new int[MA.length][MA.length];
		for (int i = 0; i < MA.length; i++) {
			for (int j = 0; j < MA.length; j++) {
				int s = 0;
				for (int k = 0; k < MA.length; k++) {
					s += MA[i][k] * MZ[k][j];
					MT[i][j] = s;
				}
			}
		}
		return MT;
	}

	protected static int[] multingMatrixOnVector(final int[][] MA, final int[] A) {
		int[] R = new int[A.length];
		for (int i = 0; i < A.length; i++) {
			int s = 0;
			for (int j = 0; j < A.length; j++) {
				s += MA[i][j] * A[j];
			}
			R[i] = s;
		}
		return R;
	}

	protected static int[] addVec(final int[] B, final int[] C) {
		int[] K = new int[B.length];
		for (int i = 0; i < K.length; i++) {
			K[i] = B[i] + C[i];
		}
		return K;
	}

	protected static int[][] addMatr(final int[][] MA, final int[][] MB) {
		int[][] MM = new int[MA.length][MA.length];
		for (int i = 0; i < MM.length; i++) {
			for (int j = 0; j < MM.length; j++) {
				MM[i][j] = MA[i][j] + MB[i][j];
			}
		}
		return MM;
	}

	protected static int[] sortVector(final int[] A) {
		int[] B = A;
		Arrays.sort(B);
		return B;
	}

	protected static int[][] sortMatr(final int[][] MA) {
		int[][] MR = MA;
		for (int i = 0; i < MA.length; i++) {
			MR[i] = sortVector(MR[i]);
		}
		return MA;
	}

	protected static int maxElement(final int[][] MD) {
		int m = MD[0][0];
		for (int i = 0; i < MD.length; i++) {
			for (int j = 0; j < MD.length; j++) {
				if (m < MD[i][j])
					m = MD[i][j];
			}
		}
		return m;
	}

}
