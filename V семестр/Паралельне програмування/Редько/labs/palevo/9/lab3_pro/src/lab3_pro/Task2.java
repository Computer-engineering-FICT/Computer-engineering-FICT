package lab3_pro;
/**
 * Laboratory work #3
 * Skorik D.V. IO-91
 * Variant:
 * F1: 1.10:  b = MIN(C)
 * F2: 2.23: q = MAX(MA + MB - MC * MX)
 * F3: 3.16: d = MAX(MA*A - (MB * ME) * C)
 */
public class Task2 implements Runnable {

	@Override
	public void run() {
		System.out.println("Start Task2.");
		int[][] MA = new int[Modul.N][Modul.N];
		int[][] MB = new int[Modul.N][Modul.N];
		int[][] MC = new int[Modul.N][Modul.N];
		int[][] MX = new int[Modul.N][Modul.N];
		Modul.fill_Matrix(MA, 1);
		Modul.fill_Matrix(MB, 1);
		Modul.fill_Matrix(MC, 1);
		Modul.fill_Matrix(MX, 1);
		int[][] buf = Modul.F2PART(MA, MB, MC, MX);
		int q = Modul.F2(buf);
		if (Modul.N <= 8){
			System.out.println(q);
		}
		try {
			Thread.sleep(1000);
			} catch (InterruptedException e) {
			  e.printStackTrace();
		}
		System.out.println("End Task2.");
	}
}
