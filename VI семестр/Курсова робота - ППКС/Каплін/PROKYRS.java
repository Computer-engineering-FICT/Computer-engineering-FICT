import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
/*
 * Kaplin Ivan, IO-41
 * Parallel Programming
 * MA=MB(MC-a*MO*MX)
 * Date: 19.05.07
 */

public class PROKYRS {		

	public static void main(String[] args){		
		System.out.println("Main started");
		Date time = new Date();
		// Input P
		int P=8;
		System.out.println("Input P: ");
		 BufferedReader bReader1 = new BufferedReader(
				 new InputStreamReader(System.in));
		String Str = "8";
		try {
			Str = bReader1.readLine();
		} catch (IOException e) {			
			e.printStackTrace();
		}
		P = Integer.parseInt(Str);
		// Input N
		System.out.println("Input N: ");
		 BufferedReader bReader2 = new BufferedReader(
				 new InputStreamReader(System.in));
		String Str2 = "800";		
		try {
			Str2 = bReader2.readLine();
		} catch (IOException e) {			
			e.printStackTrace();
		}
		long T1 = time.getTime();		
		int N = Integer.parseInt(Str2);
		int H = N/P;		
		System.out.println("H="+H);
		// Create Monitor (BOX)
		BOX monitor = new BOX(N,H);
		// Create tasks and run tasks
		System.out.println("Start tasks");
		Task[] tasks = new Task[P+1];
		for (int i=1; i<=P; i++){			
			tasks[i] = new Task(N,H,monitor,i);
			tasks[i].start();
		}
		tasks[(int) N/H].setT1(T1);
		System.out.println("Tasks started, main ends");
	}
}
