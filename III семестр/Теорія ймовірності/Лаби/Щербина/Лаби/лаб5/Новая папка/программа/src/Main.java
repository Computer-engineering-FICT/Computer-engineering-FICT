import java.util.Arrays;
import java.util.Scanner;
import org.apache.commons.math3.linear.*;

public class Main {
	// количество вершин
	static int countEquations = 3;

	/**
	 * решение системы уравнений
	 * 
	 * @param matrix
	 *            - матрица коефициентов
	 * @param resultRow
	 *            - столбец с результатами уравнений
	 * @return - столбец с решением системы
	 */
	public static double[] solution(double[][] matrix, double[] resultRow) {
		RealMatrix realMatrix = new Array2DRowRealMatrix(matrix);
		RealMatrix realResultRow = new Array2DRowRealMatrix(resultRow);
		// находим обратную матрицу
		RealMatrix inverseMatrix = MatrixUtils.blockInverse(realMatrix, 1);
		// умножаем обратную матрицу на столбец результатов
		RealMatrix result = inverseMatrix.multiply(realResultRow);

		result = result.transpose();
		return result.getData()[0];
	}

	/**
	 * создает матрицу системы уравнений по матрице графа
	 * 
	 * @param g
	 *            - матрица графа
	 * @return
	 */
	static public double[][] createMatrixEquations(double[][] g) {
		double[][] result = new double[g.length][countEquations];
		Arrays.fill(result[result.length - 1], 1.0);
		for (int i = 0; i < g.length - 1; i++) {
			for (int j = 0; j < result.length; j++) {
				result[i][j] = g[j][i];
			}
			for (int j = 0; j < result.length; j++) {
				result[i][i] += -g[i][j];
			}
		}

		return result;
	}

	public static void main(String[] args) {
		// матрица с описанием графа
		double[][] g = new double[][] { { 3, 1, 1.5 }, { 0, 0, 1 }, { 2, 0, 1 } };

		// матрица уравнений
		double[][] matrixEquations = createMatrixEquations(g);

		double[] resultRow = new double[countEquations];
		resultRow[resultRow.length - 1] = 1;
		//решение уравнений
		double[] p = solution(matrixEquations, resultRow);
		System.out.println("Теоретические значения");
		for (int i = 0; i < p.length; i++) {
			System.out.println("p" + (i + 1) + " = " + p[i]);
		}

		int count = 1000;
		MarkovProcess mp = new MarkovProcess(g, 0);
		for (int i = 0; i < count; i++) {
			try {
				mp.next();
			} catch (StopException e) {
				break;
			}
		}
		System.out.println();
		double[] mP = mp.pState();
		System.out.println("Практические значения");
		for (int i = 0; i < mP.length; i++) {
			System.out.println("p" + (i + 1) + " = " + mP[i]);
		}
	}

}
