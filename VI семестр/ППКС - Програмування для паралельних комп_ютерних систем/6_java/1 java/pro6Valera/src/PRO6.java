public class PRO6 {
    public static int N = 6;
    public static int P = 6;
    public static int H = N / P;
    public static int[] A = new int[N];
    public static int[] Z = new int[N];
    public static int[] B = new int[N];
    public static int[][] MO = new int[N][N];
    public static int[][] MZ = new int[N][N];
    public static int[][] MT = new int[N][N];

    public static void main(String[] args) {
        
        System.out.println("Lab6 started");
        monitor monitor = new monitor();
        T1 T1 = new T1(monitor);
        T2 T2 = new T2(monitor);
        T3 T3 = new T3(monitor);
        T4 T4 = new T4(monitor);
        T5 T5 = new T5(monitor);
        T6 T6 = new T6(monitor);
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
        System.out.println("lab6 finished");

    }


	
}
