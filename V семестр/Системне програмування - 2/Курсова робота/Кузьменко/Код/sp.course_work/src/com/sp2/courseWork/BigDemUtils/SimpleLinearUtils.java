/*
 * 
 */
package com.sp2.courseWork.BigDemUtils;

import java.math.BigDecimal;
import java.util.Arrays;

import static com.sp2.courseWork.BigDemUtils.Utils.*;
// TODO: Auto-generated Javadoc

/**
 * class for linear utils.
 *
 * @author Kuzmenko Volodimir
 */
public class SimpleLinearUtils {
	
	/**
	 * matrix multiplication with BigDecimal arguments MA*MB.
	 *
	 * @param a matrix MA
	 * @param b matrix MB
	 * @return matrix MA*MB
	 */
	public static BigDecimal[][] mult(final BigDecimal[][] a,
			final BigDecimal[][] b) {
		int m = a.length;
		int n = b[0].length;
		if (n!=m)throw new IllegalArgumentException();
		else{
			int o = b.length;
			BigDecimal[][] res = new BigDecimal[m][n];
			BigDecimal sum;
			for (int i = 0; i < m; i++) {
				for (int j = 0; j < n; j++) {
					sum = BigDecimal.ZERO;
					for (int k = 0; k < o; k++) {
						sum = sum.add(a[i][k].multiply(b[k][j]),mc);
					}
					res[i][j] = sum;
				}
			}			
			return res;
			
		}
	}

/**
 * matrix multiplication with double arguments MA*MB.
 *
 * @param a matrix MA
 * @param b matrix MB
 * @return matrix MA*MB
 */
	public static BigDecimal[][] mult(final double[][] a, final double[][] b) {
		BigDecimal[][] ba = new BigDecimal[a.length][];
		BigDecimal[][] bb = new BigDecimal[b.length][];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = new BigDecimal[a[i].length];
			bb[i] = new BigDecimal[b[i].length];
			for (int j = 0; j < ba[i].length; j++) {
				ba[i][j] = new BigDecimal(a[i][j]);
				bb[i][j] = new BigDecimal(b[i][j]);
			}
		}

		return mult(ba, bb);

	}

/**
 * vector multiplication with double arguments A*B.
 *
 * @param a vector A
 * @param b vector B
 * @return value result A*B
 */
	public static BigDecimal mult(final double[] a, final double[] b) {
		BigDecimal[] ba = new BigDecimal[a.length];
		BigDecimal[] bb = new BigDecimal[b.length];
		for (int i = 0; i < bb.length; i++) {
			ba[i] = new BigDecimal(a[i],mc);
			bb[i] = new BigDecimal(b[i],mc);
		}
		return mult(ba, bb);
	}
	
	/**
	 * vector multiplication with BigDecimal arguments A*B.
	 *
	 * @param a vector A
	 * @param b vector B
	 * @return value result A*B
	 */
	public static BigDecimal mult(final BigDecimal[] a, final BigDecimal[] b) {
		if (a.length!=b.length){
			throw new IllegalArgumentException();
		}else{
			BigDecimal res = BigDecimal.ZERO;
			for (int i = 0; i < a.length; i++) {
				for (int j = 0; j < a.length; j++) {
					res = res.add(a[i].multiply(b[j]),mc);
				}
			}
			return res;			
		}
	}

/**
 * matrix on vector multiplication with BigDecimal arguments MA*B .
 *
 * @param ma matrix MA
 * @param b vector B
 * @return vector result MA*B
 */
	public static BigDecimal[] mult(final BigDecimal[][] ma,
			final BigDecimal[] b) {
		BigDecimal[] res = new BigDecimal[b.length];
		for (int i = 0; i < b.length; i++) {
			BigDecimal s = BigDecimal.ZERO;
			for (int j = 0; j < b.length; j++) {
				s = s.add(ma[i][j].multiply(b[j]),mc);
			}
			res[i] = s;
		}

		return res;
	}

/**
 * matrix on vector multiplication with double arguments MA*B.
 *
 * @param ma matrix MA
 * @param b vector B
 * @return vector value MA*B
 */
	public static BigDecimal[] mult(final double[][] ma, final double[] b) {
		BigDecimal[][] bma = new BigDecimal[ma.length][ma[0].length];
		BigDecimal[] bb = new BigDecimal[b.length];
		for (int i = 0; i < bma.length; i++) {
			for (int j = 0; j < bma[i].length; j++) {
				bma[i][j] = new BigDecimal(ma[i][j],mc);
			}
			bb[i] = new BigDecimal(b[i],mc);

		}
		return mult(bma, bb);
	}

/**
 * vector on matrix multiplication with BigDecimal arguments  A*MB.
 *
 * @param a vector A
 * @param mb matrix MB
 * @return vector result A*MB
 */
	public static BigDecimal[] mult(final BigDecimal[] a,
			final BigDecimal[][] mb) {
		BigDecimal[] res = new BigDecimal[mb[0].length];
		BigDecimal sum;
		for (int j = 0; j < res.length; j++) {
			sum = BigDecimal.ZERO;
			for (int k = 0; k < res.length; k++) {
				sum = sum.add(a[k].multiply(mb[k][j]),mc);
			}
			res[j] = sum;
		}

		return res;
	}

/**
 * vector on matrix multiplication with double arguments A*MB  .
 *
 * @param a vector A
 * @param mb matrix MD
 * @return vector result A*MB
 */
	public static BigDecimal[] mult(final double[] a, final double[][] mb) {
		BigDecimal[] ba = new BigDecimal[a.length];
		BigDecimal[][] bmb = new BigDecimal[mb.length][mb[0].length];
		for (int i = 0; i < bmb.length; i++) {
			for (int j = 0; j < bmb[0].length; j++) {
				bmb[i][j] = new BigDecimal(mb[i][j],mc);
			}
			ba[i] = new BigDecimal(a[i],mc);
		}
		return mult(ba, bmb);
	}
	
	/**
	 * matrix sum with BigDecimal arguments MA+MB.
	 *
	 * @param a matrix MA
	 * @param b matrix MB
	 * @return matrix MA+MB
	 */
	public static BigDecimal[][] add(final BigDecimal[][] a,
			final BigDecimal[][] b) {
		BigDecimal[][] res = new BigDecimal[a.length][];
		for (int i = 0; i < a.length; i++) {
			for (int j = 0; j < a[i].length; j++) {
				res[i] = new BigDecimal[a[i].length];
				res[i][j] = a[i][j].add(b[i][j],mc);
			}
		}
		return res;
	}
	
	/**
	 * matrix sum with double arguments MA+MB.
	 *
	 * @param a matrix MA
	 * @param b matrix MB
	 * @return matrix MA+MB
	 */
	public static BigDecimal[][] add(final double[][] a, final double[][] b) {
		BigDecimal[][] ba = new BigDecimal[a.length][];
		BigDecimal[][] bb = new BigDecimal[b.length][];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = new BigDecimal[a[i].length];
			bb[i] = new BigDecimal[b[i].length];
			for (int j = 0; j < ba[i].length; j++) {
				ba[i][j] = new BigDecimal(a[i][j],mc);
				bb[i][j] = new BigDecimal(b[i][j],mc);
			}
		}

		return add(ba, bb);
	}
	
	/**
	 * sum matrix and number with BigDecimal arguments MA+b.
	 *
	 * @param a matrix MA
	 * @param b number b
	 * @return matrix MA+b
	 */
	public static BigDecimal[][] add(final BigDecimal[][] a, final BigDecimal b) {
		BigDecimal[][] res = a;
		for (int i = 0; i < res.length; i++) {
			for (int j = 0; j < res[i].length; j++) {
				res[i][j] = res[i][j].add(b,mc);
			}
		}
		return res;
	}
	
	/**
	 * sum matrices with double arguments MA + b.
	 *
	 * @param a matrix MA
	 * @param b number b
	 * @return matrix MA+b
	 */
	public static BigDecimal[][] add(final double[][] a, final double b) {
		BigDecimal[][] ba = new BigDecimal[a.length][];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = new BigDecimal[a[i].length];
			for (int j = 0; j < ba[i].length; j++) {
				ba[i][j] = new BigDecimal(a[i][j],mc);
			}
		}
		return add(ba, new BigDecimal(b));
	}

	/**
	 * difference matrices with BigDecimal arguments MA-MB.
	 *
	 * @param a matrix MA
	 * @param b matrix MB
	 * @return matrix MA-MB
	 */
	public static BigDecimal[][] sub(final BigDecimal[][] a,
			final BigDecimal[][] b) {
		BigDecimal[][] res = new BigDecimal[a.length][];
		for (int i = 0; i < a.length; i++) {
			for (int j = 0; j < a[i].length; j++) {
				res[i] = new BigDecimal[a[i].length];
				res[i][j] = a[i][j].subtract(b[i][j],mc);
			}
		}
		return res;
	}

	/**
	 * difference matrices with BigDecimal arguments MA-MB.
	 *
	 * @param a matrix MA
	 * @param b matrix MB
	 * @return matrix MA-MB
	 */
	public static BigDecimal[][] sub(final double[][] a, final double[][] b) {
		BigDecimal[][] ba = new BigDecimal[a.length][];
		BigDecimal[][] bb = new BigDecimal[b.length][];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = new BigDecimal[a[i].length];
			bb[i] = new BigDecimal[b[i].length];
			for (int j = 0; j < ba[i].length; j++) {
				ba[i][j] = new BigDecimal(a[i][j],mc);
				bb[i][j] = new BigDecimal(b[i][j],mc);
			}
		}

		return sub(ba, bb);
	}

/**
 * matrix on number multiplication with BigDecimal arguments MA*b.
 *
 * @param a matrix MA
 * @param b value b
 * @return matrix MA*b
 */
	public static BigDecimal[][] mult(final BigDecimal[][] a, final BigDecimal b) {
		BigDecimal[][] res = a;
		for (int i = 0; i < res.length; i++) {
			for (int j = 0; j < res[i].length; j++) {
				res[i][j] = res[i][j].multiply(b,mc);
			}
		}
		return res;
	}
	
	/**
	 * matrix on number multiplication with double arguments MA*b.
	 *
	 * @param a matrix MA
	 * @param b value b
	 * @return matix MA*b
	 */
	public static BigDecimal[][] mult(final double[][] a, final double b) {
		BigDecimal[][] ba = new BigDecimal[a.length][];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = new BigDecimal[a[i].length];
			for (int j = 0; j < ba[i].length; j++) {
				ba[i][j] = new BigDecimal(a[i][j],mc);
			}
		}
		return mult(ba, new BigDecimal(b,mc));
	}
	
	/**
	 * matrix on number sum with BigDecimal arguments A + B.
	 *
	 * @param a vector A
	 * @param b vector B
	 * @return vector A+B
	 */
	public static BigDecimal[] add(final BigDecimal[] a, final BigDecimal[] b) {
		BigDecimal[] res = new BigDecimal[a.length];
		for (int i = 0; i < res.length; i++) {
			res[i] = a[i].add(b[i],mc);
		}
		return res;
	}
	
	/**
	 * vectors sum with BigDecimal arguments A+B.
	 *
	 * @param a vector A
	 * @param b vector B
	 * @return vector A+B
	 */
	public static BigDecimal[] add(final double[] a, final double[] b) {
		BigDecimal[] ba = new BigDecimal[a.length];
		BigDecimal[] bb = new BigDecimal[b.length];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = new BigDecimal(a[i],mc);
			bb[i] = new BigDecimal(b[i],mc);
		}
		return add(ba, bb);
	}
	
	/**
	 * vectors sum with double arguments A+b.
	 *
	 * @param a vector A
	 * @param b number b
	 * @return vector A+b
	 */
	public static BigDecimal[] add(final BigDecimal[] a, final BigDecimal b) {
		BigDecimal[] res = a;
		for (int i = 0; i < res.length; i++) {
			res[i] = res[i].add(b);
		}
		return res;
	}
	
	/**
	 * vector and number sum with double arguments A+b.
	 *
	 * @param a vector A
	 * @param b number b
	 * @return vector A+b
	 */
	public static BigDecimal[] add(final double[] a, final double b) {
		BigDecimal[] ba = new BigDecimal[a.length];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = new BigDecimal(a[i]);
		}
		return add(ba, new BigDecimal(b,mc));

	}

/**
 * difference vectors with BigDecimal arguments A-B.
 *
 * @param a vector A
 * @param b vector B
 * @return vevtor A-B
 */
	public static BigDecimal[] sub(final BigDecimal[] a, final BigDecimal[] b) {
		BigDecimal[] res = new BigDecimal[a.length];
		for (int i = 0; i < res.length; i++) {
			res[i] = a[i].subtract(b[i],mc);
		}
		return res;

	}
	
	/**
	 * difference vectors with double arguments A-A.
	 *
	 * @param a vector A
	 * @param b vector A
	 * @return vector A-A
	 */
	public static BigDecimal[] sub(final double[] a, final double[] b) {
		BigDecimal[] ba = new BigDecimal[a.length];
		BigDecimal[] bb = new BigDecimal[b.length];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = new BigDecimal(a[i],mc);
			bb[i] = new BigDecimal(b[i],mc);
		}
		return sub(ba, bb);
	}

	/**
	 * vector on number multiplication with double arguments A*b.
	 *
	 * @param a vector A
	 * @param b number b
	 * @return vector A*b
	 */
	public static BigDecimal[] mult(final BigDecimal[] a, final BigDecimal b) {
		BigDecimal[] res = a;
		for (int i = 0; i < res.length; i++) {
			res[i] = a[i].multiply(b,mc);
		}
		return res;
	}
	
	/**
	 * vector on number multiplication with double arguments A*b.
	 *
	 * @param a vector A
	 * @param b number b
	 * @return vector A*b
	 */
	public static BigDecimal[] mult(final double[] a, final double b) {
		BigDecimal[] ba = new BigDecimal[a.length];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = new BigDecimal(a[i],mc);
		}
		return mult(ba, new BigDecimal(b,mc));
	}

	/**
	 * vector sorting.
	 *
	 * @param a vector A
	 * @return result
	 */
	public static BigDecimal[] sort(BigDecimal[] a) {
		BigDecimal[] res = a;
		Arrays.sort(res);
		return res;
	}

/**
 * binary search search in matrix.
 *
 * @param ma the ma
 * @param key the key
 * @return the int
 */
	public static int binarySearch(BigDecimal[][] ma, BigDecimal key) {
		return Arrays.binarySearch(ma, key);
	}

/**
 * determinant calculation.
 *
 * @param ma matrix
 * @return determinant
 */
	public static BigDecimal det(BigDecimal[][] ma) {
		BigDecimal calcResult = BigDecimal.ZERO;
		if (ma.length == 2) {
			BigDecimal res1 = ma[0][0].multiply(ma[1][1],mc);
			BigDecimal res2 = ma[1][0].multiply(ma[0][1],mc);
			calcResult = res1.subtract(res2, mc);
		} else {
			int koeff = 1;
			for (int i = 0; i < ma.length; i++) {
				if (i % 2 == 1) {
					koeff = -1;
				} else {
					koeff = 1;
				}
				;
				BigDecimal b = ma[0][i].multiply(new BigDecimal(koeff,mc));
				b = b.multiply(det(getMinor(ma, 0, i)),mc);
				calcResult = calcResult.add(b,mc);
			}
		}
		return calcResult;
	}

/**
 * minor calculation.
 *
 * @param matrix matrix for calculation
 * @param row number row
 * @param column number column
 * @return the minor
 */
	private static BigDecimal[][] getMinor(BigDecimal[][] matrix, int row,
			int column) {
		int minorLength = matrix.length - 1;
		BigDecimal[][] minor = new BigDecimal[minorLength][minorLength];
		int dI = 0;
		int dJ = 0;
		for (int i = 0; i <= minorLength; i++) {
			dJ = 0;
			for (int j = 0; j <= minorLength; j++) {
				if (i == row) {
					dI = 1;
				} else {
					if (j == column) {
						dJ = 1;
					} else {
						minor[i - dI][j - dJ] = matrix[i][j];
					}
				}
			}
		}
		return minor;

	}

/**
 * search max element in matrix ma.
 *
 * @param ma matrix
 * @return max element
 */
	public static BigDecimal max(BigDecimal[] ma) {
		BigDecimal max = ma[0];
		for (int i = 1; i < ma.length; i++) {
			if (max.compareTo(ma[i]) < 0)
				max = ma[i];
		}
		return max;
	}

/**
 * search min element in matrix.
 *
 * @param ma matrix
 * @return min element
 */
	public static BigDecimal min(BigDecimal[] ma) {
		BigDecimal min = ma[0];
		for (int i = 1; i < ma.length; i++) {
			if (min.compareTo(ma[i]) > 0)
				min = ma[i];
		}
		return min;
	}

/**
 * matrix transposition.
 *
 * @param ma matrix
 * @return transposition matrix
 */
	public BigDecimal[][] transpone(BigDecimal[][] ma) {
		BigDecimal[][] tmp = new BigDecimal[ma[0].length][ma.length];
		for (int i = 0; i < ma[0].length; i++) {
			for (int j = 0; j < ma.length; j++) {
				tmp[i][j] = ma[j][i];
			}
		}
		return tmp;
	}

}
