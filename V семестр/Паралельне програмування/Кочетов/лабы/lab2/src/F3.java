public class F3 extends Thread {
    private Vector result;
    public Vector getResult() {
        return result;
    }

    private int N;

    F3(String name, int priority, int N) {
        setName(name);
        setPriority(priority);
        this.N = N;
    }

    @Override
    public void run() {
        try {
            sleep(100);
            System.out.println("Task 3 start");
            Vector S = new Vector(N);
            Matrix MO = new Matrix(N), MP = new Matrix(N), MR = new Matrix(N);
            result = MO.multiply(MP).multiply(S).sum(MR.multiply(S.sort()));
            System.out.println("Task 3 end");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
