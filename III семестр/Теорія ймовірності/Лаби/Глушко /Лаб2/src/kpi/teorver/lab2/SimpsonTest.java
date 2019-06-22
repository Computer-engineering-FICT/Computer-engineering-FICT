package kpi.teorver.lab2;

public class SimpsonTest {

	private static final int COUNT = 5000;
	private static final int SPREAD_INTERVALS = 15;
	private static final double MEDIAN = 0.0;
	private static final double LENGTH = 1.0;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		SimpsonReGenerator generator = new SimpsonReGenerator(MEDIAN, LENGTH);
		double result[] = generator.generate(COUNT);
		double expectation = expectation(result, MEDIAN, LENGTH);
		System.out.print("Expectation is: ");
		System.out.println(expectation);
		System.out.print("Dispersion is: ");
		double dispersion = dispersion(result, expectation, LENGTH);
		System.out.println(dispersion);
		System.out.print("Standard deviation is: ");
		System.out.println(Math.sqrt(dispersion));
		System.out.println("Resulting spread: ");
		int expected_spread[] = new int[SPREAD_INTERVALS];
		int spread[] = spread(result, MEDIAN, LENGTH, expected_spread);
		for (int i=0; i<spread.length; i++) {
			System.out.format("%d\n", spread[i]);
		}
	}

	public static double expectation(double [] array, double m, double a) {
		int intervals = array.length / 20;
		int counters[] = new int[intervals];
		for (int i=0; i < intervals; i++)
			counters[i] = 0;
		int ix;
		double dint = (double)intervals;
		for (int i=0; i<array.length; i++) {
			ix = (int)Math.round(Math.floor((((array[i]+a-m)/(2.0*a))*dint)));
			counters[ix]++;
		}
		double expectation = 0.0;
		double interval_length = 2.0*a/((double)intervals);
		for (int i=0; i<intervals; i++) {
			double probability = ((double)counters[i])/((double)array.length);
			double invalue = m - a + ((double)i)*interval_length + interval_length/2.0;
			expectation += invalue*probability;
		}
		return expectation;
	}

	public static double dispersion(double [] array, double m, double a) {
		int intervals = array.length / 20;
		int counters[] = new int[intervals];
		for (int i=0; i < intervals; i++)
			counters[i] = 0;
		int ix;
		double dint = (double)intervals;
		for (int i=0; i<array.length; i++) {
			ix = (int)Math.round(Math.floor(Math.abs((((array[i]+a-m)/(2.0*a))*dint))));
			counters[ix]++;
		}
		double dispersion = 0.0;
		double interval_length = 2.0*a/((double)intervals);
		for (int i=0; i<intervals; i++) {
			double probability = ((double)counters[i])/((double)array.length);
			double invalue = m - a + ((double)i)*interval_length + interval_length/2.0;
			dispersion += (invalue - m) * (invalue - m) * probability;
		}
		return dispersion;
	}

	public static int [] spread(double array[], double m, double a, int expected[]) {
		int counters[] = new int[expected.length];
		for (int i=0; i < expected.length; i++) {
			counters[i] = 0;
			/*
			if (i*2 <= expected.length)
				expected[i] = 2*array.length*(2*i+1)/(expected.length*expected.length);
			else
				expected[i] = expected[expected.length - i - 1];
			*/
		}
		int ix;
		double dint = (double)expected.length;
		for (int i=0; i<array.length; i++) {
			ix = (int)Math.round(Math.floor(Math.abs((((array[i]+a-m)/(2.0*a))*dint))));
			counters[ix]++;
		}
		return counters;
	}

}
