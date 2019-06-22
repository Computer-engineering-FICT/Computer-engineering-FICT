
public class Task3 extends Thread {
	private Monitor monitor;
	private int[] C3=new int[Lab6.N];
	private int [][] MO3 = new int[Lab6.N][Lab6.N];
	private int a3 = 0;
	public Task3(Monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T3 started");
		//enter B, MO
		for (int i =0; i<Lab6.N; i++){
			Lab6.B[i]=1;
		}
		for (int i =0; i<Lab6.N; i++){
			for (int j =0; j<Lab6.N; j++){
				MO3[i][j]=1;
			}
		}
		monitor.writeMO(MO3);
		//signal about input
		monitor.inputSignal();
		//wait for input
		monitor.waitInput();
		//copy C
		this.C3 = monitor.copyC();
		//copy MO
		this.MO3 = monitor.copyMO();
		//count a3
		int[] bufV = new int[Lab6.N];
		int [][] bufM = new int[Lab6.H][Lab6.N];
		for (int i=0; i<Lab6.H; i++){                     
			for (int j=0; j<Lab6.N; j++){
				bufM[i][j]= 0;
				for (int k=0; k<Lab6.N; k++){
					bufM[i][j] = bufM[i][j]+(MO3[i][k]*Lab6.MX[k][j]);
				}  
			}
		}
        for(int i=0; i<Lab6.H; i++)
            for(int j=0; j<Lab6.N; j++)
                bufV[i] += bufM[i][j] * C3[j];
        for (int i =0; i<Lab6.H; i++)
        	bufV[i]= bufV[i]+Lab6.B[i];
        for (int i =0; i<Lab6.H; i++)
        	a3 = a3+ bufV[i]*Lab6.Z[i];
		//count a
		monitor.countA(a3);
		System.out.println("T3 finished");
	}

}
