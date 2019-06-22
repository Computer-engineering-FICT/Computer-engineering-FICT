package lab3;

/**
  * @author Матвійчук Богдан группа ІО-91 
 *  1.7   b = (A*SORT(C))
 */
public class Thread1 extends Thread {
	public Thread1(int prior) {
		setPriority(prior);
	}
	public void run (){
		Package pak = new Package ();
		System.out.println("T1 started");
		Vector A = new Vector(Package.size);
		Vector C = new Vector(Package.size);
		System.out.println("   Input A");A.set1();
		System.out.println("   Input C");C.set1();
		int b = pak.fun1(A, C);
		System.out.println(b);
		System.out.println("T1 finished");
	}
}