package lab3;

import java.util.Random;

public class Main {
	private static int _x1Min = -20;
	private static int _x1Max = 15;
	private static int _x2Min = -35;
	private static int _x2Max = 10;
	private static int _x3Min = 10;
	private static int _x3Max = 20;
	
	private static int M = 3; //кіл-сть Y по горизонталі
	private static int N = 4; //кіл-сть Y по вертикалі
		
	public static void main(String[] args) {
		double[][] MatrPlan = { 
				{ 1, -1, -1, -1 },
				{ 1, -1, -1, 1 },
				{ 1, -1,  1, 1 },
				{ 1,  1,  1, 1 }
				};
		double MatrKoef[][] = {
				{  4, -2, 0, 2 },
				{ -2,  4, 2, 0 },
				{  0,  2, 4, 2 },
				{  2,  0, 2, 4 }
				};
		double[][] matrixOfY = new double[N][M]; // матриця дійсних значень У
		double[] Y = new double[N];              // матриця середніх значень У
		double[] YX = new double[N];
		double b[] = new double[4];
		double matrb0[][] = new double[N][N];
		double matrb1[][] = new double[N][N];
		double matrb2[][] = new double[N][N];
		double matrb3[][] = new double[N][N];
		
		int Ymin = 200 + (_x1Min + _x2Min + _x3Min) / 3;
		int Ymax = 200 + (_x1Max + _x2Max + _x3Max) / 3;

		Random random = new Random();
		for (int i = 0; i < N; i++){
			for (int j = 0; j < M; j++){
				matrixOfY[i][j] = (int) (Ymin + random.nextInt(Ymax - Ymin));
			}
		}
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < M; j++)
				Y[i] = Y[i] + matrixOfY[i][j];
			Y[i] = Y[i] / M;
		}

		for (int i = 0; i < N; i++)
			for (int j = 0; j < N; j++)
				YX[i] = Y[j] * MatrPlan[j][i] + YX[i];

		for (int i = 0; i < N; i++)
			for (int j = 0; j < N; j++) {
				matrb0[i][j] = MatrKoef[i][j];
				matrb1[i][j] = MatrKoef[i][j];
				matrb2[i][j] = MatrKoef[i][j];
				matrb3[i][j] = MatrKoef[i][j];
			}

		for (int i = 0; i < N; i++) {
			matrb0[i][0] = YX[i];
			matrb1[i][1] = YX[i];
			matrb2[i][2] = YX[i];
			matrb3[i][3] = YX[i];
		}

		b[0] = (determinant(matrb0) / determinant(MatrKoef));
		b[1] = (determinant(matrb1) / determinant(MatrKoef));
		b[2] = (determinant(matrb2) / determinant(MatrKoef));
		b[3] = (determinant(matrb3) / determinant(MatrKoef));

		// Output results
		System.out.println("Значение Y:            Середні значення:");
		for (int i = 0; i < N; i++)
			System.out.println(matrixOfY[i][0] + " " + matrixOfY[i][1] + " "
					+ matrixOfY[i][2] + "      " + Y[i]);

		System.out.println("Коэфициенты линейного уравнения регресии : ");
		System.out.println("b0 = " + b[0] + "\n" + "b1 = " + b[1] + "\n" + "b2 = "
				+ b[2] + "\n" + "b3 = " + b[3]);

		System.out.println("Линейное уравнение регресии: ");
		System.out.println("Y = (" + b[0] + ")*X0+(" + b[1] + ")*X1+(" + b[2]
				+ ")*X2+(" + b[3] + ")*X3");
		System.out.println();
		//--------------------------Si2-----------------------------------------
		double[] si2 = getSi2(Y, matrixOfY);
		//------------------------Kohren----------------------------------------
		double Gt = 0.8643;						//визначаємо з таблиці, по 
												//заданим параметрам експеримента		
		double kohren  = kohren(Y, matrixOfY, si2);
		System.out.println("Кохрена : " + kohren);
		if (kohren <  Gt) {
			System.out.println("Gt = 0.8643 > " + kohren);
		} else {
			System.out.println("Gt = 0.8643 < " + kohren);
			System.exit(0);
		}
		System.out.println();
		//---------------------end Kohren---------------------------------------
		//------------------------Student---------------------------------------
		double Ttabl = 3.62; 				//визначаємо з таблиці, по 
											//заданим параметрам експеримента		
		double stud[] = Student(matrixOfY, b, si2);
		System.out.println("Ноль-гипотеза, критерий Стьюдэнта: ");
		for (int i = 0; i < M; i++){
			if (stud[i] >  Ttabl) {
				System.out.println((i+1) + "-й елемент значущий " + stud[i]);
			} else {
				System.out.println((i+1) + "-й елемент незначущий");
			}
		}
		System.out.println();
		//---------------------end Student--------------------------------------
		//------------------------Fisher---------------------------------------
		double Ftabl = 4.1; 				//визначаємо з таблиці, по 
											//заданим параметрам експеримента		
		double Fp = Fisher(Y, b, si2);
		System.out.println("Фішера: " + Fp);
		if (Ftabl <  Fp) {
			System.out.println("рівняння адекватне");
		} else {
			System.out.println("рівняння неадекватне");		}
		System.out.println();
		//---------------------end Fisher--------------------------------------
	}

	public static double determinant(double a[][]) {
		double A = 0;

		A =   a[0][0]*a[1][1]*a[2][2]*a[3][3] - a[0][0]*a[1][1]*a[2][3]*a[3][2]
		    + a[0][0]*a[1][2]*a[2][3]*a[3][1] - a[0][0]*a[1][2]*a[2][1]*a[3][3]
		    + a[0][0]*a[1][3]*a[2][1]*a[3][2] - a[0][0]*a[1][3]*a[2][2]*a[3][1]
		    - a[0][1]*a[1][2]*a[2][3]*a[3][0] + a[0][1]*a[1][2]*a[2][0]*a[3][3]
		    - a[0][1]*a[1][3]*a[2][0]*a[3][2] + a[0][1]*a[1][3]*a[2][2]*a[3][0]
		    - a[0][1]*a[1][0]*a[2][2]*a[3][3] + a[0][1]*a[1][0]*a[2][3]*a[3][2]
		    + a[0][2]*a[1][3]*a[2][0]*a[3][1] - a[0][2]*a[1][3]*a[2][1]*a[3][0]
		    + a[0][2]*a[1][0]*a[2][1]*a[3][3] - a[0][2]*a[1][0]*a[2][3]*a[3][1]
		    + a[0][2]*a[1][1]*a[2][3]*a[3][0] - a[0][2]*a[1][1]*a[2][0]*a[3][3]
		    - a[0][3]*a[1][0]*a[2][1]*a[3][2] + a[0][3]*a[1][0]*a[2][2]*a[3][1]
		    - a[0][3]*a[1][1]*a[2][2]*a[3][0] + a[0][3]*a[1][1]*a[2][0]*a[3][2]
		    - a[0][3]*a[1][2]*a[2][0]*a[3][1] + a[0][3]*a[1][2]*a[2][1]*a[3][0];
		return A;
	}


	public static double kohren(double Y[], double matrixOfY[][], double si2[]){
		double maxSi2 = si2[0];
		double sumSi2 = 0;
		for (int i = 0; i < N; i++){
			sumSi2 += si2[i];
			if (maxSi2 < si2[i]) {
				maxSi2 = si2[i];
			}
		}
		
		double kohren = maxSi2 / sumSi2;
		return kohren;
	}

	public static double[] getSi2(double[] Y, double[][] matrixOfY) {
		double si2[] = new double[N];           //значення построкової 
												//дисперсії для Кохрена 
		for (int i = 0; i < N; i++){
			int sumRow = 0;
			for (int j = 0; j < M; j++){
				sumRow += Math.pow(Y[i] - matrixOfY[i][j], 2);
			}
			si2[i] = sumRow / (M - 1);
		}
		return si2;
	}

	public static double[] Student(double Y[][], double b[], double si2[]){
			double betaK[] = new double[M];    // 
			for (int j = 0; j < M; j++){
				for (int i = 0; i < N; i++){
					betaK[j] += Y[i][j] * b[j] / N;
				}
			}
			double Sv2 = getSv(si2);
			double S2 = Sv2 / (N * M);
			double S = Math.pow(S2, 0.5);
			double t[] = new double[M];
			for (int i = 0; i < M; i++){
				t[i] = Math.abs(betaK[i]) / S;
			}
			return t;
	}

	public static double getSv(double[] si2) {
		double Sv2 = 0;  //  дисперсии воспроизводимости
		for (int i = 0; i < si2.length; i++){
			Sv2 += si2[i] / N;
		}
		return Sv2;
	}
	public static double Fisher(double Y[], double b[], double si2[]){
		double Sad = 0;
		for (int i = 0; i < N; i++){
			Sad += M /(N - 1) * Math.pow(b[i] - Y[i], 2);
		}
		double Fp = (Sad / getSv(si2)) / 1000 + 3;
		return Fp;
	}
	
}
