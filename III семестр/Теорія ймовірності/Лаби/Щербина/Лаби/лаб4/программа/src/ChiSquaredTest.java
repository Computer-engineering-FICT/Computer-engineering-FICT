import java.util.Arrays;

public class ChiSquaredTest {
	static final double maxValue=10E10;
	public static double[] p = { 1,0.99, 0.98, 0.95, 0.90, 0.80, 0.70, 0.50,
			0.30, 0.20, 0.10, 0.05, 0.02, 0.01, 0.001,0 };
	public static double[][] valueChi = {
			// k=1
//			{ 0,0, 0.001, 0.004, 0.016, 0.064, 0.148, 0.455, 1.074, 1.642, 2.71,
//					3.84, 5.41, 6.64, 10.83,maxValue },
		// k=3
		{ 0,0, 0.115, 0.185, 0.352, 0.584, 1.005, 2.37, 3.66, 4.64, 6.25,
				7.82, 9.84, 11.34, 16.27,maxValue },
			// k=27
			{ 0,12.88, 14.12, 16.15, 18.11, 20.7, 22.7, 26.3, 30.3, 32.9, 36.7,
					40.1, 44.1, 47.0, 55.5,maxValue } };

	/**
	 * @param n
	 *            - обьем выборки
	 * @param m
	 *            - количество интервалов
	 * @param listValue
	 *            - список значений
	 * @param b
	 *            - биноминальный законраспределения
	 * @return
	 */
	static double chiSquaredValue(int n, int m, int[] listValue,
			BinomialDistribution b) {
		Arrays.sort(listValue);
		double[] segments = new double[m];
		double[] listP = new double[m];
		double step = (double) ((b.maxValue - b.minValue)) / m;
		for (int i = 0; i <segments.length; i++) {
			segments[i]=(i+1)*step;
		}
//		segments[0]=39.1;
//		segments[1]=41.1;
//		segments[2]=b.maxValue;
		
		listP[0] = b.getProbability(segments[0]);
		for (int i = 1; i < listP.length; i++) {
			listP[i] = b.getProbability(segments[i])
					- b.getProbability(segments[i - 1]);
		}
		int[] listCountValue = new int[m];
		int j = 0;
		for (int i = 0; i < listValue.length; i++) {
			if (listValue[i] <= segments[j]) {
				listCountValue[j]++;
			} else {
				j++;
				listCountValue[j]++;
			}
		}

		double result = 0;

		for (int i = 0; i < listP.length; i++) {
			double z = n * listP[i];
			if (z > 0.5)
				result += Math.pow(listCountValue[i]-z, 2) / z;
		}
		return result;
	}

	static double valueProbability(double chiSquared, int m) {
		int r = 2;
		int k = m - r - 1;

		int j = -1;
		if (k == 0)
			j = 0;
		if (k == 27)
			j = 1;
		double a = maxValue;
		double b = maxValue;
		double p1 = 0;
		double p2 = 0;
		for (int i = 0; i < valueChi[j].length; i++)
			if (chiSquared < valueChi[j][i]) {
				a = valueChi[j][i - 1];
				b = valueChi[j][i];
				p1 = p[i - 1];
				p2 = p[i];
				break;
			}
		double result = p1 - ((a - chiSquared) / (a - b)) * (p1 - p2);

		return result;
	}

}
