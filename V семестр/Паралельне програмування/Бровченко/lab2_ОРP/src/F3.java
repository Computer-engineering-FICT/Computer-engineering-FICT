/**
 * F3: O = sort(P)*(MR*MT)
 */

public class F3 extends Thread {
    int[] P;
    int[][] MR, MT;
    private int[] result;
    private Data d;

    F3(String name, int priority, Data d) {
        setName(name);
        setPriority(priority);
        this.d = d;
    }

    @Override
    public void run() {
        try {
            System.out.println("Task 3 start");
            int n = d.getN();
            int[] P = new int[n];
            int[][] MR = new int [n][n], MT = new int[n][n];
            result = d.func3(P, MR, MT);
            sleep(100);
            System.out.println("Task 3 end");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
