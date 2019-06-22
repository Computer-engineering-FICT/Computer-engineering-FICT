package Laba2;

public class Labatest {
	public static void main(String[] args) {
		int[] ary = BinomGenerator.numberArray(5000, 100, 0.57);
		for (int i = 0; i < ary.length; ++i) {
			System.out.print(" " + ary[i]);
			if (i % 50 == 0 && i != 0) {
				System.out.println();
			}

		}
		System.out.println();

		System.out.println("Матиматичне очікуваня ="
				+ Parametrs.Expectation(ary));
		System.out.println("ДИсперсія =" + Parametrs.Dispersion(ary));
		

	}
}