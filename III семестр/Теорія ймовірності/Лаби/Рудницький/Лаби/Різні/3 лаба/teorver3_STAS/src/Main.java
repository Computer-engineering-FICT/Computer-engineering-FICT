import java.util.Random;

public class Main {
	public static void main(String[] args) {
		double For_X[];
		double For_Y[];
		For_X = vect();
		For_Y = vect();
		double x[] = GetVectX(For_X);
		double y[] = GetVectY(For_Y, x);
		System.out.println("математичне очікування для x=" + Math_Ochik(x));
		System.out.println("математичне очікування для y=" + Math_Ochik(y));
		System.out.println("дисперсія для x=" + Disper(x));
		System.out.println("дисперсія для y=" + Disper(y));
		System.out.println("сігма для x=" + Math.sqrt(Disper(x)));
		System.out.println("сігма для y=" + Math.sqrt(Disper(y)));
		System.out.println("коваріація=" + Cov(x, y));
		System.out.println("коефіцієнт кореляції=" + Cov(x, y)
				/( (Math.sqrt(Disper(x))) * Math.sqrt(Disper(y))));
	}

	public static double[] vect() {
		int length = 1000;
		double[] r = new double[length];
		for (int i = 0; i < length; i++) {
			Random go = new Random();
			r[i] = go.nextDouble();
		}
		return r;
	}

	public static double[] GetVectX(double[] For_X) {
		double[] x = new double[1000];
		for (int i = 0; i < For_X.length; i++) {
			x[i] = Math.sqrt(For_X[i]);
		}
		return x;

	}

	public static double[] GetVectY(double[] For_Y, double[] x) {
		double[] y = new double[1000];
		for (int i = 0; i < For_Y.length; i++) {
			y[i] = x[i] * For_Y[i];
		}
		return y;
	}

	public static double Math_Ochik(double[] temp) {
		double suma = 0;
		for (int i = 0; i < temp.length; i++) {
			suma += temp[i];
		}
		return suma / 1000;
	}

	public static double Disper(double[] temp) {
		double d = 0;
		for (int i = 0; i < 1000; i++) {
			d += Math.pow(temp[i] - Math_Ochik(temp), 2);
		}
		return d/1000;
	}

	public static double Cov(double[] x, double[] y) {
		double cov = 0;
		for (int i = 0; i < 1000; i++) {
			cov += (x[i] - Math_Ochik(x)) * (y[i] - Math_Ochik(y));
		}
		return cov / 1000;
	}
}
