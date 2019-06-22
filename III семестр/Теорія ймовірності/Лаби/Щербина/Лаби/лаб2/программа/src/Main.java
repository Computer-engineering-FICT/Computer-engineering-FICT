public class Main {
	static int countNumber = 5000;// длина последовательности
	static int[] x = new int[countNumber];// генерируемая последовательность
	static int n = 100;// количество проводимых испытаний
	static double p = 0.9;// вероятность успеха в одной испытании
	static double m = n * p;// ожидаемое значение математического ожидания
	static double d = n * p * (1 - p);// ожидаемое значение дисперсии

	/**
	 * математическое ожидание
	 * 
	 * @param x
	 *            - входная последовательность чисел
	 * @return
	 */
	static double mathematicalExpectation(int[] x) {
		double summa = 0;
		for (int i = 0; i < x.length; i++) {
			summa += x[i];
		}
		double result = summa / x.length;
		return result;
	}

	/**
	 * дисперсия
	 * 
	 * @param x
	 *            - входная последовательность чисел
	 * @return
	 */
	static double dispersion(int[] x) {
		double m = mathematicalExpectation(x);
		double summa = 0;
		for (int i = 0; i < x.length; i++) {
			summa += (x[i] - m) * (x[i] - m);
		}
		double result = summa / x.length;
		return result;
	}

	/**
	 * генерирует последоватеность с заданым матемтаческим ожиданием
	 * 
	 * @param n
	 *            - количество успехов
	 * @param N
	 *            - длина последоватльности
	 * @param M
	 *            - математическое ожидание
	 * @return- последовательность чисел
	 */
	static public int[] generationSequence(int n, int N, double M) {
		int[] result = new int[n];
		double p = M / n;
		BinomialDistribution bd = new BinomialDistribution(n, p);
		for (int i = 0; i < result.length; i++) {
			result[i] = bd.nextNumber();
		}
		return result;

	}

	public static void main(String[] args) {
		BinomialDistribution bd = new BinomialDistribution(n, p);
		for (int i = 0; i < x.length; i++) {
			x[i] = bd.nextNumber();
		}
		System.out.println("Входные данные");
		System.out.println("n = " + Integer.toString(n));
		System.out.println("p = " + p);
		System.out.println("Результаты");
		// System.out.println("математическое ожидание");
		System.out.println("m = " + mathematicalExpectation(x));
		// System.out.println("дисперсия");
		System.out.println("d = " + dispersion(x));
		System.out.println("Ожидаемые результаты");
		// System.out.println("ожидаемое значение математического ожидания");
		System.out.println("m = " + m);
		// System.out.println("ожидаемое значение дисперсии");
		System.out.println("d = " + d);

		// System.out.println("выдаваемая последовательность");
		// for (int i = 0; i < x.length; i++) {
		// System.out.println(Integer.toString(x[i]));
		// }

		// int[] count = new int[n + 1];
		// for (int i = 0; i < x.length; i++) {
		// count[x[i]]++;
		// }

		// System.out.println("Количество элементов в последовательности");
		// for (int i = 0; i < count.length; i++) {
		// System.out.println(i+" = "+count[i]);
		// }

		// System.out.println("Характеристики введененой последовательности");
		// int[] myNumber={3,3,3,2,4,5,1,6,0,3};
		// System.out.println("m = " + mathematicalExpectation(myNumber));
		// System.out.println("d = " + dispersion(myNumber));

		// double m2=5;
		// System.out.println("m = "+mathematicalExpectation(generationSequence(n,x.length,m2)));

	}
}
