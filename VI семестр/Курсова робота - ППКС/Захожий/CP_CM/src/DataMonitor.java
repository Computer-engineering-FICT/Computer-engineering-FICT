public class DataMonitor {

    private Matrix MC;
    private Matrix ME;
    private Matrix MD;

    public DataMonitor(){}

    public synchronized Matrix getMC() {
        return MC.copy();
    }

    public synchronized void setMC(Matrix MC) {
        this.MC = MC.copy();
    }

    public synchronized Matrix getME() {
        return ME.copy();
    }

    public synchronized void setME(Matrix ME) {
        this.ME = ME.copy();
    }

    public synchronized Matrix getMD() {
        return MD.copy();
    }

    public synchronized void setMD(Matrix MD) {
        this.MD = MD.copy();
    }
    
}
