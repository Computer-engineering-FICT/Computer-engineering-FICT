import org.apache.commons.math.linear.Array2DRowRealMatrix;
import org.apache.commons.math.linear.RealMatrix;

public class Main {
	
	public static void printStationaryP(double[][] transferMatrix) {
		double[][] array1 = new double[transferMatrix.length][transferMatrix.length];
		double[][] array2 = new double[transferMatrix.length][1];
		array2[0][0] = 1;
		for (int i = 0; i < transferMatrix.length; i++) {
			array1[0][i] = 1;
		}
		for (int i = 1; i < transferMatrix.length; i++) {
			for (int j = 0; j < transferMatrix.length; j++) {
				if (i == j) {
					for (int k = 0; k < transferMatrix.length; k++) {
						if (k != j) {
							array1[i][j] -= transferMatrix[j][k];
						}
					}
				} else {
					array1[i][j] = transferMatrix[j][i];
				}
			}
		}
		RealMatrix mat1 = new Array2DRowRealMatrix(array1);
		RealMatrix mat2 = new Array2DRowRealMatrix(array2);
		mat1 = mat1.inverse();
		double[][] result = mat1.multiply(mat2).getData();
		for(int i = 0; i < result.length; i++){
			System.out.println("P" + (i + 1) + " = " + result[i][0]);
		}
	}

	public static void main(String[] args) {
		double[][] transferMatrix = {{0.2, 0.1, 0.1, 0.1, 0.0, 0.0, 0.5},
									 {0.0, 0.0, 0.4, 0.0, 0.6, 0.0, 0.0}, 
									 {0.2, 0.5, 0.0, 0.0, 0.0, 0.0, 0.3}, 
									 {0.0, 0.0, 0.5, 0.2, 0.0, 0.0, 0.3}, 
									 {0.0, 0.0, 0.3, 0.0, 0.7, 0.0, 0.0}, 
									 {0.0, 0.0, 0.0, 0.0, 0.4, 0.3, 0.3}, 
									 {0.0, 0.0, 0.0, 0.4, 0.0, 0.0, 0.6}};
		Main.printStationaryP(transferMatrix);
		double[][] additionalMatrix = new double[7][7];
		for (int i = 0; i < transferMatrix.length; i++) {
			additionalMatrix[i][0] = transferMatrix[i][0];
			for (int j = 1; j < transferMatrix.length; j++) {
				additionalMatrix[i][j] = transferMatrix[i][j] + additionalMatrix[i][j - 1];
			}
		}
		double r;
		int[] count = {0, 0, 0, 0, 0, 0, 0};
		boolean[] state = {true, false, false, false, false, false, false};
		for (int k = 0; k < 1000; k++) { 
			r = Math.random();
			int i;
			for (i = 0; i < state.length; i++) {
				if (state[i] == true) {
					break;
				}
			}
			if (r < additionalMatrix[i][0]) {
				count[0]++;
				for (int l = 0; l < state.length; l++) {
					state[l] = false;
				}
				state[0] = true;
			} else {
				for (int j = 0; j < transferMatrix.length; j++) {
					if ((r > additionalMatrix[i][j]) && (r <= additionalMatrix[i][j + 1])) {
						count[j + 1]++;
						for (int l = 0; l < state.length; l++) {
							state[l] = false;
						}
						state[j + 1] = true;
						break;
					}
				}
			}

		}
		double[] countD = new double[7];
		for (int i = 0; i < countD.length; i++) {
			countD[i] = count[i];
		}
		for (int i = 0; i < count.length; i++) {
			System.out.println("P" + (i + 1) + " = " + countD[i]/1000);
		}
	}
}
