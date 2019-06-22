package lab2;


public class Main {
	static int countNumber = 5000;
	static int[] x = new int[countNumber];
	static int n = 77;
	static double p = 0.3;
	static double m = n * p;
	static double d = n * p * (1 - p);

	
	static double mathematicalExpectation(int[] x) {
		double summa = 0;
		for (int i = 0; i < x.length; i++) {
			summa += x[i];
		}
		double result = summa / x.length;
		return result;
	}

	
	static double dispersion(int[] x) {
		double m = mathematicalExpectation(x);
		double summa = 0;
		for (int i = 0; i < x.length; i++) {
			summa += (x[i] - m) * (x[i] - m);
		}
		double result = summa / x.length;
		return result;
	}

	public static void main(String[] args) {
		BinomialDistr bd = new BinomialDistr(n, p);
		for (int i = 0; i < x.length; i++) {
			x[i] = bd.nextNumber();
		}
		System.out.println("Âõ³äí³ äàí³");
		System.out.println("n = "+Integer.toString(n));
		System.out.println("p = "+p);
		System.out.println("Ðåçóëüòàòè");
		System.out.println("m = " + mathematicalExpectation(x));
		System.out.println("d = " + dispersion(x));
		double sigma=Math.pow(dispersion(x),0.5);
		System.out.println("sigma= " +sigma);
		
	}
}

