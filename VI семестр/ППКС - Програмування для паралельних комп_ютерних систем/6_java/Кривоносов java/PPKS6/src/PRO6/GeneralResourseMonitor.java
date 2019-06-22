package PRO6;

public class GeneralResourseMonitor {

    private Matrix MR;
    private int alpha;
    private int v;
    private int e;

    public synchronized void setAlpha(int value) {
        this.alpha = value;
    }


    public synchronized void addV(int value) {
        this.v += value;
    }

    public synchronized void setMR(Matrix value) {
        this.MR = value;
    }

    public synchronized int copyAlpha() {
        return this.alpha;
    }


    public synchronized int copyV() {
        return this.v;
    }

    public synchronized Matrix copyMR() {
        return this.MR;
    }


}
