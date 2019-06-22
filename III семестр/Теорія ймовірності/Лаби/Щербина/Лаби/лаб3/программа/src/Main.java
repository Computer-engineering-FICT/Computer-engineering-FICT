import java.util.Random;
import java.lang.Math;

interface Func {
	double f(double x, double y);
}

class X implements Func {

	@Override
	public double f(double x, double y) {
		return Main.w(x, y);
	}
}

class Y implements Func {

	@Override
	public double f(double x, double y) {
		return Main.z(x);
	}
}

public class Main {
	static final double h = 3 / Math.PI;
	static int n = 1000;// ������� ��������
	static double[] x;// �������� �������� �
	static double[] y;// �������� �������� Y
	static double Mx;// ����������� ���������� �������� �
	static double My;// ����������� ���������� �������� Y
	static double Dx;// �������� �������� �
	static double Dy;// �������� �������� Y
	static double Zx;// ������ ����������� ��������� �������� �
	static double Zy;// ������ ����������� ��������� �������� Y
	static double cov;// ���������
	static double R;// ����������

	static Random random = new Random();

	static double f(double x, double y) {
		return h * (1 - Math.sqrt(x * x + y * y));
	}

	/**
	 * ������� ���������� �������� �
	 */
	static double z(double y) {
		return h
				* (Math.sqrt(1 - y * y) - y * y
						* Math.log(((1 + Math.sqrt(1 - y * y)) / Math.abs(y))));
	}

	/**
	 * ������� �������� �������� �
	 */
	static double w(double x, double y) {
		return f(x, y) / z(y);
	}

	/**
	 * @param s
	 * @param res
	 * @return
	 */
	static double solution(double[][] s, double res) {
		double result = 1;
		for (int i = 0; i < s[0].length; i++)
			if (s[0][i] > res) {
				result = s[1][i];
				break;
			}
		return result;
	}

	/**
	 * ��������� ��������� �� ������� [a;b]s
	 * 
	 * @param f
	 *            - �������
	 * @param y
	 *            - �������� ������� ��������� �������
	 * @param n
	 *            - ������� ����� ��������
	 * @param a
	 *            - ��� ���� ������
	 * @param b
	 *            - ����� ���� ������
	 * @return
	 */
	static double[][] integrate(Func f, double y, int n, double a, double b) {
		double[][] result = new double[2][n + 1];
		double step = (b - a) / n;
		double step2 = step / 2;
		double x = a;
		result[0][0] = 0;
		result[1][0] = a;
		for (int i = 1; i < result[0].length; i++) {
			if (x != 0) {
				result[0][i] = result[0][i - 1] + f.f(x + step2, y) * step;
				result[1][i] = x + step2;
			} else {
				result[0][i] = result[0][i - 1];
				result[1][i] = 0;
			}
			x = x + step;
		}
		return result;
	}

	/**
	 * ����������� ����������
	 * 
	 * @param x
	 *            - ����������� �����
	 * @return
	 */
	static double mathematicalExpectation(double[] x) {
		double summa = 0;
		for (int i = 0; i < x.length; i++) {
			summa += x[i];
		}
		double result = summa / x.length;
		return result;
	}

	/**
	 * ��������
	 * 
	 * @param x
	 *            - ����������� �����
	 * @return
	 */
	static double dispersion(double[] x) {
		double m = mathematicalExpectation(x);
		double summa = 0;
		for (int i = 0; i < x.length; i++) {
			summa += (x[i] - m) * (x[i] - m);
		}
		double result = summa / x.length;
		return result;
	}

	/**
	 * ���������
	 */
	static double covariance(double[] x, double[] y) {
		double result = 0;
		double mx = mathematicalExpectation(x);
		double my = mathematicalExpectation(y);
		for (int i = 0; i < y.length; i++) {
			result += (x[i] - mx) * (y[i] - my);
		}
		result = result / y.length;
		return result;

	}

	/**
	 * ���������� ����
	 */
	static int randomSign() {
		int sing = random.nextInt(2);
		if (sing == 0)
			sing = -1;
		return sing;

	}

	public static void main(String[] args) {
		x = new double[n];
		y = new double[n];
		Y yF = new Y();
		X xF = new X();
		int countPoint = 100;
		double[][] sX;
		double[][] sY = integrate(yF, 0, countPoint, -1, 1);

		for (int i = 0; i < n; i++) {
			double yi = random.nextDouble();
			y[i] = solution(sY, yi);
			sX = integrate(xF, y[i], countPoint, -Math.sqrt(1 - y[i] * y[i]), Math.sqrt(1 - y[i] * y[i]));
			double xi = random.nextDouble();
			x[i] =  solution(sX, xi);
		}
		Mx = mathematicalExpectation(x);
		My = mathematicalExpectation(y);
		Dx = dispersion(x);
		Dy = dispersion(y);
		Zx = Math.sqrt(Dx);
		Zy = Math.sqrt(Dy);
		cov = covariance(x, y);
		R = cov / Zx / Zy;

		System.out.println("����������:");
		System.out.println("����������� ���������� x = " + Mx);
		System.out.println("����������� ���������� y = " + My);
		System.out.println("������ ����������� ��������� x = " + Zx);
		System.out.println("������ ����������� ��������� y= " + Zy);
		System.out.println("��������� = " + cov);
		System.out.println("��������� = " + R);
//		System.out.println(Dx);

//		 System.out.print("X: ");
//		 for (int i = 0; i < x.length; i++) {
//		 System.out.print(x[i] + " ");
//		 }
//		 System.out.println();
//		 System.out.print("Y: ");
//		 for (int i = 0; i < y.length; i++) {
//		 System.out.print(y[i] + " ");
//		 }

	}
}
