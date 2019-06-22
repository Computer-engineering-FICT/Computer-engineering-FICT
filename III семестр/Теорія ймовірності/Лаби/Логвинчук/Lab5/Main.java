package Lab5;

import java.util.Arrays;
import java.util.Random;

import org.apache.commons.math3.linear.Array2DRowRealMatrix;
import org.apache.commons.math3.linear.ArrayRealVector;
import org.apache.commons.math3.linear.DecompositionSolver;
import org.apache.commons.math3.linear.LUDecomposition;
import org.apache.commons.math3.linear.RealVector;
import org.apache.commons.math3.linear.RealMatrix;

public class Main {
		 
	static final double[][] intencityMatrix = {{0., 0.5, 2},
											   {0., 0., 0.1},
			   						           {1, 1.5, 0.}};
	
	static double[][] getCoefMatrix(double[][] matrix) {
		int rank = matrix.length;
	
		double[][] coefMatrix = new double[rank][rank];
		
		for (int i = 0; i < rank; i++) {
			coefMatrix[rank-1][i] = 1.;
		}
		
		for (int i = 0; i < rank-1; i++ ) {
			for (int j = 0; j < rank; j++) {
				if (i == j) {
					for (int k = 0; k < rank; k++ ){
						coefMatrix[i][j] -= matrix[i][k];
					} 
				} else {
					coefMatrix[i][j] = matrix[j][i];
				}
			}
		}
		return coefMatrix;
	}
	
	static double[] getTheoreticalValues(double[][] matrix) {
		
		double[][] coeffs = getCoefMatrix(intencityMatrix);
		double[] bVector = new double[coeffs.length];
		
		Arrays.fill(bVector, 0.);
		bVector[bVector.length-1] = 1.;
		
		RealVector constants = new ArrayRealVector(bVector, false);
		RealMatrix coefficients = new Array2DRowRealMatrix(coeffs, false);
		DecompositionSolver solver = new LUDecomposition(coefficients).getSolver();
		
		RealVector result = solver.solve(constants);
		
		return result.toArray();
	}
	
	static double [] getExperimentalValues(double[][] matrix) {
		int rank = matrix.length;
		
		double[] result = new double[rank];
		double modelTime = 0.;
		
		Random rnd = new Random();
		int currentState = 0;
		
		for (int count = 0; count < 1000; count++){
			int nextState = 0;
			boolean firstEntry = true;
			double t = 0.;
			
			for (int i = 0; i < rank; i++) {
				if (matrix[currentState][i] != 0.) {
					if (firstEntry) {
						t = (-1. / matrix[currentState][i])*Math.log(rnd.nextDouble());
						nextState = i;
						firstEntry = false;
					} else {
						double k = (-1. / matrix[currentState][i])*Math.log(rnd.nextDouble());
						if (k < t) {
							t = k;
							nextState = i;
						}
					}
				}
			}
			modelTime += t;
			result[currentState] += t;
			currentState = nextState;
		}
		
		for (int i = 0; i < result.length; i++) {
			result[i] /= modelTime;
		}
		return result;
	}

	public static void main(String[] args) {
		
		double[] theoretical = getTheoreticalValues(intencityMatrix);
		
		for (int i = 0; i < theoretical.length; i++) {
			System.out.println("P" + (i+1) + "t = " + theoretical[i]);
		}
		
		System.out.println();
		
		//HERE GOES THE EMPIRICAL PART
		
		double[] experimental = getExperimentalValues(intencityMatrix);
		
		for (int i = 0; i < experimental.length; i++) {
			System.out.println("P" + (i+1) + "e = " + experimental[i]);
		}
		
	}
}
