public class Data {
    private int F1, F2;
    private int [][] MO, MB;
    private int a;
    
    public Data() {
        F1 = 0;
        F2 = 0;
    }
    //метод копирования Общих Ресурсов
    public int[][] copyMO() {
        return Lab5.clone(MO);
    }
    public int[][] copyMB() {
        return Lab5.clone(MB);
    }
    public int copya() {
        return a;
    }
    //метод сихронизации по вводу
    public synchronized void InputSynchro() {
        try {
            while (F2 < 3) {
                wait();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    //Сигнал об окончании ввода
    public synchronized void InputSignal() {
        F2++;
        notifyAll();
    }
    //метод сихронизации по счёту (выводу)
    public synchronized void OutputSynchro() {
        try {
            while (F1 < Lab5.P - 1) {
                wait();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    //Сигнал об окончании счёта
    public synchronized void CalcEndSignal() {
        F1++;
        notifyAll();
    }
    
    public synchronized void writeMB(int [][] MT1) {
        MB = Lab5.clone(MT1);
    }
    
    public synchronized void writeMO(int [][] MT1) {
        MO = Lab5.clone(MT1);
    }
    
    public synchronized void writea(int t) {
    	a = t;
    }
}
