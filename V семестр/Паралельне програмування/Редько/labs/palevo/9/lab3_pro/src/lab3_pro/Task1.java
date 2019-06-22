package lab3_pro;

import java.util.Arrays;
/**
 * Laboratory work #3
 * Skorik D.V. IO-91
 * Variant:
 * F1: 1.10:  b = MIN(C)
 * F2: 2.23: q = MAX(MA + MB - MC * MX)
 * F3: 3.16: d = MAX(MA*A - (MB * ME) * C)
 */
public class Task1 extends Thread {

	@Override
	public void run() {
		System.out.println("Start Task1.");
		int[] A = new int[Modul.N];
		Arrays.fill(A, 1);
		int max = Modul.F1(A);
		if (Modul.N <= 8){
			System.out.println(max);
		}
		try {
			sleep(1000);
			} catch (InterruptedException e) {
			  e.printStackTrace();
		}
		System.out.println("End Task1.");
	}
}
