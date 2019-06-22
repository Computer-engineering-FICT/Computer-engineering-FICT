import java.util.Scanner;

/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             * 
 *     Laboratory work #3. Threads in Java     *
 *                                             * 
 * Task: F1: E = A + B + C + D * (MA * MZ)     *
 *       F2: MD = (MA * MB) * TRANS(MC)        *
 *       F3: E = (MA * MM) * B + MB * SORT(A)  *
 * 											   *
 * @author Red'ko Alexander					   *
 * @group IO-01								   *
 * @date 23.09.12                              *
 *                                             *
 * * * * * * * * * * * * * * * * * * * * * * * *  
 */
public class Main {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter N: ");
	    int n = sc.nextInt();
		System.out.print("Enter value: ");
		int value = sc.nextInt();
		System.out.println();
		
		Thread t1 = new Thread(new RunnableF1(n, value));
		t1.setPriority(Thread.NORM_PRIORITY);
		Thread t2 = new Thread(new RunnableF2(n, value));
		t2.setPriority(Thread.NORM_PRIORITY);
		Thread t3 = new Thread(new RunnableF3(n, value));
		t3.setPriority(Thread.NORM_PRIORITY);
		
		t1.start();
		t2.start();
		t3.start();
	}
}
