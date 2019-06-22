package l5;

public class Test {
	
	
	public static void main(String[] args) {
		double[][] A = { { 2,  0, -1, -2},
						 { 0,  1,  2, -1},
						 { 1, -1,  0, -1},
						 {-1,  3,  2,  0} };
		
		double[] B = { -8,
					   -1,
					   -6,
					    7 };
		
		Logic l = new Logic(A, B);
		
		System.out.println("Верхня трикутна матриця коефіцієнтів системи:");
		show_mass(l.A);
		System.out.println("\nСтовпець вільних членів :");		
		for (int j = 0; j < B.length; j++) {
			System.out.println(l.B[j] + "; ");
		}		
		System.out.println("\nКорені СЛАР:");		
		for (int j = 0; j < B.length; j++) {
			System.out.println(Math.rint(l.X[j]) + "; ");
		}
		
	}
	
	public static void show_mass(double[][] array) {
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array[i].length; j++) {
				System.out.print(Math.rint(array[i][j] * 100000) / 100000 + "; ");
			}
			System.out.print("\n");
		}
	}

}
