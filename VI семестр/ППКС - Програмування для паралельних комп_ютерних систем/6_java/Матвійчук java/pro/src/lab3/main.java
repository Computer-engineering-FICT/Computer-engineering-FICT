package lab3;

/** головний клас
 * @author Матвійчук Богдан группа ІО-91 
 *  1.7   b = (A*SORT(C))
 *  2.20 MD = MA + MB – MC
 *  3.18  p = MAX(SORT(MS) + MA*MB)
 */
public class main  {
		public static void main (String[] args) {
			Thread1 t1 = new Thread1(7);
			Thread2 t2 = new Thread2(9);
			Thread3 t3 = new Thread3(6);
			t1.start();
			try {
				t1.join();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			t2.start();
			try {
				t2.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			t3.start();

		}
	}

