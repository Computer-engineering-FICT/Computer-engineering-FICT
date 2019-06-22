package random;

import java.util.Arrays;

public class TestRandom {
	/**
	 * дифференциальный тест
	 * 
	 * @param inData
	 *            - последовательность битов (каждый бит в отдельной €чейке)
	 * @return
	 */
	public static double differentialTest(int[] inData) {
		int countAll = inData.length - 1;
		int countOne = 0;
		for (int i = 0; i < inData.length - 1; i++)
			if ((inData[i] ^ inData[i + 1]) == 1)
				countOne++;
		return ((double) countOne) / countAll;
	}

	/**
	 * „астотный тест
	 * 
	 * @param inData
	 *            - последовательность битов (каждый бит в отдельной €чейке)
	 * @return
	 */
	public static double frequencyTest(int[] inData) {
		int countAll = inData.length;
		int countOne = 0;
		for (int i = 0; i < inData.length; i++)
			if (inData[i] == 1) {
				countOne++;
			} else if (inData[i] != 0)
				throw new IllegalArgumentException("Elemant idndex = " + i);
		return ((double) countOne) / countAll;
	}

	/**
	 * ранговый тест
	 * 
	 * @param inData
	 *            - последовательность битов (каждый бит в отдельной €чейке)
	 * @param window
	 *            -размер окна
	 */
	public static double[] rankTest(int[] inData, int window) {
		int length = 1 << window;
		double[] result = new double[length];
		for (int i = 0; i < inData.length - window + 1; i++) {
			int numberLine = 0;
			for (int j = 0; j < window; j++) {
				numberLine += inData[i + j] << (window - j - 1);
			}
			result[numberLine]++;
		}
		double k = inData.length - window;
		for (int i = 0; i < result.length; i++) {
			result[i] = result[i] / k;
		}
		return result;
	}

	/**
	 * определение сложности алгоритмом Ѕерлекэмпа Ч ћэсси
	 * 
	 * @param inData
	 *            - - последовательность битов (каждый бит в отдельной €чейке)
	 * @return
	 */
	public static int complexityTest(int[] inData) {
		int n = inData.length;
		int[] b = new int[n];
		int[] t = new int[n];
		int[] c = new int[n];
		b[0] = 1;
		c[0] = 1;
		int N = 0;
		int L = 0;
		int m = -1;
		while (N < n) {
			int d = inData[N];
			for (int i = 1; i <= L; i++) {
				d = d ^ (c[i] & inData[N - i]);
			}
			if (d != 0) {
				t = Arrays.copyOf(c, c.length);
				for (int i = 0; i <= n - N + m - 1; i++) {
					c[N - m + i] = c[N - m + i] ^ b[i];
				}
				if ((2 * L) <= N) {
					L = N + 1 - L;
					m = N;
					b = Arrays.copyOf(t, t.length);
				}
			}
			N++;
		}
		return L;
	}
}
