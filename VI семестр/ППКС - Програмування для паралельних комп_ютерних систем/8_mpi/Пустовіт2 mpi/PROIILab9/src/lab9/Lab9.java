/*--------------------------------------------------------------
--              Paralel and distributed computing             --
--               Laboratory work #9. Java. Pipes              --
--                    Func: MA = MB*(MC*MZ)                   --
--                   IO-73 Pustovit Michael                   --
--                         20.04.2010                         --
--------------------------------------------------------------*/

package lab9;

public class Lab9 {    
    public final static int N = 1500;
    public final static int P = 5;
    public final static int H = N/P;
             
    
    public static void main(String[] args) {
        System.out.println ("START");
        
        Node [] nodearr = new Node [P];
        
        for (int i = 0; i < P; i++) {
            nodearr[i] = new Node (i, nodearr);
        }
        
        for (int i = 0; i < P; i++) {
            nodearr[i].createPipes();
        }
        
        for (int i = 0; i < P; i++) {
            nodearr[i].start();
        }
    }
}
