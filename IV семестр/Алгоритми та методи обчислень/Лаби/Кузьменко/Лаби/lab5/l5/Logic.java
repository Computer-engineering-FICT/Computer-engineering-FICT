package l5;

public class Logic {
	public double[][] A;
	public double[] B;
	private int k;
	public double[] X;
	
	public Logic(double[][] A, double[] B) {
		this.A = A;
		this.B = B;
		this.k = B.length;
		this.X = new double[k];
		up_trian_mat();
		solve_X();
	}
	
	
	/**
	 * Обчислення коренів СЛАР
	 */
	public void solve_X() {
		for (int i = k - 1; i > -1; i--) {
			double tmp = 0;
			
			for (int j = k - 1; j > i; j--) {
				tmp += A[i][j] * X[j];
			}
			
			X[i] = (B[i] - tmp) / A[i][i];
		}
	}
	
	
	/**
	 * Перетворення матриці коефіцієнтів А у верхню трикутну матрицю
	 */
	public void up_trian_mat() {
		double M;
		
		for (int h = 0; h < k - 1; h++) {
			normalize(h);
			
			for (int i = h; i < k - 1; i++) {
				M = A[i + 1][h] / A[h][h];
				
				for (int j = h; j < k; j++) {
					A[i + 1][j] -= M * A[h][j];
				}
				
				B[i + 1] -= M * B[h];
				for (int g = 0; g < k; g++) {
					for (int n = 0; n < k; n++) {
						System.out.print(Math.rint(A[g][n] * 100000) / 100000 + "; ");
					}
					System.out.print("\n");
				}
				System.out.print("\n");
				
			}
			
		}
	}
	
	
	/**
	 * Перевірка знаменника множника M на нуль.
	 * @param h
	 */
	public void normalize(int h) {
		if (A[h][h] == 0) {
			int i = h + 1;
			
			while (A[i][h] == 0) {
				i++;
				if (i == k + 1) {
					break;
				}
			}
			
			swap(i);
		}
	}
	
	
	/**
	 * Обмін i-го і нульового рявняння.
	 * @param i
	 */
	public void swap(int i) {
		double tmp;
		
		for (int j = 0; j < k; j++) {
			tmp = A[i][j];
			A[i][j] = A[0][j];
			A[0][j] = tmp;
		}
		
		tmp = B[i];
		B[i] = B[0];
		B[0] = tmp;
	}
	
}
