import java.util.Arrays;
import java.util.Scanner;
import org.apache.commons.math3.linear.*;

public class Main {
	// ���������� ������
	static int countEquations = 3;

	/**
	 * ������� ������� ���������
	 * 
	 * @param matrix
	 *            - ������� ������������
	 * @param resultRow
	 *            - ������� � ������������ ���������
	 * @return - ������� � �������� �������
	 */
	public static double[] solution(double[][] matrix, double[] resultRow) {
		RealMatrix realMatrix = new Array2DRowRealMatrix(matrix);
		RealMatrix realResultRow = new Array2DRowRealMatrix(resultRow);
		// ������� �������� �������
		RealMatrix inverseMatrix = MatrixUtils.blockInverse(realMatrix, 1);
		// �������� �������� ������� �� ������� �����������
		RealMatrix result = inverseMatrix.multiply(realResultRow);

		result = result.transpose();
		return result.getData()[0];
	}

	/**
	 * ������� ������� ������� ��������� �� ������� �����
	 * 
	 * @param g
	 *            - ������� �����
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
		// ������� � ��������� �����
		double[][] g = new double[][] { { 3, 1, 1.5 }, { 0, 0, 1 }, { 2, 0, 1 } };

		// ������� ���������
		double[][] matrixEquations = createMatrixEquations(g);

		double[] resultRow = new double[countEquations];
		resultRow[resultRow.length - 1] = 1;
		//������� ���������
		double[] p = solution(matrixEquations, resultRow);
		System.out.println("������������� ��������");
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
		System.out.println("������������ ��������");
		for (int i = 0; i < mP.length; i++) {
			System.out.println("p" + (i + 1) + " = " + mP[i]);
		}
	}

}
