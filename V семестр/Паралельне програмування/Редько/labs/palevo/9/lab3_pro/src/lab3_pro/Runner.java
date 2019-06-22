package lab3_pro;
/**
 * Laboratory work #3
 * Skorik D.V. IO-91
 * Variant:
 * F1: 1.10:  b = MIN(C)
 * F2: 2.23: q = MAX(MA + MB - MC * MX)
 * F3: 3.16: d = MAX(MA*A - (MB * ME) * C)
 */
public class Runner {
	public static void main(String[] args) throws InterruptedException {
		System.out.println("Start main process.");
		Task1 t1 = new  Task1();
		Thread t2 = new Thread(new Task2());
		Thread t3 = new Thread(new Task3());
		t2.setPriority(Thread.MAX_PRIORITY);
		t3.setPriority(Thread.NORM_PRIORITY);
		t1.setPriority(Thread.MIN_PRIORITY);
		t1.start();
		t2.start();
		t3.start();
		t1.join();
		t2.join();
		t3.join();
		System.out.println("End main process.");
	}
}
