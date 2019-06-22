public class F2 extends Thread {
    private Matrix result;
    public Matrix getResult() {
        return result;
    }

    private int N;

    F2(String name, int priority, int N) {
        setName(name);
        setPriority(priority);
        this.N = N;
    }

    @Override
    public void run() {
        try {
            sleep(250);
            System.out.println("Task 2 start");
            Matrix MF = new Matrix(N), MG = new Matrix(N), MH = new Matrix(N), MK = new Matrix(N);
            result = MG.multiply(MF.min()).sum(MK.multiply(MF).multiply(MH.max()));
            System.out.println("Task 2 end");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
