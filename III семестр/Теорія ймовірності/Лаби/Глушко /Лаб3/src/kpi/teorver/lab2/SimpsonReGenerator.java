package kpi.teorver.lab2;

public class SimpsonReGenerator {



	private double _m;
	private double _a;

	public SimpsonReGenerator(double m, double a) {
		_m = m;
		_a = a;
	}
	
	public double[] generate(int count) {
		double r;
		double simpsons[] = new double[count];
		for (int i=0; i < count; i++) {
			r = Math.random();
			if (r < 0.5) {
				simpsons[i] = _m - _a + _a * Math.sqrt(2.0*r);
			}
			else {
				simpsons[i] = _m + _a - _a * Math.sqrt(2.0*(1-r));
			}
		}
		return simpsons;
	}

}
