package lab3;

/**
 *  * @author Матвійчук Богдан группа ІО-91 
 *  3.18  p = MAX(SORT(MS) + MA*MB)
 *
 */
public class Thread3 extends Thread {
	public Thread3(int prior) {
		setPriority(prior);
	}
	public void run (){
		Package pak = new Package ();
		System.out.println("T3 started");
		matrix MA = new matrix (Package.size,Package.size);
		matrix MB = new matrix (Package.size,Package.size);
		matrix MS = new matrix (Package.size,Package.size);
		System.out.println("   Input MA");MA.set1();
		System.out.println("   Input MB");MB.set1();
		System.out.println("   Input MC");MS.set1();
		int p = pak.fun3(MS, MA, MB);
		System.out.println(p);
		System.out.println("T3 finished");
	}
}
