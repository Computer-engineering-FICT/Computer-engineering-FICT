/*
 * ************************************************
 *                                                *                  
 *    Task F2                                     *
 *                                                *
 *  Autor: Kuzmenko Volodia                       *
 *  Group: IO-21                                  *
 *  Date: 24.09.2014                              *
 *                                                *
 **************************************************
 */


public class Task2_F2 extends Data implements Runnable {

	public Task2_F2(int N, int value) {
		super(N, value);
	}

	@Override
	public void run() {
		System.out.println("Task 2 started");
		
		int[][] MA, MB, MC, MM;
		System.out.println("Input matrix MA in T2");
		MA = matrix_input();
		System.out.println("Output matrix MA from T2");
		matrix_output(MA);

		System.out.println("Input matrix MB in T2");
		MB = matrix_input();
		System.out.println("Output matrix MB from T2");
		matrix_output(MB);

		System.out.println("Input matrix MM in T2");
		MM = matrix_input();
		System.out.println("Output matrix MM from T2");
		matrix_output(MM);

		System.out.println("Calculation T2... ");
		try {
			Thread.sleep(10000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		MC = func2(MA, MB, MM);
		System.out.println("F2: ");
		matrix_output(MC);
		
		System.out.println("Task 2 finished");

	}

	private int[][] func2(int[][] MA, int[][] MB, int[][] MM) {
		return sortMatr(addMatr(multMatr(MB, MM), MA));
	}

}
