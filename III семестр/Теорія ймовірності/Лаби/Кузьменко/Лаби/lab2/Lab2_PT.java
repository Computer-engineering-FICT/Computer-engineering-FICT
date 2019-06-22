
public class Lab2_PT {

	/**
	 * @param args
	 */
	public static double n = 5000;
	public static void main(String[] args) {
		GeneratorEven g = new GeneratorEven(4, 5, 6, 8, 9, 0.1,0.3, 0.1, 0.4);
		standartDeviation(variance(g.getValues(), expectation(g.getValues())));
		System.out.println();

	}

	public static double expectation (double [] values){
		double m =0;
		for (double d : values) {
			m += d;
		}
		System.out.println("Математичне очікування");
		System.out.println(m/n);
		return m/n;
	}
	public static double variance (double [] values, double m){
		double d = 0;
		for (double v : values) {
			d += Math.pow(v-m, 2);
		}
		System.out.println("Дисперсія");
		System.out.println(d/n);
		return d/n;
	}
	public static void standartDeviation(double d){
		System.out.println("Середнє квадратичне відхилення");
		System.out.println(Math.sqrt(d));
	}
}
