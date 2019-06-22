package kpi.teorver.lab3;

/**
 * Normal(6) generator generate random numbers for according to the law Ri = s*Yi - m, 
 * where <code>s</code> and <code>m</code> is specified. Yi = sqrt(2) * (summ(0, 5, (rj)) - 3).
 * rj is generated with standard random generator. 
 * @author Nightingale
 *
 */
public class Normal6Generator {
	private static final double _sqrt2 = Math.sqrt(2);
	
	public static double[] generate(double stdDeviation, double mathExpectation, int elementsNumber){
		double numbers[] = new double[elementsNumber];
		for (int i = 0; i<elementsNumber; i++){
			double Y = 0.0;
			for (int h = 0; h<=5; h++){
				Y += Math.random();
			}
			Y = _sqrt2 * (Y - 3);
			double R = stdDeviation*Y + mathExpectation;
			numbers[i] = R;
		}
		return numbers;
	}
}
