public class SimpsonGenerator {
	private double m;
	private double a;

	public SimpsonGenerator(double m, double a) {
		super();
		this.m = m;
		this.a = a;
	}
	
	/*public double[] generate(int count) {
		double r;
		double simpsons[] = new double[count];
		for (int i = 0; i < count; i++) {
			r = Math.random();
			if (r < 0.5) {
				simpsons[i] = m - a + a*Math.sqrt(2*r);
			}
			else {
				simpsons[i] = m + a - a*Math.sqrt(2*(1 - r));
			}
		}
		return simpsons;
	}*/

	public double[] generate(int count) {
		double r = 0;
		double[] simpsons = new double [count];
		for (int i = 0; i < count; i++) {
			r = Math.random();
			if (r > 0.5) {
				simpsons[i] = (m + a - Math.sqrt(2*(1 - r)));
	   		} else {
	   			simpsons[i] = (m - a + Math.sqrt(2*r));
	   		}
		}
	  	return simpsons;
	}
}
