package random;

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
		// if ((inData[0] != 0) || (inData[0] != 1))
		// throw new IllegalArgumentException();
		for (int i = 0; i < inData.length - 1; i++)
			// if ((inData[i + 1] == 0) || (inData[i + 1] == 1)) {
			if ((inData[i] ^ inData[i + 1]) == 1)
				countOne++;

		// }
		// else
		// throw new IllegalArgumentException();
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
}
