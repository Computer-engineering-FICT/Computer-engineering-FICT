import java.util.LinkedList;
import java.util.List;


public class Lab5 {

	public static double matrix [][] = {
		{0.5 , 0.3 , 0.2}, 
		{0 , 0.3 , 0.7},
		{0.8 , 0.2 , 0}
		
	};

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// Experimental (?)
		double matrixP[][] = MathOperations.matrixP(matrix);
		double expProbabilities[] = MathOperations.experimentalPropabilities(matrixP, 1000);
		// Theoretical (?)
		double vector[] = new double [matrix.length];
		for (int i=1; i<vector.length; i++) {
			vector[i] = 0.0;
		}
		vector[0] = 1.0;
		List<double[]> stepVectors = new LinkedList<double[]>();
		double stepVector[];
		for (int i=0; i< 20; i++) {
			stepVector = MathOperations.mvmul(matrix, vector);
			stepVectors.add(stepVector);
		}
		// Here we have probabilities from method 1 (experimental?) with 1000 iterations
		// and probabilities from 20-iterations theoretical calculations
	}

}
