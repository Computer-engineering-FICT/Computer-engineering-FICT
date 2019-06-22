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
public class Task3 implements Runnable {

	@Override
	public void run() {
		System.out.println("Start Task3.");
		int[] A = new int[Modul.N];
		int[] C = new int[Modul.N];
		int[][] MA = new int[Modul.N][Modul.N];
		int[][] MB = new int[Modul.N][Modul.N];
		int[][] ME = new int[Modul.N][Modul.N];
		Arrays.fill(A, 1);
		Arrays.fill(C, 1);
		Modul.fill_Matrix(MA, 1);
		Modul.fill_Matrix(MB, 1);
		Modul.fill_Matrix(ME, 1);
		int[] buf = Modul.F3PART(A, C, MA, MB, ME);
		int d = Modul.F3(buf);
		if (Modul.N <= 8) {
			System.out.println(d);
		}
		try {
			Thread.sleep(1000);
			} catch (InterruptedException e) {
			  e.printStackTrace();
		}
		System.out.println("End Task3.");
	}
}
