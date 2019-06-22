
public class Task5 extends Thread {
	private Monitor monitor;
	private int[] C5=new int[Lab6.N];
	private int [][] MO5 = new int[Lab6.N][Lab6.N];
	private int a5 = 0;
	public Task5(Monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T5 started");
		//wait for input
		monitor.waitInput();
		//copy C
		this.C5 = monitor.copyC();
		//copy MO
		this.MO5 = monitor.copyMO();
		//count a2
		int[] bufV = new int[Lab6.N];
		int [][] bufM = new int[Lab6.H][Lab6.N];
		for (int i=0; i<Lab6.H; i++){                     
			for (int j=0; j<Lab6.N; j++){
				bufM[i][j]= 0;
				for (int k=0; k<Lab6.N; k++){
					bufM[i][j] = bufM[i][j]+(MO5[i][k]*Lab6.MX[k][j]);
				}  
			}
		}
        for(int i=0; i<Lab6.H; i++)
            for(int j=0; j<Lab6.N; j++)
                bufV[i] += bufM[i][j] * C5[j];
        for (int i =0; i<Lab6.H; i++)
        	bufV[i]= bufV[i]+Lab6.B[i];
        for (int i =0; i<Lab6.H; i++)
        	a5 = a5+ bufV[i]*Lab6.Z[i];
		//count a
		monitor.countA(a5);
		System.out.println("T5 finished");
	}

}
