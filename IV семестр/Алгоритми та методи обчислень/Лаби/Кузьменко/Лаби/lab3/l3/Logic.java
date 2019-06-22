package l3;

/**
 * Логіка побудови графіків заданої функції і полінома Ньютона степені не вище t-1
 * @author Aruy
 */
public class Logic {
	private final int t = 6;	// к-ть точок
	public double a;			// ліва межа відрізка, на якому будуємо функцію
	public double b;			// права межа відрізка, на якому будуємо функцію
	public double[] xi;			// абсциси вузлів
	private double h;			// крок між абсцисами точок
	public int k; 				// степінь інтерполяції многочлена(1..10)
	public double[][] yk;		// починаючи з 1 рядка, масив кінцевих різниць; 0 рядок - ординати вузлів
	
	
	/**
	 * @param a абсциса лівої межі функції
	 * @param b абсциса правої межі функції
	 * @param k степінь інтерполяції многочлена(1..10)
	 */
	public Logic(double a, double b, int k) {	
		this.a = a;
		this.b = b;
		this.h = (b - a) / (t - 1);
		this.k = k;
		this.xi = new double[t];		
		this.yk = new double[t][t];
		solve_xi_yi(a);
		solve_yk();
	}
	
	
	/**
	 * Розрахунок ординат і абсцис t рівновіддалених вузлів
	 * @param a абсциса лівої межі функції
	 */
	public void solve_xi_yi(double a) {
		for (int i = 0; i < t; i++) {
			xi[i] = a + h * i;
			yk[0][i] = func(xi[i]);
		}
	}
	

	/**
	 * Розрахунок кінцевих різниць
	 */
	public void solve_yk() {
		for (int i = 1; i < t ; i++) {
			for (int j = 0; j < t - i; j++) {
				yk[i][j] = (yk[i-1][j+1] - yk[i-1][j]);
			}
		}
	}
	

	/**
	 * Розрахунок ординати для заданої 
	 * абсциси через поліном Ньютона k-го степеня
	 * @param x абсциса
	 * @return	ордината
	 */
	public double polinom(double x) {
		double p;
		double q = (x - search_x(x)) / h;
		double N = func(search_x(x));
		
		for (int i = 0; i < k; i++) {	// 1 .. k
			p = 1;
			
			for (int j = 0; j < i + 1; j++) {
				p *= (q - j);
			}
			
			N += p * yk[i + 1][search_i(x)] / factorial(i + 1);	
			
		}
		
		return N;	
	}
	
	
	/**
	 * Розрахунок ординати для заданої 
	 * абсциси через основну функцію 
	 * @param x абсциса
	 * @return	ордината
	 */
	public double func(double x) {
		return 1 / (0.5 + Math.pow(x, 2));
	}
	
	
	/**
	 * Розрахунок похибки полінома в заданій точці
	 * @param x абсциса точки
	 * @return похибка
	 */
	public double mistake(double x) {
		return Math.abs(func(x) - polinom(x));
	}
	
	
	/**
	 * Факторіал
	 * @param n значення
	 * @return результат
	 */ 
	public static int factorial(int n) {
		 if (n == 0) 
			 return 1;
		 
	     return n * factorial(n-1);
	}
	
	
	/**
	 * Пошук значення абсциси найближчого вузла зліва для абсциси точки x
	 * @param x 
	 * @return значення абсциси знайденого вузла
	 */ 
	public double search_x(double x) {		 
		 double k = 0;
		 
		 for (int i = xi.length - 2; i > -1; i--) {
			 if (x >= xi[i]) {
				 k = xi[i];
				 break;
			 }	
		 }
		 
		 return k;
	}
	 
	
	/**
	 * Пошук індекса абсциси найближчого вузла зліва для абсциси точки x
	 * @param x 
	 * @return значення абсциси знайденого вузла
	 */
	public int search_i(double x) {		 
		 int k = 0;
		 
		 for (int i = xi.length - 2; i > -1; i--) {
			 if (x >= xi[i]) {
				 k = i;
				 break;
			 }	
		 }
		 
		 return k;
	}
	 
}