package lab4;

import java.util.Random;

public class Lab4 {
	double lambda;
	double m;
	double sigma;
	double p;
	double c1;
	double c2;
	int lenght;
	int rid1 = 0;
	int rid2 = 0;
	double x1;
	double x2;

	Random random = new Random();

	public double rndExp(double lambda) {
		double u;
		while ((u = random.nextDouble()) <= 0.00000001)
			;
		return -1.0 / lambda * Math.log(u);
	}

	public double rndNorm(double m, double sigma) {
		double u = random.nextGaussian();
		return m + sigma * u;
	}

	public boolean NP(double y) {
		boolean buf = Math.exp(-(y - m) * (y - m) / (2.0 * sigma * sigma))
				/ (Math.sqrt(2.0 * Math.PI) * sigma * lambda * Math.exp(-lambda
						* y)) < p * c1 / (1 - p) / c2;
		return buf;
	}

	public void solve() {
		double a = -1.0;
		double b = 2 * m + 2 * sigma * sigma * lambda;
		double c = -m
				* m
				- Math.log(p * c1 * Math.sqrt(2 * Math.PI) * sigma * lambda
						/ (1 - p) / c2) * 2 * sigma * sigma;
		double d = b * b - 4 * a * c;
		double x1 = (-b - Math.sqrt(d)) / 2 / a;
		double x2 = (-b + Math.sqrt(d)) / 2 / a;

		if (x1 == x2) {
			System.out.println("f1(y) -> y=(-inf; " + x1 + ")U(" + x1
					+ "; +inf)");
			System.out.println("f0(y) -> y=" + x1);
		} else {
			if (x1 > x2) {
				double buf = x2;
				x2 = x1;
				x1 = buf;
			}
			this.x1 = x1;
			this.x2 = x2;
			System.out.println("f0(y) -> y=(-inf; " + x1 + ")U(" + x2
					+ "; +inf)");
			System.out.println("f1(y) -> y=[" + x1 + "; " + x2 + "]");
		}

	}

	Lab4(double lambda0, double m1, double sigma1, double p0, double c100,
			double c200, int length) {
		this.lambda = lambda0;
		this.m = m1;
		this.sigma = sigma1;
		this.p = p0;
		this.c1 = c100;
		this.c2 = c200;
		this.lenght = length;
		double[] vector = new double[length * 2];
		for (int i = 0; i < length; i++) {
			vector[i] = rndExp(lambda0);
			vector[i + length] = rndNorm(m1, sigma1);
		}
		solve();

		for (int i = 0; i < length; i++) {
			if (NP(vector[i]) != true) {
				rid1++;
			}
		}
		for (int i = length; i < length * 2; i++) {
			if (NP(vector[i]) != false) {
				rid2++;
			}
		}

	}

	public static void main(String[] args) {
		Lab4 ENNP = new Lab4(5, 0.0, 10.0, 0.3, 4.0, 4.0, 500);
		double len = (double) ENNP.lenght;
		System.out.println("…мов≥рн≥сть помилки першого роду = " + ENNP.rid1
				/ len);
		System.out.println("…мов≥рн≥сть помилки другого роду  = " + ENNP.rid2
				/ len);

	}
}
