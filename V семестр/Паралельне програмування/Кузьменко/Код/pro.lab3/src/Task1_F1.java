/*
 * ************************************************
 *                                                *                  
 *    Task F1                                     *
 *                                                *
 *  Autor: Kuzmenko Volodia                       *
 *  Group: IO-21                                  *
 *  Date: 24.09.2014                              *
 *                                                *
 **************************************************
 */

import java.util.Scanner;

public class Task1_F1 extends Data implements Runnable {
	public Task1_F1(int N, int value) {
		super(N, value);
	}
	
	@Override
	public void run() {
		
		int []A,B,C,E;
		int [][] MA,MZ;
		
		System.out.println("Input vector A in T1");
		A = vector_input();
		System.out.println("Output vector A from T1");
		vector_output(A);
		
		System.out.println("Input vector B in T1");
		B = vector_input();
		System.out.println("Output vector B from T1");
		vector_output(B);

		System.out.println("Input vector C in T1");
		C = vector_input();
		System.out.println("Output vector C from T1");
		vector_output(C);
		
		System.out.println("Input matrix MA in T1 ");
		MA = matrix_input();
		System.out.println("Output matrix MA from T1");
		matrix_output(MA);
		
		System.out.println("Input matrix MZ in T1");
		MZ = matrix_input();
		System.out.println("Output matrix MZ from T1");
		matrix_output(MZ);
		
		System.out.println("Calculation T1...");
		try {
			Thread.sleep(10000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		E = func1(A, B, C, MA, MZ);
		System.out.println("F1:");
		vector_output(E);
		System.out.println("Task 1 finished");

				
	}
	private int[] func1(int[] A, int[] B, int[] C, int[][] MA, int[][] MZ) {
		return addVec(addVec(multingMatrixOnVector(multMatr(MA, MZ), C), A), B);
	}
	
}
