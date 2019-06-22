
public class Pearson4SimpsonDistribution extends Pearson {

	@Override
	protected double[] getProbabilities(double[] borders, double mathExp, double A) {
		double probabilities[] = new double[borders.length];
		int half = borders.length / 2;
		double v = 2.0/((double)borders.length);
		for (int i=0; i<half; i++) {
			probabilities[i] = 0.5 * (2*i + 1) * (v*v);
			probabilities[probabilities.length - 1 - i] = probabilities[i];
		}
		if (borders.length % 2 == 1) {
			probabilities[half] = v*v*(half + 0.5);
		}
		return probabilities;
	}

}
