public class SynchronizationMonitor {

    private int FInput;
    private int FCalc;
    private int P;

    public SynchronizationMonitor(int P) {
        FInput = 0;
        FCalc = 0;
        this.P = P;
    }

    public synchronized void signalInput() {
        FInput++;
        notifyAll();
    }

    public synchronized void waitInput() {
        if (FInput < 1) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public synchronized void signalCalc() {
        FCalc++;
        if (FCalc == (P - 1)) {
            notify();
        }
    }

    public synchronized void waitCalc() {
        if (FCalc < (P - 1)) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

}
