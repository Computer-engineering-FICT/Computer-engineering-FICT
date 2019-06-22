package PRO6;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public class Executor {
    public static int N = 6;
    public static int P = 6;
    public static int H = N / P;


    public static Matrix MK = new Matrix(N);
    public static Vector B = new Vector(N);
    public static Vector C = new Vector(N);
    public static Vector A = new Vector(N);
    public static Vector Z = new Vector(N);
    public static Vector E = new Vector(N);
    public static Vector T = new Vector(N);
    public static int e = 0;

    public static void main(String[] args) {
        System.out.println("Lab 6 started");
        ExecutorService service = Executors.newFixedThreadPool(P);
        GeneralResourseMonitor resourseMonitor = new GeneralResourseMonitor();
        SynchronizationMonitor syncMonitor = new SynchronizationMonitor();


        for (int id = 1; id <= P; id++) {
            service.execute(new CalculationWorker(resourseMonitor, syncMonitor, id));
        }

        service.shutdown();

    }
}