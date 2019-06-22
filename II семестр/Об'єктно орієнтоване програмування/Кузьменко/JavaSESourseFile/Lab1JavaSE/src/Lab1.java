public class Lab1 {
	public static void main(String[] args) {
		byte i, j;
		int m = 1, n = 1;
		double s = 0;
		for (i = 0; i <= n; i++) {
			for (j = 0; j <= m; j++) {
				s += (double) (i - j) / (i + 2);
			}
		}
		System.out.println(s);
	}
}
