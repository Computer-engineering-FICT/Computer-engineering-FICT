public class Main {
	
	public static void main(String[] args) {
		int n = 1000;
		double count = n;
		double c1 = 1;
		double c2 = 1;
		double p = 0.2;
		double m = 5;
		double a = 2;
		double sigma = 4;
		double[] NP = {0, 0};
		double size = 1000;
		int count1 = 0;
		int count2 = 0;
		double x = 0;
		double iteration = 0.01;
		double right = (p*c1)/((1 - p)*c2);
		double left = 0;
		double left_next = 0;
		for (int i = 0; i < size; i++) {
			left = -((Math.exp((1/2)*(((-x + m)*(- x + m))/(sigma*sigma)))*Math.sqrt(2*Math.PI)*sigma*(-a + Math.abs(-x + m)))/(a*a));
			left_next = -((Math.exp((1/2)*(((-x + iteration + m)*(- x + iteration + m))/(sigma*sigma)))*Math.sqrt(2*Math.PI)*sigma*(-a + Math.abs(-x + iteration + m)))/(a*a));
			if ((left > right) && (left_next <= right)) {
				NP[0] = x;
			}			
			if ((left <= right) && (left_next > right)) {
				NP[1] = x;
			}	
			/*if (left <= right) {
				count1++;
			}
			if (left > right) {
				count2++;
			}*/
			x = x + iteration;
		}
		NormalGenerator ng = new NormalGenerator(m, sigma);
		double[] na = ng.generate(n);
		SimpsonGenerator sg = new SimpsonGenerator(m, a);
		double[] sa = sg.generate(n);
		for (int i = 0; i < na.length; i++) {
			if ((na[i] < NP[0]) || (na[i] > NP[1])) {
				count1++;
			}
		}
		for (int i = 0; i < sa.length; i++) {
			if ((sa[i] >= NP[0]) && (sa[i] <= NP[1])) {
				count2++;
			}
		}
		System.out.println(NP[0]);
		System.out.println(NP[1]);
		System.out.println("1 type error = " + count1/count);
		System.out.println("2 type error = " + count2/count);
	}
}
