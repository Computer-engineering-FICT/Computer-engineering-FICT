package lab3;

/**
 * @author Матвійчук Богдан группа ІО-91 
 *  2.20 MD = MA + MB – MC
 */
public class Thread2 extends Thread {
	public Thread2(int prior) {
		setPriority(prior);
	}
	public void run (){
		Package pak = new Package ();
		System.out.println("T2 started");
		matrix MA = new matrix (Package.size,Package.size);
		matrix MB = new matrix (Package.size,Package.size);
		matrix MC = new matrix (Package.size,Package.size);
		matrix MD = new matrix (Package.size,Package.size);
		System.out.println("   Input MA");MA.set1();
		System.out.println("   Input MB");MB.set1();
		System.out.println("   Input MC");MC.set1();
		MD.set1();
		MD = pak.fun2(MA, MB, MC);
//		if (Package.size<10){
//			System.out.println(MD.toString());
//		}
		System.out.println("T2 finished");
	}
}