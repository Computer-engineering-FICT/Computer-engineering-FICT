package Lab6;

import java.util.Calendar;
import 	java.util.Date;
/**********************************
 **********************************
 ** Laba6. Java. Monitors
 ** @author Matviychyk B
 ** IO - 91 group
 ** A=B*(MO*MX)*l+Z(MR*MT)
 ** OR: MX,B,l,Z,MT
 ** 08,05,2012
 **********************************
 **********************************/
public class Laba6 {
	
	static int N = 6000;
	static int P = 6;
	static int H = N/P;
	static int[] A = new int[N];
	static int[] Bo = new int[N];
	static int[] Zo = new int[N];
	static int[][] MO = new int[N][N];
	static int[][] MR = new int[N][N];
	static int[][] MXo = new int[N][N];
	static int[][] MTo = new int[N][N];
	static int lo;
	static Work w = new Work();
	static Monitor m = new Monitor();

	public static void main(String[] args) {
		long start,stop;
		Calendar cal = Calendar.getInstance();
		start = cal.getTimeInMillis();
		System.out.println("Laba6 started");
		T1 f1 = new T1("task1");
		T2 f2 = new T2("task2");
		T3 f3 = new T3("task3");
		T4 f4 = new T4("task4");
		T5 f5 = new T5("task5");
		T6 f6 = new T6("task6");
		
		f1.start();
		f2.start();
		f3.start();
		f4.start();
		f5.start();
		f6.start();
		

		try {
			f2.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		try {
			f3.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		try {
			f4.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		try {
			f5.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		try {
			f6.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		try {
			f1.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		cal = Calendar.getInstance();
		stop = cal.getTimeInMillis();
		double t= stop-start;
		if (t>=100){
			t=t*0.1;
		}
		
		System.out.println("Laba6 finished."+'\n');
	}// main
}// Runner

