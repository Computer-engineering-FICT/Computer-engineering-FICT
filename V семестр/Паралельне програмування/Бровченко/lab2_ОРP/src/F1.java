/**
 * F1: C = A-B*(MA*MC)*e
 */


public class F1 extends Thread {

    int[] A, B;
    int e;
    int[][] MA, MC;
    private int[] result;
    private Data d;

    F1(String name, int priority, Data d) {
        setName(name);
        setPriority(priority);
        this.d = d;
        }

    @Override
    public void run() {
        try {
            System.out.println("Task 1 start");
            int n = d.getN();
            int[] A = new int[n], B = new int[n];
            int e = 3;
            int[][] MA = new int [n][n], MC = new int[n][n];
            result = d.func1(A, B, MA, MC, e);
            sleep(500);
            System.out.println("Task 1 end");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
