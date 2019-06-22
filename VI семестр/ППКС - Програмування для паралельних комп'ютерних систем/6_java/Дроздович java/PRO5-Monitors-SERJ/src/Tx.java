public abstract class Tx extends Thread {
    protected int num;
    protected Data dat;
    
    protected int MBx[][], MOx[][];
    protected int ax;
    
    public Tx(Data d, int n) {
        dat = d;
        num = n;
    }
    
    // MB1 * MCH + alfa1 * MO1 * MXH
    protected void process() {
	     int sum1, sum2;
	     for (int i = 0; i < Lab5.N; i++) {
	    	 for (int j = (num-1)*Lab5.H; j < num*Lab5.H; j++) {
	    		sum1 = 0; sum2 = 0;
	    		 for (int z = 0; z < Lab5.N; z++) {
	    			 sum1 = sum1 + Lab5.MC[z][j] * MBx[i][z];
	    			 sum2 = sum2 + Lab5.MX[z][j] * MOx[i][z];
	    		}
	    		Lab5.MA[i][j] = sum1 + ax * sum2;
	    	 }
	     }
    }
    
    protected int [][] input() {
        int [][] MT = new int [Lab5.N][Lab5.N]; 
        for (int i = 0; i < Lab5.N; i++) {
            for (int j = 0; j < Lab5.N; j++) {
                MT[i][j] = 1;
            }
        }
        return MT;
    }
}
