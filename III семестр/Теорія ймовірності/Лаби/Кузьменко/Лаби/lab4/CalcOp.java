
import java.util.Arrays;

public class CalcOp {
	private int masLength;
	private double[] laplas;
	private double[] xlaplas;
	public double mas[] = new double[masLength];
	public double m;
	public double sigma;
	double la;

	public CalcOp(int nSelection, double lambda) {
		masLength = nSelection;
		mas = new double[masLength];
		ExpDistribution e = new ExpDistribution(lambda);
		for (int i = 0; i < nSelection; i++) {
			mas[i] = e.getX();
		}
		la = lambda;
		m = MathExpectCalc();
		sigma = SigmaCalc();
		
		Arrays.sort(mas);
		LaplasCalc();
		
		for (int i = 0; i < laplas.length; i++) {
			System.out.println(xlaplas[i]+" | "+laplas[i]);
		}
	}

	private double MathExpectCalc() {
		
		return m =16/la;
	}

	public double SigmaCalc () {
		double Di = 1/Math.pow(la, 2);
		return Math.sqrt(16*Di);
	}

	private void LaplasCalc() {
		double[] laplas = new double[500];
		double[] xlaplas = new double[500];
		double y = 0;
		for (int i = 0; i < 500; i++) {
			laplas[i] = calcRect(y / 100);
			xlaplas[i] = y / 100;
			y++;
		}
		this.laplas = laplas;
		this.xlaplas = xlaplas;

	}

	private double calcRect(double b) {
		double a = 0;
		double x = 0, h = 0, sum = 0, integ = 0;
		int n = 1000;
		h = (b - a) / n;
		sum = 0;
		for (int i = 1; i < n; i++) {
			x = a + i * h;
			sum = sum + F(x);
		}
		integ = h * ((F(a) + F(b)) / 2 + sum);
		return integ;
	}

	private double F(double x) {
		return Math.exp(-Math.pow(x, 2) / 2) / Math.sqrt(2 * Math.PI);
	}

	public double mySearch(double key) {

		int i = 0;
		while (xlaplas[i] <= Math.abs(key)) {
			i++;
		}
		;
		if (key < 0)
			return -laplas[i];
		else
			return laplas[i];
	}

	public void setMas(double masiv[]) {
		mas = masiv;
		m = MathExpectCalc();
		sigma = SigmaCalc();
		Arrays.sort(mas);
	}
}
