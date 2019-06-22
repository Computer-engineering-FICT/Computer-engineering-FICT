/**
 * Parallel and distributed computing.
 * Labwork 2. Java.
 *
 * Anastasiya Brovchenko
 * IO-64
 * 02.10.2018
 *
 * F1: C = A-B*(MA*MC)*e
 * F2: MF = MF*MG*k
 * F3: O = sort(P)*(MR*MT)
 */

public class Lab2 extends Thread {

    public static void main(String[] args) {
        (new Lab2()).start();
    }

    @Override
    public void run() {
        setName("Lab 2");
        System.out.println("Lab 2 start\n");
        int n = 1000;
        Data data = new Data(n);
        F1 f1 = new F1("F1", Thread.NORM_PRIORITY, data);
        F2 f2 = new F2("F2", Thread.MIN_PRIORITY, data);
        F3 f3 = new F3("F3", Thread.MAX_PRIORITY, data);
        f1.start();
        f2.start();
        f3.start();
        try {
            f1.join();
            f2.join();
            f3.join();
            //System.out.println(f1.getResult());
            //System.out.println(f2.getResult());
            //System.out.println(f3.getResult());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("\nLab 2 end");
    }
}
