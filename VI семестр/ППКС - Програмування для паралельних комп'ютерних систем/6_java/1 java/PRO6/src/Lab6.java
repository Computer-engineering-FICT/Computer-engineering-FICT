
public class Lab6 {
	public static int N = 6;
	public static int P = 6;
	public static int H=N/P;
	public static int [] Z = new int[N];
	public static int [][] MX = new int [N][N];
	public static int [] B = new int[N];

	public static void main(String[] args) {
		System.out.println("Lab6 started");
		Monitor monitor = new Monitor(P);
        Task1 T1 = new Task1(monitor);
        Task2 T2 = new Task2(monitor);
        Task3 T3 = new Task3(monitor);
        Task4 T4 = new Task4(monitor);
        Task5 T5 = new Task5(monitor);
        Task6 T6 = new Task6(monitor);
        T1.start();
        T2.start();
        T3.start();
        T4.start();
        T5.start();
        T6.start();
        try {
            T1.join();
            T2.join();
            T3.join();
            T4.join();
            T5.join();
            T6.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("lab3 finished");

	}

}
