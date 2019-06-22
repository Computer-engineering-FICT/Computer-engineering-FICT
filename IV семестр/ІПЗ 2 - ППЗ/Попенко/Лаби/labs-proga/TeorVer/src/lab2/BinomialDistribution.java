package lab2;

import java.math.BigInteger;
import java.util.Random;

/**
 * 
 * @author Ruslan Popenko
 * 
 */
public class BinomialDistribution {

	private long factorial(int n) {
		long ret = 1l;
		for (int i = 1; i <= n; ++i)
			ret +=i;
		return ret;
	}

	private int Cnk(int n, int k) {
		int buf = n - k;
		int BI = (int)  (factorial(n)/(factorial(k)*(factorial(buf))));
		return BI;
	}

	private double Bernoulli(double p, int n, int k) {
		double cnk = (double) Cnk(n, k);
		double p_k = Math.pow(p, (double) k);
		double one = 1.0;
		double oneMp = one - p;
		double nMk = (double) (n - k);
		double power = Math.pow(oneMp, nMk);
		return cnk * p_k * power;
	}

	private Random random = new Random();

	private double randomInRange(double min, double max) {
		double range = max - min;
		double scaled = random.nextDouble() * range;
		double shifted = scaled + min;
		return shifted;
	}

	private int gen(double[] bern2) {
		double rand = randomInRange(0.0, 1.0);
		if (bern2[0] > rand) {
			return 0;
		} else {
			if (bern2[bern2.length - 1] < rand) {
				return bern2.length - 1;
			} else {
				for (int i = 0; i < bern2.length; i++) {
					if (bern2[i] > rand) {
						return i;
					}
				}
			}
		}
		return Integer.MAX_VALUE;

	}

	public double MathematicalExpectation(int[] vector) {
		int s = 0;
		for (int i = 0; i < vector.length; i++) {
			s += vector[i];
		}
		double buf = (double) vector.length;
		return s / buf;
	}

	public double Dispersion(int[] vector) {
		double me = MathematicalExpectation(vector);
		double s = 0.0;
		for (int i = 0; i < vector.length; i++) {
			double buf = (double) vector[i];
			s += (buf - me) * (buf - me);
		}
		double buf = (double) vector.length;
		return s / buf;

	}

	public double StandardDeviation(int[] vector) {
		return Math.pow(Dispersion(vector), 0.5);
	}

	public int Sequence[];

	public BinomialDistribution(double p, int n, int size) {
		Sequence = new int[size];
		double bern1[] = new double[n + 1];
		double bern2[] = new double[n + 1];
		for (int i = 0; i < bern1.length; i++) {
			bern1[i] = Bernoulli(p, n, i);
		}
		bern2[0] = bern1[0];
		

		for (int i = 1; i < bern2.length; i++) {
			bern2[i] = bern2[i - 1] + bern1[i];
		}

		for (int i = 0; i < Sequence.length; i++) {
			Sequence[i] = gen(bern2);
		}

	}

}
