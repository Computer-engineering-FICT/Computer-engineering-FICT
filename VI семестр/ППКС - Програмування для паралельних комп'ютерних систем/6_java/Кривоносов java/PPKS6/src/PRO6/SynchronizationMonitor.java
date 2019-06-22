package PRO6;

public class SynchronizationMonitor {

    private int inputFlag;
    private int vFlag;
    private int eFlag;
    private int AFlag;

    public synchronized void inputSignal() {
        inputFlag++;
        if (inputFlag >= 3)
            notifyAll();
    }

    public synchronized void calcVSignal() {
        vFlag++;
        if (vFlag >= Executor.P)
            notifyAll();
    }



    public synchronized void calcMASignal() {
        AFlag++;
        if (AFlag == Executor.P - 1)
            notifyAll();
    }

    public synchronized void waitForInput() {
        try {
            if (inputFlag < 3) wait();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public synchronized void waitForCalcV() {
        try {
            if (vFlag < Executor.P)
                wait();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }


    public synchronized void waitForCalcMA() {
        try {
            if (AFlag < Executor.P - 1)
                wait();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}