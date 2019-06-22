import java.util.ArrayDeque;
import java.util.Arrays;

public class Lab4 {
	private static double[] k;
	private static CalcOp o;
	private static double p[];
	private static double mi[];

	public static void main(String[] args) {
		o= new CalcOp(1000, 0.5);
		calck(29);
		setp();
		calcHiqv();
		
	}

	public static void calck(int t) {
		int shag = t;
		int j = 0;
		int n = 0;
		for (j = 0; j < o.mas.length; j += shag) {
			n++;
		}
		p = new double[n];
		k = new double[n - 1];
		int l = shag;
		for (int i = 0; i < k.length; i++) {
			k[i] = o.mas[l] / 2 - o.mas[l - 1] / 2 + o.mas[l - 1];
			l += shag;
		}

		mi = new double[p.length];
		Arrays.fill(mi, t);
		mi[mi.length - 1] = o.mas.length - (j - shag);
	}

	public static void setp() {
		double x2 = 0;
		double F1 = -0.5;
		double F2;
		for (int i = 0; i < k.length; i++) {
			x2 = ((k[i] - o.m) / o.sigma);
			
			F2 = o.mySearch(x2);
			p[i] = F2 - F1;
			F1 = F2;
		}
		double t = 0;
		for (int i = 0; i < p.length; i++) {
			t += p[i];
		}
		
		p[p.length - 1] = 1 - t;
	}

	public static void calcHiqv() {
		double hisqr = 0;
		for (int i = 0; i < p.length; i++) {
			hisqr += (Math.pow((mi[i] - (o.mas.length * p[i])), 2))
					/ (o.mas.length * p[i]);
			
		}
		System.out.println(hisqr);
	}

}
