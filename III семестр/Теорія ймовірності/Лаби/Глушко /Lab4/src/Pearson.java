import java.util.Arrays;


public abstract class Pearson {

	public static final double aN[] = { };
	public static final double kHi2Table[][] = {
		{0.0, 0.001, 0.004, /*...*/},
		{},
		{}
	};
	public static final double g[] = { };

	public double getPearsonProbability(double values[], int intervals) {
		double nValues[] = new double[intervals];
		double borders[];

		Arrays.sort(values);
		borders = buildIntervals(values[0], values[values.length - 1], intervals);
		int distribution[] = countDistribution(values, borders);
		double mathExp = mathExpectation(values);
		double sigma = (values[values.length - 1] - values[0])/aN[values.length];
		double p[] = getProbabilities(borders, mathExp, values[values.length - 1] - values[0]);

		double kHi2 = 0.0;
		for (int i=0; i<intervals; i++) {
			double v = ((double)distribution[i] - values.length*p[i]);
			kHi2 += v*v/(values.length*p[i]);
		}
		int kHi2Ix = kHi2Index(intervals, kHi2);
		return 1.0 - g[kHi2Ix];
	}

	private double[] buildIntervals(double min, double max, int intervals) {
		double borders[] = new double[intervals];
		double step = (max - min)/((double)intervals);
		borders[0] = min;
		for (int i=1; i< intervals; i++) {
			borders[i] = borders[i-1] + step;
		}
		return borders;
	}

	private int[] countDistribution(double values[], double intervals[]) {
		int distribution[] = new int[intervals.length];
		int counterIx = 0, borderIx = 1; 
		for (int i=0; i<values.length; i++) {
			if (borderIx == intervals.length) {
				distribution[counterIx]++;
			}
			else if (values[i] >= intervals[borderIx]) {
				counterIx++;
				borderIx++;
				distribution[counterIx]++;
			}
			else {
				distribution[counterIx]++;
			}
		}
		return distribution;
	}

	private double mathExpectation(double values[]) {
		double total = 0.0;
		for (int i=0; i<values.length; i++) {
			total += values[i];
		}
		return total/((double)values.length);
	}

	private int kHi2Index(int intervals, double value) {
		double kHi2Line[] = kHi2Table[intervals - 2]; // FIXME -n lines dropped
		double distance = Math.abs(value - kHi2Line[0]);
		int index = 0;
		for (int i=1; i < kHi2Line.length; i++) {
			if (Math.abs(value - kHi2Line[i]) < distance) {
				distance = Math.abs(value - kHi2Line[i]);
				index = i;
			}
		}
		return index;
	}

	protected abstract double[] getProbabilities(double borders[], double mathExp, double A);
}
