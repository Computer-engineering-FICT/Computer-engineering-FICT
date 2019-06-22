package lab2;

import java.util.Random;

public class Main {

	private static double kMax = 2.16;
	private static int x1Min = -30;
	private static int x1Max = 20;
	private static int x2Min = -20;
	private static int x2Max = 40;
	private static int x3Min = 15;
	private static int x3Max = 25;


	private static Random random = new Random();
	private static int x[][] = new int[3][3];   //масив факторів
	private static double y1 = 0, y2 = 0, y3 = 0;

	public static void main(String[] args) {
		// заповнення Yi
		int Ymin = 200 + (x1Min + x2Min + x3Min) / 3;
		int Ymax = 200 + (x1Max + x2Max + x3Max) / 3;
		int[][] y = new int[4][8];
		for (int i = 0; i < y.length; i++) {
			for (int j = 0; j < y[0].length; j++) {
				y[i][j] = Ymin + random.nextInt(Ymax - Ymin);
				System.out.print(y[i][j] + "   ");
			}
			System.out.println();
		}
		// критерій Романовського
		double[][] k = new double[4][8];
		for (int j = 0; j < y.length; j++) {
			for (int i = 0; i < y[0].length; i++) {
				k[j][i] = Math.abs(middle(y[0], i) - y[0][i]) / midDif(y[0], i);
			}
		}
		double[][] sum = new double[3][3];
		for (int i = 0; i < k.length; i++) {
			for (int j = 0; j < k[0].length; j++) {
				if (k[i][j] < kMax) {
					//System.out.println(y[i][j]);
					sum[i][0] += y[i][j];
					sum[i][1]++;
				}
			}
		}
		y1 = sum[0][0] / sum[0][1];
		y2 = sum[1][0] / sum[1][1];
		y3 = sum[2][0] / sum[2][1];
		double my = (y1 + y2 + y3) / 2;

		setX(2, 0, x1Min, x1Max);
		setX(2, 1, x2Min, x2Max);
		setX(2, 2, x3Min, x3Max);

		double mx1 = getMX(0);
		double mx2 = getMX(1);
		double mx3 = getMX(2);
		double a1 = mulX(1, 1);
		double a2 = mulX(1, 2);
		double a3 = mulX(2, 2);
		double a11 = mulXY(0);
		double a22 = mulXY(1);
		
		double[][] q1 = {
						{ my, mx1, mx2},
						{a11,  a1,  a2},
						{a22,  a2,  a3}
						};
		double[][] dil = {
						{  1, mx1, mx2},
						{mx1,  a1,  a2},
						{mx2,  a2,  a3}
						};
		double b0 = vyzn(q1) / vyzn(dil);
		
		double[][] q2 = {
						{  1,  my, mx2},
						{mx1, a11,  a2},
						{mx2, a22,  a3}
						};
		double b1 = vyzn(q2) / vyzn(dil);

		double[][] q3 = {
				{  1, mx1,  my},
				{mx1,  a1, a11},
				{mx2,  a2, a22}
				};
		double b2 = vyzn(q3) / vyzn(dil);
		System.out.println();
		System.out.println("b0: " + b0 + "||| b1: " + b1 + "||| b2: " + b2);
		double B0 = b0 - b1*(x[0][0] + x[1][0]) / (Math.abs(x[0][0] - x[1][0])) - 
						 b2*(x[0][1] + x[1][1]) / (Math.abs(x[0][1] - x[1][1]));
		double B1 = 2 * b1 / (Math.abs(x[0][0] - x[1][0]));
		double B2 = 2 * b2 / (Math.abs(x[0][1] - x[1][1]));
		System.out.println();
		System.out.println("y = " + B0 + " + " + B1 + "x1 + " + B2 + "x2");
		
	}

	//множення Х на Х
	private static double mulX(int mas1index, int mas2Index) {
		int sum = 0;
		for (int i = 0; i < x.length; i++) {
			if (mas1index == 1 && mas2Index == 1) {
				sum += x[0][i] * x[0][i];
			}
			if (mas1index == 2 && mas2Index == 2) {
				sum += x[1][i] * x[1][i];
			}
			if ((mas1index == 1 && mas2Index == 2)
					| (mas1index == 2 && mas2Index == 1)) {
				sum += x[1][i] * x[0][i];
			}
		}
		return sum / x[0].length;
	}

	//множення Х на У
	private static double mulXY(int masindex) {
		int sum = 0;
		for (int i = 0; i < x.length; i++) {
			if (i == 0) {
				sum += x[i][masindex] * y1;
			}
			if (i == 1) {
				sum += x[i][masindex] * y2;
			}
		}
		return sum / x[0].length;
	}

	//встановлюємо X
	private static void setX(int k, int index, int min, int max) {
		for (int j = 0; j < k; j++) {
			x[index][j] = min + random.nextInt(max - min);
		}
	}

	//мат очік
	private static double getMX(int index) {
		int sum = 0;
		for (int i = 0; i < x.length; i++) {
			sum += x[i][index];
		}
		return sum / x.length;
	}

	//квадратичне, окрім index
	private static double midDif(int[] is, int index) {
		double mid = middle(is, index);
		double sum = 0;
		for (int i = 0; i < is.length; i++) {
			if (i != index) {
				sum += Math.pow(is[i] - mid, 2);
			}
		}
		return Math.pow(sum / (float) (is.length - 1), 0.5);
	}

	//сер, окрім indexOf
	private static double middle(int[] is, int indexOf) {
		double sum = 0;
		for (int i = 0; i < is.length; i++) {
			if (i != indexOf) {
				sum += is[i];
			}
		}
		return sum / (is.length - 1);
	}

	//визначник
	private static double vyzn(double[][] a) {
		return a[0][0] * a[1][1] * a[2][2] + a[0][1] * a[1][2] * a[2][0]
				+ a[1][0] * a[2][1] * a[1][2] - a[2][0] * a[0][1] * a[0][2]
				- a[2][1] * a[1][2] * a[0][0] - a[2][1] * a[1][2] * a[0][0];
	}

}
