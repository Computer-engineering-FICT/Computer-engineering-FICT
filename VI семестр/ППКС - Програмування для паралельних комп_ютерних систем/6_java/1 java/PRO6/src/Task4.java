
public class Task4 extends Thread {
	private Monitor monitor;
	private int[] C4=new int[Lab6.N];
	private int [][] MO4 = new int[Lab6.N][Lab6.N];
	private int a4 = 0;
	public Task4(Monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T4 started");
		//wait for input
		monitor.waitInput();
		//copy C
		this.C4 = monitor.copyC();
		//copy MO
		this.MO4 = monitor.copyMO();
		//count a4
		int[] bufV = new int[Lab6.N];
		int [][] bufM = new int[Lab6.H][Lab6.N];
		for (int i=0; i<Lab6.H; i++){                     
			for (int j=0; j<Lab6.N; j++){
				bufM[i][j]= 0;
				for (int k=0; k<Lab6.N; k++){
					bufM[i][j] = bufM[i][j]+(MO4[i][k]*Lab6.MX[k][j]);
				}  
			}
		}
        for(int i=0; i<Lab6.H; i++)
            for(int j=0; j<Lab6.N; j++)
                bufV[i] += bufM[i][j] * C4[j];
        for (int i =0; i<Lab6.H; i++)
        	bufV[i]= bufV[i]+Lab6.B[i];
        for (int i =0; i<Lab6.H; i++)
        	a4 = a4+ bufV[i]*Lab6.Z[i];
		//count a
		monitor.countA(a4);
		System.out.println("T4 finished");
	}

}
