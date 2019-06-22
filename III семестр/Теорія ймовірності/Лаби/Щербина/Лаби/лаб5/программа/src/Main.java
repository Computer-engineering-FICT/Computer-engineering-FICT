import java.util.Arrays;
import java.util.Scanner;
import org.apache.commons.math3.linear.*;

public class Main {
	static int z[][][] = { 
		{ { 1, 0 }, { 2, 1 }, { 3, 2 } },
		{ { 0, 4 }, { 4, 5 }, { 5, 3 } } };
	static int countEquations = 6;

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

		RealMatrix inverseMatrix = MatrixUtils.blockInverse(realMatrix, 1);
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
			for (int j = 0; j < g[i].length; j++)
				if (g[i][j] < 0) {
					result[i][i] += g[i][j];
				} else
					result[i][j] += g[i][j];
		}

		return result;
	}

	public static void main(String[] args) {
		double[] teoryP = new double[2];
		double[] modelP = new double[2];
		 double[] a = new double[2];
		 System.out.println("������� " + a.length + " ���������");
		 Scanner in = new Scanner(System.in);
		 for (int i = 0; i < a.length; i++) {
		 a[i] = in.nextDouble();
		 }
		// ������� � ��������� �����
		double[][] g = new double[countEquations][countEquations];
		for (int i = 0; i < z.length; i++) {
			for (int j = 0; j < z[i].length; j++) {
				g[z[i][j][0]][z[i][j][1]] = 3 *  a[i];
				g[z[i][j][1]][z[i][j][0]] = -3 * a[i];
			}
		}

		// ������� ���������
		double[][] matrixEquations = createMatrixEquations(g);

		double[] resultRow = new double[countEquations];
		resultRow[resultRow.length - 1] = 1;
		double[] p = solution(matrixEquations, resultRow);
//		for (int i = 0; i < p.length; i++) {
//			System.out.println(p[i]);
//		}
		for (int j = 0; j < p.length; j++) {
			if (j < 3)
				teoryP[0] += p[j];
			else
				teoryP[1] += p[j];
		}
		System.out.println("������������� ��������");
		for (int i = 0; i < teoryP.length; i++) {
			System.out.println("p" + (i + 1) + " = " + teoryP[i]);
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
		for (int i = 0; i < mP.length; i++) {
			if (i < 3)
				modelP[0] += mP[i];
			else
				modelP[1] += mP[i];
		}
//		for (int i = 0; i < mP.length; i++) {
//			System.out.println(mP[i]);
//		}
		System.out.println("������������ ��������");
		for (int i = 0; i < modelP.length; i++) {
			System.out.println("p" + (i + 1) + " = " + modelP[i]);
		}
	}

}
