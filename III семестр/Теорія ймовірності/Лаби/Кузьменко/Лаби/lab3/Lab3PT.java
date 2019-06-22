import java.util.Random;

public class Lab3PT {
	/**
	 * довжина вибірки
	 */
	private static int number = 1000;
	private static double[] ymas = new double[number];
	private static double[] xmas = new double[number];
	/**
	 * вбудований генератор рандомних чисел з рівномірним розподілом
	 */
	private static Random random = new Random();

	public static void main(String[] args) {
		getxy();
		System.out.printf("Мат.очікування X = " + "%2.6f", mean(xmas));
		System.out.printf("\nМат.очікування Y = " + "%2.6f", mean(ymas));
		System.out.printf("\nДисперсія по X = " + "%2.6f",
				Duspr(xmas, mean(xmas)));
		System.out.printf("\nДИсперсія по Y = " + "%2.6f",
				Duspr(ymas, mean(ymas)));
		System.out.println("\nСередні квадратичні відхилення: ");
		System.out
				.printf("По Х " + "%2.6f", Math.sqrt(Duspr(xmas, mean(xmas))));
		System.out.printf("\nПо Y " + "%2.6f",
				Math.sqrt(Duspr(ymas, mean(ymas))));
		System.out.printf("\nКоваріація = " + "%2.6f",
				cov(mean(xmas), mean(ymas)));
		System.out.printf(
				"\nКоефіцієнт кореляції = " + "%2.5f",
				correlation(cov(mean(xmas), mean(ymas)),
						Math.sqrt(Duspr(xmas, mean(xmas))),
						Math.sqrt(Duspr(ymas, mean(ymas)))));
	}

	/**
	 * Обчислення конкретного Yi Знаходимо через тригонометричну формулу Вієта
	 * для кубічного рівняння
	 * 
	 * @param r
	 *            рандомне число
	 * @return Yi
	 */
	private static double viet(double r) {
		return -2 * Math.cos(Math.acos(r) / 3 - 2 * Math.PI / 3);
	}

	/**
	 * Обчислення експериментального мат.очікування
	 * 
	 * @param xmas
	 *            згенерованих числе
	 * @return значення експериментального мат.очікування.
	 */
	public static double mean(double[] xmas) {
		double s = 0;
		for (double d : xmas) {
			s += d;
		}
		return s / number;
	}

	/**
	 * Знаходження конкретного Xi інтеграл від функції часткового розподілу
	 * 
	 * @param yi
	 *            значення конкретного Yi
	 * @param ri
	 *            рандомне число
	 * @return Xi
	 */
	private static double getx(double yi, double ri) {
		double y2 = Math.pow(yi, 2);

		return Math.sqrt(ri * (1 - y2) + y2);
	}

	/**
	 * генератор для X, Y
	 */
	public static void getxy() {
		for (int i = 0; i < number; i++)
			ymas[i] = viet(random.nextDouble());

		for (int i = 0; i < ymas.length; i++) {
			xmas[i] = getx(ymas[i], random.nextDouble());
		}
	}

	/**
	 * обчислення дисперсії
	 * 
	 * @param xmas
	 *            масив згенерованих чисел
	 * @param m
	 *            мат. очікування
	 * @return значення дисперсії
	 */
	public static double Duspr(double[] xmas, double m) {
		double s = 0;
		for (double d : xmas) {
			s += Math.pow(d - m, 2);
		}
		return s / xmas.length;
	}

	/**
	 * Обчислення коефіцієнта кореліції
	 * 
	 * @param cov
	 *            коваріація
	 * @param sigmax
	 *            середнє квадратичне відхилення X
	 * @param sigmay
	 *            середнє квадратичне відхилення Y
	 * @return значення коефіцієнта кореліції
	 */
	private static double correlation(double cov, double sigmax, double sigmay) {
		return cov / sigmax / sigmay;
	}

	/**
	 * Обчислення коваріації
	 * 
	 * @param mx
	 *            мат.очікування по X
	 * @param my
	 *            мато.чікування по Y
	 * @return значення коваріації
	 */
	private static double cov(double mx, double my) {
		double s = 0;
		for (int i = 0; i < number; i++) {
			s += (xmas[i] - mx) * (ymas[i] - my);
		}
		return s / number;
	}
}
