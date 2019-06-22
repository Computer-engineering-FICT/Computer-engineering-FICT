/*
--              Parallel and Distributed Computing
--                   Laboratory work #6 Java
--
--
--  MA = (B*C)*MO + alpha*(MT*MR)
--  Author: Kryvonosov Oleksii, group IO-34
--  Date: 22.04.2016
------------------------------------------------------------------ */
package PRO6;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public class Executor {
    public static int N = 6;
    public static int P = 6;
    public static int H = N / P;


    public static Matrix MT = new Matrix(N);
    public static Matrix MA = new Matrix(N);
    public static Matrix MO = new Matrix(N);
    public static Vector B = new Vector(N);
    public static Vector C = new Vector(N);




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