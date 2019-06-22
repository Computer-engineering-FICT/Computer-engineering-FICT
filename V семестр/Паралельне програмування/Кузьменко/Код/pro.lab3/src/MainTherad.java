/*
 * ************************************************
 *                                                *
 *         Laboratory work #3.                    *
 *         Threads in Java                        *                  
 *                                                *
 * 	 Task:                                        *
 * 	    F1: 1.24 E = A + C * (MA * MZ) + B        *      
 *      F2: 2.14 MC = SORT(MA + MB * MM)          *      
 *      F3: 3.18 p = MAX(SORT(MS) + MA* MM)       *  
 *                                                *
 *  Autor: Kuzmenko Volodia                       *
 *  Group: IO-21                                  *
 *  Date: 24.09.2014                              *
 *                                                *
 **************************************************
 */

import java.util.Scanner;

public class MainTherad {

	 
	// main thread
	public static void main(String[] args) throws InterruptedException {
	
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Input N");
		int N = sc.nextInt();
		System.out.println("Input value");
		int value = sc.nextInt();

		Thread t1 = new Thread(null, new Task1_F1(N, value), "Task 1", 1000);
		Thread t2 = new Thread(null, new Task2_F2(N, value), "Task 2", 1000);
		Thread t3 = new Thread(null, new Task3_F3(N, value), "Task 3", 1000);

		t1.start();
		
		t2.start();
		t3.start();

	}

}
