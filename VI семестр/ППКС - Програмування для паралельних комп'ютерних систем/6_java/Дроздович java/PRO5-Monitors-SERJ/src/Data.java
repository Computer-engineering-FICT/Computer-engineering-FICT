public class Data {
    private int F1, F2;
    private int [][] MO, MB;
    private int a;
    
    public Data() {
        F1 = 0;
        F2 = 0;
    }
    //����� ����������� ����� ��������
    public int[][] copyMO() {
        return Lab5.clone(MO);
    }
    public int[][] copyMB() {
        return Lab5.clone(MB);
    }
    public int copya() {
        return a;
    }
    //����� ������������ �� �����
    public synchronized void InputSynchro() {
        try {
            while (F2 < 3) {
                wait();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    //������ �� ��������� �����
    public synchronized void InputSignal() {
        F2++;
        notifyAll();
    }
    //����� ������������ �� ����� (������)
    public synchronized void OutputSynchro() {
        try {
            while (F1 < Lab5.P - 1) {
                wait();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    //������ �� ��������� �����
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
