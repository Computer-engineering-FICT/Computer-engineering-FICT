public class Main {
	public static void main(String[] args) {
		int count = 5000;
		double a = 0;
		double b = 0.2;
		double c = 1;
		
		/**
		 * h = h2/h1
		 */
		double h = 0.5; 		
		Uniform2Generator r2g = new Uniform2Generator(a, b, c, h); 
		double[] result = r2g.generate(count);
		for (int i = 0; i < result.length; i++) {
			System.out.println("R" + i + " " + result[i]);
		}
		Tester tester = new Tester();
		double m = tester.expectation(result);
		System.out.println("Math expectation = " + m);
		double d = tester.dispersion(result, m);
		System.out.println("Dispersion = " + d);
		System.out.println("Standard deviation = " + Math.sqrt(d));
	}
}
