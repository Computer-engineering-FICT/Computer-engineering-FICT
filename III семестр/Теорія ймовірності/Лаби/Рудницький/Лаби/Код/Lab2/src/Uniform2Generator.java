public class Uniform2Generator {
	private double a;
	private double b;
	private double c;
	private double h1;
	private double h2;
	private double s1;
	private double s2;
	private double s;
	
	public Uniform2Generator(double a, double b, double c, double h) throws IllegalArgumentException {
		super();
		if (b < a) {
			throw new IllegalArgumentException("b < a");
		}
		if (c < b) {
			throw new IllegalArgumentException("c < b");
		}		
		if (c < a) {
			throw new IllegalArgumentException("c < a");
		}		
		setA(a);
		setB(b);
		setC(c);
		setH1(1/(b - a + c*h - b*h));
		setH2(h*getH1());
		setS1((b - a)*getH1());
		setS2((c - b)*getH2());
		setS(getS1() + getS2());
	}

	public double getA() {
		return a;
	}

	public void setA(double a) throws IllegalArgumentException {
		if (a < 0) {
			throw new IllegalArgumentException("a < 0");
		} else {
			this.a = a;
		}
	}

	public double getB() {
		return b;
	}

	public void setB(double b) throws IllegalArgumentException {
		if (b < 0) {
			throw new IllegalArgumentException("b < 0");
		} else {
			this.b = b;
		}
	}

	public double getC() {
		return c;
	}

	public void setC(double c) throws IllegalArgumentException {
		if (c < 0) {
			throw new IllegalArgumentException("c < 0");
		} else {
			this.c = c;
		}
	}

	public double getH1() {
		return h1;
	}

	public void setH1(double h1) throws IllegalArgumentException {
		if (h1 < 0) {
			throw new IllegalArgumentException("h1 < 0");
		} else {
			this.h1 = h1;
		}
	}

	public double getH2() {
		return h2;
	}

	public void setH2(double h2) throws IllegalArgumentException {
		if (h2 < 0) {
			throw new IllegalArgumentException("h2 < 0");
		} else {
			this.h2 = h2;
		}
	}	
	
	public double getS1() {
		return s1;
	}

	public void setS1(double s1) throws IllegalArgumentException {
		if (s1 < 0) {
			throw new IllegalArgumentException("s1 < 0");
		} else {
			this.s1 = s1;
		}
	}

	public double getS2() {
		return s2;
	}

	public void setS2(double s2) throws IllegalArgumentException {
		if (s2 < 0) {
			throw new IllegalArgumentException("s2 < 0");
		} else {
			this.s2 = s2;
		}
	}

	public double getS() {
		return s;
	}

	public void setS(double s) throws IllegalArgumentException {
		if (s != 1) {
			throw new IllegalArgumentException("s != 1");
		} else {
			this.s = s;
		}
	}

	public double[] generate(int count) {
		double[] array = new double[count];
		for (int i = 0; i < count; i++) {
			double r = Math.random();
			if (r > getS1()) {
				array[i] = b + ((r - getS1())/getH2());
			} else {
				array[i] = a + (r/getH1());
			}
		}
		return array;
	}
}
