
public class Task6 extends Thread {
	private Monitor monitor;
	private int[] C6=new int[Lab6.N];
	private int [][] MO6 = new int[Lab6.N][Lab6.N];
	private int a6 = 0;
	public Task6(Monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T6 started");
		//enter C, MX
		for (int i =0; i<Lab6.N; i++){
			C6[i]=1;
		}
		for (int i =0; i<Lab6.N; i++){
			for (int j =0; j<Lab6.N; j++){
				Lab6.MX[i][j]=1;
			}
		}
		monitor.writeC(C6);
		//signal about input
		monitor.inputSignal();
		//wait for input
		monitor.waitInput();
		//copy C
		this.C6 = monitor.copyC();
		//copy MO
		this.MO6 = monitor.copyMO();
		//count a6
		int[] bufV = new int[Lab6.N];
		int [][] bufM = new int[Lab6.H][Lab6.N];
		for (int i=0; i<Lab6.H; i++){                     
			for (int j=0; j<Lab6.N; j++){
				bufM[i][j]= 0;
				for (int k=0; k<Lab6.N; k++){
					bufM[i][j] = bufM[i][j]+(MO6[i][k]*Lab6.MX[k][j]);
				}  
			}
		}
        for(int i=0; i<Lab6.H; i++)
            for(int j=0; j<Lab6.N; j++)
                bufV[i] += bufM[i][j] * C6[j];
        for (int i =0; i<Lab6.H; i++)
        	bufV[i]= bufV[i]+Lab6.B[i];
        for (int i =0; i<Lab6.H; i++)
        	a6 = a6+ bufV[i]*Lab6.Z[i];
		//count a
		monitor.countA(a6);
		System.out.println("T6 finished");
	}

}
