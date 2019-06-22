public class F1 extends Thread {
    private Vector result;
    public Vector getResult() {
        return result;
    }

    private int N;

    F1(String name, int priority, int N) {
        setName(name);
        setPriority(priority);
        this.N = N;
    }

    @Override
    public void run() {
        try {
            sleep(500);
            System.out.println("Task 1 start");
            Vector A = new Vector(N), B = new Vector(N), D = new Vector(N);
            Matrix MA = new Matrix(N), ME = new Matrix(N);
            result = MA.multiply(ME).multiply(A).sum(B).sum(D);
            System.out.println("Task 1 end");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
