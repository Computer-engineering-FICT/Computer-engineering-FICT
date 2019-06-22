package kpi.teorver.lab3;


public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		double mxX=5;
		double mxY=7;
		double sdX=6;
		double sdY=4;
		double corellation=0.6;
		double X[] = Normal6Generator.generate(sdX, mxX, 1000);
		double Y[] = CorrelativeExponentialGenerator.generate(X, mxX, mxY, sdX, sdY, corellation);
		System.out.println("Mathematical Expectation = ");
		System.out.println("Dispersion = ");
		System.out.println("Standart Deviation = ");
	}

}
