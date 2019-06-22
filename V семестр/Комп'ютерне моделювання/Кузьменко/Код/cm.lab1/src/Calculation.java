import java.util.ArrayList;
import java.util.Arrays;

public class Calculation {
	private double mu;
	private double sigma;
	private double[] laplasF = new double[501];
	private double[] laplasArg = new double[501];

	public double[] masTj = new double[2000];

	public Calculation(double mu, double sigma) {
		this.mu = mu;
		this.sigma = sigma;
		calcLaplasMas();
		calcTj();
		test();

		for (int i = 0; i < laplasArg.length; i++) {
			System.out.println(laplasArg[i] + "|" + laplasF[i]);
		}
	}

	private void calcLaplas() {
		double arg = 0;
		double h = 0.01;

		int i = 0;
		while (arg < 5) {
			laplasArg[i] = arg;
			laplasF[i] = Math.rint(10000.0 * CalcIntegral(0, arg, 500)) / 10000.0;
			arg += h;
			i++;
		}

	}

	private double CalcIntegral(double a, double b, int n) {
		double result, h;
		int i;

		h = (b - a) / n; // Шаг сетки
		result = 0;

		for (i = 1; i <= n; i++) {
			result += InFunction(a + h * i - h / 2); // Вычисляем в средней
														// точке и добавляем в
														// сумму
		}
		result *= h;

		return result;
	}

	private double InFunction(double t) {
		return (1 / Math.sqrt(2 * Math.PI)) * Math.exp(-Math.pow(t, 2) / 2);
	}

	public void calcLaplasMas() {
		calcLaplas();

	}

	private void calcTj() {

		for (int i = 0; i < masTj.length; i++) {
			double argum = Math.random() - 0.5;
			argum = Math.rint(10000.0 * argum) / 10000.0;

			int j;
			for (j = 0; j < laplasF.length - 1; j++) {
				if (Math.abs(argum) < laplasF[j + 1]
						& Math.abs(argum) > laplasF[j]) {
					break;
				}
			}

			// System.out.println(argum+"|"+laplasF[j]);
			double agr;
			if (argum < 0) {
				agr = -laplasArg[j];

			} else {
				agr = laplasArg[j];
			}

			masTj[i] = Math.exp(Math.log(mu) + agr * sigma);
		}
	}

	public void test() {
		Arrays.sort(masTj);
		System.out.println("md " + masTj[masTj.length / 2]);
	}

	public ArrayList<Double> getTj() {
		ArrayList<Double> arlist = new ArrayList<>();
		for (int i = 0; i < masTj.length; i++) {
			arlist.add(masTj[i]);
		}
		return arlist;
	}

}
