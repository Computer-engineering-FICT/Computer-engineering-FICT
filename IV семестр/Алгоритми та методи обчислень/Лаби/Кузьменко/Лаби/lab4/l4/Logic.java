package l4;

public class Logic {
	private static double a;				// ліва межа відрізка, на якому знаходиться корінь
	private static double b;			 	// права межа відрізка, на якому знаходиться корінь
	public static double e;					// точність обчислення кореня
	public static double x;
	public static double k;
	public double[][] horda = new double[20][20];
	public double[][] dotuchna = new double[20][20];
	
	
	
	public Logic(double a , double b, double e) {
		this.setA(a);
		this.setB(b);
		this.e = e;
	}
	
	/**
	 * Функція f(x)=x^3-2x+7
	 * @param x абсциса
	 * @return	ордината
	 */
	public double func(double x) {
		return x * x - 4;
	}

	
	/**
	 * Перша похідна функції f(x)
	 * @param x абсциса
	 * @return	ордината
	 */
	public double d_func(double x) {
		return 2 * x;
	}
	
	
	/**
	 * Друга похідна функції f(x)
	 * @param x абсциса
	 * @return	ордината
	 */
	public double d2_func(double x) {
		return 2;
	}
	
	
	public void find_x() {
		k = 0;
		
		int i = 0;
		
		while (Math.abs(getB() - getA()) >= e) {
			horda[0][i] = getA();			// xa
			horda[0][i+1] = func(getA());	// ya	
			horda[1][i] = getB();			// xb
			horda[1][i+1] = func(getB());	// yb

			if (d_func((getA() + getB()) / 2) * d2_func((getA() + getB()) / 2) <= 0) {
				double z = getA();
				setA(getB());
				setB(z);
			}
			
			setA(getA() - (func(getA()) * (getB() - getA())) / (func(getB()) - func(getA())));
			
			dotuchna[0][i] = getB();			// xa
			dotuchna[0][i+1] = func(getB());	// ya
			
			setB(getB() - func(getB()) / d_func(getB()));
			
			dotuchna[1][i] = getB();			// xb
			dotuchna[1][i+1] = 0;		// yb
			
			k++;
			i++;
			i++;
		}
		
		x = (getA() + getB()) / 2;
	}


	public double getK() {
		return k;
	}

	public double getX() {
		return x;
	}

	public static double getA() {
		return a;
	}

	public static void setA(double a) {
		Logic.a = a;
	}

	public static double getB() {
		return b;
	}

	public static void setB(double b) {
		Logic.b = b;
	}
	
}
