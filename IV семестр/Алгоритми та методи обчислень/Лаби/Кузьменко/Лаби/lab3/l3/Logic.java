package l3;

/**
 * ����� �������� ������� ������ ������� � ������� ������� ������ �� ���� t-1
 * @author Aruy
 */
public class Logic {
	private final int t = 6;	// �-�� �����
	public double a;			// ��� ���� ������, �� ����� ������ �������
	public double b;			// ����� ���� ������, �� ����� ������ �������
	public double[] xi;			// ������� �����
	private double h;			// ���� �� ��������� �����
	public int k; 				// ������ ������������ ����������(1..10)
	public double[][] yk;		// ��������� � 1 �����, ����� ������� ������; 0 ����� - �������� �����
	
	
	/**
	 * @param a ������� ��� ��� �������
	 * @param b ������� ����� ��� �������
	 * @param k ������ ������������ ����������(1..10)
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
	 * ���������� ������� � ������ t ������������� �����
	 * @param a ������� ��� ��� �������
	 */
	public void solve_xi_yi(double a) {
		for (int i = 0; i < t; i++) {
			xi[i] = a + h * i;
			yk[0][i] = func(xi[i]);
		}
	}
	

	/**
	 * ���������� ������� ������
	 */
	public void solve_yk() {
		for (int i = 1; i < t ; i++) {
			for (int j = 0; j < t - i; j++) {
				yk[i][j] = (yk[i-1][j+1] - yk[i-1][j]);
			}
		}
	}
	

	/**
	 * ���������� �������� ��� ������ 
	 * ������� ����� ������ ������� k-�� �������
	 * @param x �������
	 * @return	��������
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
	 * ���������� �������� ��� ������ 
	 * ������� ����� ������� ������� 
	 * @param x �������
	 * @return	��������
	 */
	public double func(double x) {
		return 1 / (0.5 + Math.pow(x, 2));
	}
	
	
	/**
	 * ���������� ������� ������� � ������ �����
	 * @param x ������� �����
	 * @return �������
	 */
	public double mistake(double x) {
		return Math.abs(func(x) - polinom(x));
	}
	
	
	/**
	 * ��������
	 * @param n ��������
	 * @return ���������
	 */ 
	public static int factorial(int n) {
		 if (n == 0) 
			 return 1;
		 
	     return n * factorial(n-1);
	}
	
	
	/**
	 * ����� �������� ������� ����������� ����� ���� ��� ������� ����� x
	 * @param x 
	 * @return �������� ������� ���������� �����
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
	 * ����� ������� ������� ����������� ����� ���� ��� ������� ����� x
	 * @param x 
	 * @return �������� ������� ���������� �����
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