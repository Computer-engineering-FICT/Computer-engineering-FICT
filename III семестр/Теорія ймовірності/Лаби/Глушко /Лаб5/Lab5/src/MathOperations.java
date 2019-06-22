
public class MathOperations {

	public static double vmul(double v1[], double v2[]) throws Exception {
		if (v1.length != v2.length)
			throw new Exception("Different array sizes");
		double result = 0.0;
		for (int i=0; i<v1.length; i++)
			result += v1[i]*v2[i];
		return result;
	}

	public static double [] vadd(double v1[], double v2[]) {
		if (v1.length != v2.length)
			return null;
		double result[] = new double[v1.length];
		for (int i=0; i<v1.length; i++) {
			result[i] = v1[i] + v2[i];
		}
		return result;
	}

	public static double[] mvmul(double matrix[][], double vector[]) {
		if (matrix.length != vector.length)
			return null;
		double result[] = new double[vector.length];
		for (int i=0; i<vector.length; i++) {
			result[i] = 0.0;
			for (int j=0; i<vector.length; j++) {
				result[i] += vector[j]*matrix[j][i];
			}
		}
		return result;
	}

	public static double [][]matrixP(double graphMatrix[][]) {
		double result[][] = new double [graphMatrix.length][graphMatrix.length];
		int i;
		for (i=0; i<graphMatrix.length; i++) {
			result[i][0] = graphMatrix[i][0];
		}
		for(i=1; i<graphMatrix.length; i++) {
			for (int j=0; j<graphMatrix.length; j++) {
				result[i][j] = result[i-1][j] + graphMatrix[i][j];
			}
		}
		return result;
	}

	private static int minLargerIndex(double value, double row[]) {
		int result = -1;
		for(int i=0; i<row.length; i++) {
			if (row[i] >= value) {
				if (result == -1) {
					result = i;
				}
				else if (row[i] < row[result]) {
					result = i;
				}
			}
		}
		return result;
	}

	public static double[] experimentalPropabilities(double matrix[][], int iterations) {
		double vector[] = new double[matrix.length];
		for (int i=0; i<matrix.length; i++) {
			vector[i] = 0.0;
		}
		for (int step=0; step<iterations; step++) {
			for (int i=0; i<matrix.length; i++) {
				double value = Math.random();
				int index = minLargerIndex(value, matrix[i]);
				vector[index] += 1.0;
			}
		}
		for (int i=0; i<matrix.length; i++) {
			vector[i] /= ((double)iterations);
		}
		return vector;
	}
}
