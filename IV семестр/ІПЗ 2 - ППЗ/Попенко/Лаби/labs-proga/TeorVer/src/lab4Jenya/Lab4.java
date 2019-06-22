package lab4Jenya;

import java.util.Random;

public class Lab4 {
	double lambda0;
	double lambda1;
	double p;
	double c1;
	double c2;
	int lenght;
	int rid1 = 0;
	int rid2 = 0;
	double x;

	Random random = new Random();

	public double rndExp(double lambda) {
		double u;
		while ((u = random.nextDouble()) <= 0.00000001)
			;
		return -1.0 / lambda * Math.log(u);
	}

	public boolean NP(double y) {
		boolean buf = lambda1 / lambda0 * Math.exp(-lambda1 * y + lambda0 * y) < p
				* c1 / (1 - p) / c2;
		return buf;
	}

	public void solve() {
		x = Math.log(p * c1 * lambda0 /( lambda1 *(1 - p) * c2))
				/ (lambda0 - lambda1);

		System.out.println("f0(y) -> y< " + x);
		System.out.println("f1(y) -> y>= " + x);
	}

	Lab4(double lambda0, double lambda1, double p0, double c100, double c200,
			int length) {
		this.lambda0 = lambda0;
		this.lambda1 = lambda1;
		this.p = p0;
		this.c1 = c100;
		this.c2 = c200;
		this.lenght = length;
		double[] vector = new double[length * 2];
		for (int i = 0; i < length; i++) {
			vector[i] = rndExp(lambda0);
			vector[i + length] = rndExp(lambda1);
		}
		solve();

		for (int i = 0; i < length; i++) {
			if (NP(vector[i]) != true) {
				rid2++;
			}
		}
		for (int i = length; i < length * 2; i++) {
			if (NP(vector[i]) != false) {
				rid1++;
			}
		}

	}

	public static void main(String[] args) {
		Lab4 ENNP = new Lab4(0.5, 1.5, 0.45, 5.0, 4.0, 500);
		double len = (double) ENNP.lenght;
		System.out.println("…мов≥рн≥сть помилки першого роду = " + ENNP.rid1
				/ len);
		System.out.println("…мов≥рн≥сть помилки другого роду  = " + ENNP.rid2
				/ len);

	}
}
