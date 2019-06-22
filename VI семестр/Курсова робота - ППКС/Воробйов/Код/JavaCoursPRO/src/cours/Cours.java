/*--------------------------------------------------------------
--              Paralel and distributed computing             --
--                      Coursework. Java                      --
--                  Func: ю=б+я*(лн*лу-ле)                    --
--                   IO-83 Vorobyev vitaliy                   --
--                         14.04.2010                         --
--------------------------------------------------------------*/

package cours;

import java.io.FileWriter;
import java.util.Date;

public class Cours {

    public static int N;
    public static int P;
    public static int H;

    static int MX[][] = new int[N][N];
    static int MO[][] = new int[N][N];
    static int ME[][] = new int[N][N];
    static int B[] = new int[N];
    static int C[] = new int[N];
    static int A[];
        
    public static void main(String[] args) {
        N = Integer.valueOf(args[0]);
        if (N == 1) N = 2;
        P = Integer.valueOf(args[1]);
        //if (P == 1) P = 2;
        H = N/P;
        
        A = new int[N];
        
        Date date = new java.util.Date();
        long startTime = date.getTime();
        
        Tx arr[] = new Tx[P];
        Data dat = new Data ();
        
        for (int i = 1; i <= P; i++) {
            arr[i-1] = new Tx (i, dat);
        }
        
        for (int i = 0; i < P; i++) {
            arr[i].start();
        }
        
        dat.waitEnd();
        date = new java.util.Date();
        long finishTime = date.getTime();
        long time  = finishTime - startTime;
        
        try{
            FileWriter sw = new FileWriter("out.txt",true);
            sw.write("N = " + N + " P = " + P + " Work time: " + time + " ms \n /n");
            sw.close();
        }catch(Exception e){
            System.out.print(e.getMessage());
        }    
        
        System.out.println("N = " + N + " P=" + P + " Work time: " + time + " ms");                
    }
}
