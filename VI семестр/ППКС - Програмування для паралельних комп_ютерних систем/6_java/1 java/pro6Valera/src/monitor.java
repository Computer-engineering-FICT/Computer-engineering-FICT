public class monitor {
    private int a = -429496729;
    private int F1 = 0;
    private int F2 = 0;
    private int F3 = 0;
    private int F4 = 0;
    private int F5 = 0;
    private int[] B;
    private int[] T = new int[PRO6.N];
    private int[][] MC;

    synchronized void writeMC(int[][] MC) {
        this.MC = MC;
    }

    public synchronized void Write_T(int[] value_T, int r) {
        for (int i = PRO6.H * r; i < PRO6.H * (r + 1); i++)
            T[i] = value_T[i];
    }

    public synchronized void writeB(int[] B) {
        this.B = B;
    }

    public synchronized int[][] copyMC() {
        int[][] temp = MC;
        return temp;
    }

    public synchronized int[] copyB() {
        int[] temp = B;
        return temp;
    }

    public synchronized int[] copyT() {
        int[] temp = T;
        return temp;
    }

    public synchronized int copy_a() {
        int temp = a;
        return temp;
    }

    public synchronized void max(int ai) {
        if (a < ai)
            a = ai;
    }

    public synchronized void Signal_INPUT_T1() {
        F1 = F1 + 1;
        notify();
    }

    public synchronized void Signal_INPUT_T6() {
        F2 = F2 + 1;
        notify();
    }

    public synchronized void Signal_a() {
        F5 = F5 + 1;
        notify();
    }

    public synchronized void Wait_a() {
        while (F5 != 6) {
            try {
                wait();
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        notify();
    }

    public synchronized void Signal_fin() {
        F4 = F4 + 1;
        notify();
    }

    public synchronized void Signal_T() {
        F3 = F3 + 1;
        notify();
    }

    public synchronized void Wait_INPUT_T1() {
        while (F1 != 1) {
            try {
                wait();
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        notify();
    }

    public synchronized void Wait_INPUT_T6() {
        while (F2 != 1) {
            try {
                wait();
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        notify();
    }

    public synchronized void Wait_fin() {
        while (F4 != 5) {
            try {
                wait();
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        notify();
    }

    public synchronized void Wait_T() {
        while (F3 != 6) {
            try {
                wait();
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        notify();
    }

}