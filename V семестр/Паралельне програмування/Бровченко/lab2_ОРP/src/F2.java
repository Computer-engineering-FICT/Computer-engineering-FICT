/**
 * F2: MF = MF*MG*k
 */

public class F2 extends Thread {
    int k;
    int[][] MF, MG;
    private int[][] result;
    private Data d;

    F2(String name, int priority, Data d) {
        setName(name);
        setPriority(priority);
        this.d = d;
    }

    @Override
    public void run() {
        try {
            System.out.println("Task 2 start");
            int n = d.getN();
            int k = 3;
            int[][] MF = new int [n][n], MG = new int[n][n];
            result = d.func2(k,MF,MG);
            sleep(250);
            System.out.println("Task 2 end");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
