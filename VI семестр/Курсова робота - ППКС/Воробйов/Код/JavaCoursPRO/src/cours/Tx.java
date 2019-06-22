package cours;

/**
 * @author Vorobyev Vitaliy
 * Класс, за допомогою якого створюються процесси.
 */

//А=Вh+С*(МО*МХh-МЕh) 
public class Tx extends Thread {
    public int id;
    
    private int [][] MOx;
    private int [] Cx;
    private Data dat;
    
    public Tx (int id, Data dat) {
        this.id = id;
        this.dat = dat;
    }
    
    public void run () {
       System.out.println ("Process " + id + " STARTED");
        
       if (id == 1) {
           MOx = inputMatr();
           Cours.B = inputVec();
           dat.writeMO(MOx);
           dat.signalIn();
       } 
       
       if (id == Cours.P) {
    	   Cours.MX = inputMatr();  
    	   Cours.ME = inputMatr();
    	   Cx = inputVec();
    	   dat.writeC(Cx);
           dat.signalIn();
       } 
       
       dat.waitIn();
       System.out.println ("Process " + id + " data copying");
       if (id != 1) MOx = dat.copyMO();
       if (id != Cours.P) Cx = dat.copyC();
       
       System.out.println ("Process " + id + " processing started");
       process();                            
       
       if (id == 1) {
           dat.waitEnd();
           if (Cours.N <= 30) outVec (Cours.A);
       } else {
           dat.signalEnd();
       }             
       
       System.out.println ("Process " + id + " FINISHED");
    }
    
    private void outVec(int[] a) {
    	for (int i = 0; i < a.length; i++) {
        	System.out.print(a[i] + "  ");
        }
    	System.out.println();
	}

	private void process () {
        //MT=(!МО*МХh-МЕh!)
		int[][] MT = new int[Cours.N][Cours.N];
		
		int sum1;
	    for (int i = 0; i < Cours.N; i++) {
	    	 for (int j = (id-1)*Cours.H; j < id*Cours.H; j++) {
	    		sum1 = 0;
	    		for (int z = 0; z < Cours.N; z++) {
	    			 sum1 = sum1 + MOx[z][j] * Cours.MX[i][z];
	    		}
	    		MT[i][j] = sum1 - Cours.ME[i][j];
	    	 }
	    }
	    //А=Вh+С*MTh
	    for (int i = (id-1)*Cours.H; i < id*Cours.H; i++) {
			sum1 = 0;
			for (int j = 0; j < Cours.N; j++) {
				sum1 = sum1 + Cx[j] * MT[j][i];
			}
			Cours.A[i] = sum1 + Cours.B[i];
		}
    }
    
    private int[][] inputMatr () {
        int [][] temp = new int[Cours.N][Cours.N];
        for (int i = 0; i < temp.length; i++) {
            for (int j = 0; j < temp[0].length; j++) {
                temp[i][j] = 1;
            }
        }
        return temp;
    }
    
    private int[] inputVec () {
        int [] temp = new int[Cours.N];
        for (int i = 0; i < temp.length; i++) {
        	temp[i] = 1;
        }
        return temp;
    }
}
