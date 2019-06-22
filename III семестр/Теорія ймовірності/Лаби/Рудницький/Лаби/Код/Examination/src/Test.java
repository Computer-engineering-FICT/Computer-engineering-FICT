public class Test {
	public static void main(String[] args) {
		/*
		 * 143.1
		 */
		int n = 10000;
		int count = 0;
		double[] a = new double[n];
		double[] b = new double[n];
		for (int i = 0; i < a.length; i++) {
			a[i] = Math.random();
			a[i] *= 3; 
		}
		for (int i = 0; i < b.length; i++) {
			b[i] = Math.random();
			b[i] *= 4;
		}
		for (int i = 0; i < n; i++) {
			if (a[i]/b[i] >= 2.0) {
				count++;
			}
		}
		double nd = n;
		System.out.println(count/nd);
	}
}
