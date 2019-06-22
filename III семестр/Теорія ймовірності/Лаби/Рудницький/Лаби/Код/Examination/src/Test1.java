
public class Test1 {
	public static void main(String[] args) {
		/*
		 * 76.1
		 */
		int n = 1000;
		int count = 0;
		NormalGenerator ng = new NormalGenerator(0, 4);
		double[] array = ng.generate(n);
		for (int i = 0; i < n; i++) {
			if (array[i] > 1) {
				count++;
			}
		}
		double nd = n;
		System.out.println(count/nd);
	}
}
