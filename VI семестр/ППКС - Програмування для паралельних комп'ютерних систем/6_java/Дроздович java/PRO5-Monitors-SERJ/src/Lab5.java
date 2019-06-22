/*--------------------------------------------------------------
--              Paralel and distributed computing             --
--             Laboratory work #5. Java. Monitors             --
--                  Func:   	ÌA=MB * MC + alfa * MO * MX   --
--                   IO-83  Drozdovich Sergiy                 --
--------------------------------------------------------------*/
public class Lab5 {
    
    public static final int N = 4;
    public static final int P = 4;
    public static final int H = N/P;
    
    static int MX[][] = new int[N][N];
    static int MC[][] = new int[N][N];
    static int MA[][] = new int[N][N];
    
    public static int[][] clone(int [][] MM) {
        int MT[][] = new int [MM.length][MM[0].length];
        
        for (int i = 0; i < MM.length; i++) {
            for (int j = 0; j < MM[0].length; j++) {
                MT[i][j] = MM[i][j];
            }
        }
        return MT;
    }
    
    public static void main(String[] args) {
       
        Data dat = new Data();
        
        T1 t1 = new T1(dat, 1);
        T2 t2 = new T2(dat, 2);
        T3 t3 = new T3(dat, 3);
        T4 t4 = new T4(dat, 4);
        
        t1.start();
        t2.start();
        t3.start();
        t4.start();

        System.out.println("ÊÎÍÅÖ");
    }

}
