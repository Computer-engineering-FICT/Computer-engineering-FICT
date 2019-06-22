/*
 * ************************************************
 *                                                *                  
 *    Task F3                                     *
 *                                                *
 *  Autor: Kuzmenko Volodia                       *
 *  Group: IO-21                                  *
 *  Date: 24.09.2014                              *
 *                                                *
 **************************************************
 */

public class Task3_F3 extends Data implements Runnable {

	public Task3_F3(int N, int value) {
		super(N, value);
	}

	@Override
	public void run() {
		System.out.println("Task 3 started");
		int[][] MA, MS, MM;
		int P;

		System.out.println("Input matrix MA in T3");
		MA = matrix_input();
		System.out.println("Output matrix MA from T3");
		matrix_output(MA);

		System.out.println("Input matrix MM in T3");
		MM = matrix_input();
		System.out.println("Output matrix MM from T3");
		matrix_output(MM);

		System.out.println("Input matrix MS in T3");
		MS = matrix_input();
		System.out.println("Output matrix MS from T3");
		matrix_output(MS);

		System.out.println("Calculation T3...");
		try {
			Thread.sleep(10000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		P = func3(MA, MM, MS);
		System.out.println("F3: ");
		System.out.println(P);

		System.out.println("Task 3 finished");

	}

	private int func3(int[][] MA, int[][] MM, int[][] MS) {
		return maxElement(addMatr(sortMatr(MS), multMatr(MA, MM)));
	}

}
