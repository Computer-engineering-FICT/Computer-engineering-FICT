package PRO6;

public class GeneralResourseMonitor {

    private Matrix MO;
    private Vector T;
    private int v;
    private int e;

    public synchronized void setT(Vector value) {
        this.T = value;
    }

    public synchronized void calcE(int value) {
        if (e<value) {
            this.e = value;
        }
    }

    public synchronized void addV(int value) {
        this.v += value;
    }

    public synchronized void setMO(Matrix value) {
        this.MO = value;
    }

    public synchronized Vector copyT() {
        return this.T;
    }

    public synchronized int copyE() {
        return this.e;
    }

    public synchronized int copyV() {
        return this.v;
    }

    public synchronized Matrix copyMO() {
        return this.MO;
    }


}
