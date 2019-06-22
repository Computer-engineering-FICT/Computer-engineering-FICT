public class NormalGenerator {
	private double m;
	private double sigma;
	
	public NormalGenerator(double m, double sigma) {
		super();
		this.m = m;
		this.sigma = sigma;
	}
	
	public double[] generate(int count) {
		double[] normals = new double[count];	
		for (int i = 0; i < normals.length; i++){
			normals[i] = getY()*sigma + m;
		}
		return normals;
	}
	
	private double getY() {
		/*double S = 0;
		double next = 0;
		for (int i = 0; i < 12; i++) {
			next = Math.random();
			S += next;
		}
		return S - 6;*/
		double[] r = new double[2];
		for (int i = 0; i < r.length; i++) {
			r[i] = Math.random();
		}
		return Math.sqrt(-2*Math.log(r[0]))*Math.sin(2*Math.PI*Math.pow(r[1], 1));
	}
}
