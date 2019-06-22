package Laba2;

import java.util.Random;

public class BinomGenerator {

	public static int nextNumber(int n, double p) {
		Random random = new Random();
		int R = 0;
		for (int i = 0; i < n; ++i) {
			if (random.nextDouble() < p) {
				R += 1;
			}
		}
		return R;
	}

	public static int[] numberArray(int size, int n, double p) {
		int[] ary = new int[size];
		for (int i = 0; i < size; ++i) {
			ary[i] = nextNumber(n, p);
		}
		return ary;

	}

}
