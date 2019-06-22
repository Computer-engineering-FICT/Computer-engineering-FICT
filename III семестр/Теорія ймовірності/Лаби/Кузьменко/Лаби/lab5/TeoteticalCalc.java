import java.util.Arrays;

public class TeoteticalCalc {
	private double[][] mas;
	private int n;
	private double[][] balansSystem;
	double[] p = null;

	public TeoteticalCalc(double[][] mas) {
		this.mas = mas;
		n = mas.length;
		balansSystem = new double[n][n + 1];
		setBalansSystem();
		solve_by_gaussian_elimination(balansSystem);
		System.out.println("Теоретичний розрахунок");
		for (int i = 0; i < p.length; i++) {
			System.out.printf("p" + (i + 1) + " = " + "%5.4f", p[i]);
			System.out.println();
		}
	}

	private void setBalansSystem() {
		for (int i = 0; i < balansSystem[0].length; i++) {
			balansSystem[0][i] = 1;
		}
		int k = 0;
		for (int i = 0; i < n - 1; i++) {
			double sum = 0;
			for (int j = 0; j < mas.length; j++) {
				sum += mas[i][j];
			}
			balansSystem[k + 1][i] = -sum;
			k++;
		}

		for (int i = 0; i < n - 1; i++) {
			for (int j = 0; j < mas.length; j++) {
				if (mas[j][i] != 0) {
					balansSystem[i + 1][j] = mas[j][i];
				}
			}
		}

	}

	public void solve_by_gaussian_elimination(double[][] a) {
		double[][] x = new double[a.length][a[0].length];
		for (int i = 0; i < a.length; i++)
			x[i] = Arrays.copyOf(a[i], a[i].length);
		double p;
		for (int i = 0; i < x.length; i++)
			for (int j = 0; j < x.length; j++)
				if (i != j) {
					p = x[j][i] / x[i][i];
					for (int k = i; k <= x.length; ++k)
						x[j][k] -= p * x[i][k];
				}
		double[] b = new double[x.length];
		for (int i = 0; i < x.length; i++)
			b[i] = x[i][x.length] / x[i][i];
		this.p = Arrays.copyOf(b, b.length);
	}

}
