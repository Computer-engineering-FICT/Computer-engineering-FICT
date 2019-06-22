public class Tester {
	public double expectation(double[] array) {
		double temp = 0;
		for(int i = 0; i < array.length; i++) {
			temp = temp + array[i];
		}
		temp = temp/array.length;
		return temp;
	}
	
	public double dispersion(double[] array, double expectation) {
		double temp = 0;
		for(int i = 0; i < array.length; i++) {
			temp = Math.pow((array[i] - expectation), 2);
		}
		temp = temp/array.length;
		return temp;
	}
}
