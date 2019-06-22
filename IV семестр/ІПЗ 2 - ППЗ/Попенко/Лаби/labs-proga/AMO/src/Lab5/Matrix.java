package Lab5;

public class Matrix {
	private double[][] matrix;
	private int degree;
	
	public Matrix(double[][] matrix) {
		this.matrix = matrix;
		degree = matrix.length;
	}
	
	public double getElement(int row, int column) {
		return matrix[row][column];
	}
	@Override
	public String toString() {
		String result = "";
		for(int i = 0; i < degree; i++) {
			result += "| ";
			for(int j = 0; j < degree; j++)
				result += matrix[i][j] + "\t ";
			result += "|\n";
		}
		return result;
	}
	
	public void swapElements(int r1, int c1, int r2, int c2) {
		double a = matrix[r1][c1];
		matrix[r1][c1] = matrix[r2][c2];
		matrix[r2][c2] = a;
	}
	public void swapRows(int r1, int r2) {
		if(r1 == r2)
			return;
		for(int i = 0; i < degree; i++)
			swapElements(r1, i, r2, i);
	}
	
	public void addRows(int r1, int r2, double k) {
		for(int i = 0; i < degree; i++)
			matrix[r1][i] += matrix[r2][i] * k;
	}
	public void mulRow(int r, double m) {
		for(int i = 0; i < degree; i++)
			matrix[r][i] *= m;
	}
}
