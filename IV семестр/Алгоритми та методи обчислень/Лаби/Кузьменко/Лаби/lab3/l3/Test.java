package l3;

public class Test {
	public static void main(String[] args) {
		double a = 0;
		double b = 2;
		int k = 3;
		
		Logic l = new Logic(a, b, k);	
		Plot p = new Plot(l);
	}

}










/*
public static void show_mass(double[][] array) {
	System.out.println (" ,fkf,fkfrwf");
	for (int i = 0; i < array.length; i++) {
		for (int j = 0; j < array[i].length; j++) {
			System.out.print(Math.rint(array[i][j] * 100000) / 100000 + "; ");
		}
		System.out.print("\n");
	}
}
*/