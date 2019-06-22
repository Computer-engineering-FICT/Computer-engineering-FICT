package kpi.teorver.lab_1;

public class ConGenerator {
	public static int[] random(int n) {
		int x[] = new int[n];
		x[0] = (int) (Math.abs(System.currentTimeMillis()));
		int a = 106;
		int b = 1283;
		int m = 6075;
		int k = 0;
		for (int i = 1; i < n; i++) {
			x[i] = (int) (Math.abs(((x[i - 1] * a - b) % m) ));
			x[i] = x[i] % 256; 
			while (x[i - 1] != 0) {
				if (x[i - 1] % 2 == 0)
					k++;
				x[i - 1] = x[i - 1] / 2;
			}
			x[i - 1] = k % 2;
		}
		x[x.length - 1] = (int) (x[x.length - 1] % 2);
		return x;
	}
}
