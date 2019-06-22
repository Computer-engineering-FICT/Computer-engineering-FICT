import java.util.Random;

public class Lab3PT {
	/**
	 * ������� ������
	 */
	private static int number = 1000;
	private static double[] ymas = new double[number];
	private static double[] xmas = new double[number];
	/**
	 * ���������� ��������� ��������� ����� � ��������� ���������
	 */
	private static Random random = new Random();

	public static void main(String[] args) {
		getxy();
		System.out.printf("���.���������� X = " + "%2.6f", mean(xmas));
		System.out.printf("\n���.���������� Y = " + "%2.6f", mean(ymas));
		System.out.printf("\n�������� �� X = " + "%2.6f",
				Duspr(xmas, mean(xmas)));
		System.out.printf("\n�������� �� Y = " + "%2.6f",
				Duspr(ymas, mean(ymas)));
		System.out.println("\n������ ���������� ���������: ");
		System.out
				.printf("�� � " + "%2.6f", Math.sqrt(Duspr(xmas, mean(xmas))));
		System.out.printf("\n�� Y " + "%2.6f",
				Math.sqrt(Duspr(ymas, mean(ymas))));
		System.out.printf("\n��������� = " + "%2.6f",
				cov(mean(xmas), mean(ymas)));
		System.out.printf(
				"\n���������� ��������� = " + "%2.5f",
				correlation(cov(mean(xmas), mean(ymas)),
						Math.sqrt(Duspr(xmas, mean(xmas))),
						Math.sqrt(Duspr(ymas, mean(ymas)))));
	}

	/**
	 * ���������� ����������� Yi ��������� ����� ��������������� ������� ³���
	 * ��� �������� �������
	 * 
	 * @param r
	 *            �������� �����
	 * @return Yi
	 */
	private static double viet(double r) {
		return -2 * Math.cos(Math.acos(r) / 3 - 2 * Math.PI / 3);
	}

	/**
	 * ���������� ������������������ ���.����������
	 * 
	 * @param xmas
	 *            ������������ �����
	 * @return �������� ������������������ ���.����������.
	 */
	public static double mean(double[] xmas) {
		double s = 0;
		for (double d : xmas) {
			s += d;
		}
		return s / number;
	}

	/**
	 * ����������� ����������� Xi �������� �� ������� ���������� ��������
	 * 
	 * @param yi
	 *            �������� ����������� Yi
	 * @param ri
	 *            �������� �����
	 * @return Xi
	 */
	private static double getx(double yi, double ri) {
		double y2 = Math.pow(yi, 2);

		return Math.sqrt(ri * (1 - y2) + y2);
	}

	/**
	 * ��������� ��� X, Y
	 */
	public static void getxy() {
		for (int i = 0; i < number; i++)
			ymas[i] = viet(random.nextDouble());

		for (int i = 0; i < ymas.length; i++) {
			xmas[i] = getx(ymas[i], random.nextDouble());
		}
	}

	/**
	 * ���������� �������
	 * 
	 * @param xmas
	 *            ����� ������������ �����
	 * @param m
	 *            ���. ����������
	 * @return �������� �������
	 */
	public static double Duspr(double[] xmas, double m) {
		double s = 0;
		for (double d : xmas) {
			s += Math.pow(d - m, 2);
		}
		return s / xmas.length;
	}

	/**
	 * ���������� ����������� ��������
	 * 
	 * @param cov
	 *            ���������
	 * @param sigmax
	 *            ������ ����������� ��������� X
	 * @param sigmay
	 *            ������ ����������� ��������� Y
	 * @return �������� ����������� ��������
	 */
	private static double correlation(double cov, double sigmax, double sigmay) {
		return cov / sigmax / sigmay;
	}

	/**
	 * ���������� ���������
	 * 
	 * @param mx
	 *            ���.���������� �� X
	 * @param my
	 *            ����.��������� �� Y
	 * @return �������� ���������
	 */
	private static double cov(double mx, double my) {
		double s = 0;
		for (int i = 0; i < number; i++) {
			s += (xmas[i] - mx) * (ymas[i] - my);
		}
		return s / number;
	}
}
