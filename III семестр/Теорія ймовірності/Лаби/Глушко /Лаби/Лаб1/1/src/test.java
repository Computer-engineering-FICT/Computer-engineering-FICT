public class test {

	// Тест первый - частотный.
	public static double test1(byte[] result) {
		double suma = 0;
		for (int i = 0; i < result.length; i++)
			if (result[i] == 1)
				suma++;
		return (suma / result.length);
	}

	// Тест второй - дифференциально частотный
	public static double test2(byte[] result) {
		double suma = 0;
		for (int i = 0; i < result.length - 1; i++)
			if (result[i] != result[i + 1])
				suma++;
		return Math.abs(suma / result.length - 1);
	}

	// Тест третий - ранговый.
	public static int[] test3(byte[] result, int window_width) {
		int[] table = new int[1 << window_width];
		int value_inside_window = 0;
		final int last_step = result.length - window_width + 1;
		for (int i = 0; i < last_step; i++) {
			value_inside_window = 0;
			for (int j = 0; j < window_width; j++)
				if (result[i + j] == 1)
					value_inside_window += 1 << j;
			table[value_inside_window]++;
		}
		return table;
	}

	// Тест четветрый - линейная проверка
	private static int[] IncC(int[] c, int[] b) {
		int[] nc = new int[c.length];
		for (int i = 0; i < nc.length; i++)
			nc[i] = c[i] ^ b[i];
		return nc;
	}

	private static int[] IncB(int[] b, int x) {
		int[] nb = new int[b.length];
		for (int i = 0; i < b.length - x; i++)
			nb[i + x] = b[i];
		return nb;
	}

	private static CorrectC4(int[] C, int[] B)
	public static void test4(byte[] a) {
		int x = 1, l = 0, n = 0, d;
		int[] c = new int[a.length], b = new int[a.length], t = new int[a.length];
		c[0] = 1;
		b[0] = 1;
		do {
			// step 2
			d = a[n];
			// Calculating formula from step 2
			for (int j = 1; j < l; j++)
				d ^= c[j] & a[n - j];
			if (d == 0) // step 3; on success skip steps 4, 5
				x++;
			else { // failure on step 3, go through steps 4 or 5
				if (2 * l > n) { // step 4
					c = IncC(c, IncB(b, x));
					x++;
				} else { // step 5
					l = n + 1 - l;
					for (int i = 0; i < c.length; i++)
						t[i] = c[i];
					c = IncC(c, IncB(b, x));
					for (int i = 0; i < b.length; i++)
						b[i] = t[i];
					x = 1;
				}
			}
			n++; // step 6 followed by check for completion
		} while (n < a.length);
		System.out.println("Результаты 4-го теста(линейная проверка):" + (l));
	}
}
