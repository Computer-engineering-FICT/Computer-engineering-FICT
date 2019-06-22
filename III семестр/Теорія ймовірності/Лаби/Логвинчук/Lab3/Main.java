package Lab3;

import java.util.Random;

public class Main {
	static final int length = 1000;
	
	static double getY() {
		Random rnd = new Random();
		double S = rnd.nextDouble();
		double deltaY = 0.00001;
		double Y = deltaY;
		while (S > 0) {
			S -= 1.5*(1-Math.pow(Y, 2.))*2*deltaY;
			Y += 2*deltaY;
		}
		return Y;
	}
	static double getK(double Y) {
		double K = 2/(1 - Math.pow(Y,2.));
		return K;
	}
	
	static double getX(double Y) {
		Random rnd = new Random();
		double S = rnd.nextDouble();
		double X = 0;
		double K = getK(Y);
		X = Math.sqrt(2*S/K+Y*Y);
		return X;
	}
	
	static double[][] getPairs(int length) {
		double[][] array = new double[2][length];
		for (int i = 0; i < length; i++) {
			array[0][i] = getY();
			//array[0][i] = 0.9;
			array[1][i] = getX(array[0][i]);
		}
		return array;
	}
	
	static double mathExpectationY(double[][] array) {
		double sum = 0;
		for (int i = 0; i < length; i++) {
			sum += array[0][i];
		}
		return sum/length;
	}
	
	static double mathExpectationX(double[][] array) {
		double sum = 0;
		for (int i = 0; i < length; i++) {
			sum += array[1][i];
		}
		return sum/length;
	}
	
	static double dispersionX(double Mx, double[][] array) {
		double sum = 0;
		for (int i = 0; i < length; i++) {
			sum += Math.pow(array[1][i] - Mx, 2);
		}
		return sum/length;
	}
	
	static double dispersionY(double My, double[][] array) {
		double sum = 0;
		for (int i = 0; i < length; i++) {
			sum += Math.pow(array[0][i] - My, 2);
		}
		return sum/length;
	}
	
	static double covariation(double[][] array, double Mx, double My) {
		double sum = 0;
		for (int i = 0; i < length; i++) {
			sum += (array[0][i] - My)*(array[1][i]-My);
		}
		return sum/length;
	}
	
	public static void main(String[] args) {
		double[][] array = getPairs(length);
		
		double My = mathExpectationY(array);
		double Mx = mathExpectationX(array);
		double Dx = dispersionX(Mx, array);
		double Dy = dispersionY(My, array);
		double Cov = covariation(array, Mx, My);
		System.out.println("Mx = " + Mx);
		System.out.println("My = " + My);
		System.out.println("Dx = " + Dx);
		System.out.println("Dy = " + Dy);
		System.out.println("sigmaX = " + Math.sqrt(Dx));
		System.out.println("sigmaY = " + Math.sqrt(Dy));
		System.out.println("Cov = " + Cov);
		System.out.println("Corelation = " + Cov/(Math.sqrt(Dx) * Math.sqrt(Dy)));
	
	}
}
