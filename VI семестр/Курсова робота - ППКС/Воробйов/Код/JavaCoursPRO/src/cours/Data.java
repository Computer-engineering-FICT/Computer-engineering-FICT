package cours;

/**
 * @author Vorobyev Vitaliy
 * Класс, що являє собою захищений модуль. З його допомогою вирішуеться
 * проблема доступу до спільного ресурсу і проблема синхронізації.
 */
public class Data {
    private int F1, F2;
    private int [][] MO;
    private int [] C;
    
    public Data () {
        F1 = 0;
        F2 = 0;
    }
    
    public synchronized void waitIn() {
        try {
            if (F1 < 2) { wait(); }
        } catch (InterruptedException e) { e.printStackTrace(); }
    }
    
    public synchronized void signalIn() {
        F1++;
        if (F1 == 2) { notifyAll(); }
    }
    
    public synchronized void waitEnd() {
        try {
            while (F2 < Cours.P - 1) { wait(); }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    
    public synchronized void signalEnd() {
        F2++;
        notifyAll();
    }
    
    public synchronized void writeMO(int [][] MTx) {
        MO = clonem(MTx);
    }
    
    public synchronized void writeC(int [] Cx) {
        C = clonev(Cx);
    }
    
    public int[][] copyMO() {
        return clonem(MO);
    }
    
    public int[] copyC() {
        return clonev(C);
    }
    
    public static int[][] clonem(int [][] MM) {
        int MT[][] = new int [MM.length][MM[0].length];
        
        for (int i = 0; i < MM.length; i++) {
            for (int j = 0; j < MM[0].length; j++) {
                MT[i][j] = MM[i][j];
            }
        }
        
        return MT;
    }  
    
    public static int[] clonev(int [] MM) {
        int C1[] = new int [MM.length];
        
        for (int i = 0; i < MM.length; i++) {
        	C1[i] = MM[i];
        }
        
        return C1;
    }    
}
