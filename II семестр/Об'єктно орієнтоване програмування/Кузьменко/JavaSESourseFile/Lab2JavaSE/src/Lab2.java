public class Lab2 {
	public static void main(String[] args) {
		double z = 0;
		int i, j, k;
		double a[][] = { { 0, 1 }, { -2, 3 }, { 10, 9 }, };
		double b[][] = { { 3, 1, 2, -1 }, { -1, 0, 7, -5 } };
		int y = 0;
		i = 0;
		for (int l = 0; l < a.length; l++) {
			if (a[i].length == a[0].length) {
				y = 0;
				i++;
			} else
				y = -1;
		}
		if (y == -1)
			System.out.println("не правильна матриц€ a");
		i = 0;
		int e = 0;
		for (int l = 0; l < b.length; l++) {
			if (b[i].length == b[0].length) {
				e = 0;
				i++;
			} else
				e = -1;
		}
		if (e == -1)
			System.out.println("не правильна матриц€ b");
		if ((y != -1) & (e != -1)) {
			double[][] c = new double[a.length][b[0].length];
			if ((b.length == a[0].length)) {
				for (i = 0; i < a.length; i++) {
					for (j = 0; j < b[0].length; j++) {
						for (k = 0; k < a[0].length; k++)
							z += a[i][k] * b[k][j];
						c[i][j] = z;
						z = 0;
					}
				}
				for (i = 0; i <= a.length - 1; i++) {
					for (j = 0; j <= b[0].length - 1; j++) {
						System.out.print(c[i][j] + " ");
					}
					System.out.println();
				}
				double max;
				j = 0;
				z = 0;
				for (i = 0; i <= b[0].length - 1; i++) {
					j = 0;
					max = c[j][i];
					for (j = 0; j <= a.length - 1; j++) {
						if (c[j][i] > max) {
							max = c[j][i];
						}
					}
					z += max;
				}
				System.out.println(z);
			} else
				System.out.println("неправильн≥ розм≥ри матриць");
		} else
			System.out.println("помилка");
	}
}
