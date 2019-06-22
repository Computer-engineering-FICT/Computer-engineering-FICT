package kpi.teorver.lab3;

public class CorrelativeExponentialGenerator {

	public static double[] generate(double X[], double mxX, double mxY, double sdX, double sdY, double correlation) {
		double Y[] = new double[X.length];
		double sdXY = sdY*Math.sqrt(1.0 - correlation*correlation);
		double D = sdXY*sdXY;
		double mxXY;
		for (int i=0; i<X.length; i++) {
			mxXY = mxY + correlation*sdY*(X[i] - mxX)/sdX;
			Y[i] = -mxXY*D*D*Math.log(Math.random());
		}
		return Y;
	}
}
