
public class Task2 extends Thread{
	private Monitor monitor;
	private int[] C2=new int[Lab6.N];
	private int [][] MO2 = new int[Lab6.N][Lab6.N];
	private int a2 = 0;
	public Task2(Monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T2 started");
		//wait for input
		monitor.waitInput();
		//copy C
		this.C2 = monitor.copyC();
		//copy MO
		this.MO2 = monitor.copyMO();
		//count a2
		int[] bufV = new int[Lab6.N];
		int [][] bufM = new int[Lab6.H][Lab6.N];
		for (int i=Lab6.H; i<2*Lab6.H; i++){                     
			for (int j=0; j<Lab6.N; j++){
				bufM[i-Lab6.H][j]= 0;
				for (int k=0; k<Lab6.N; k++){
					bufM[i-Lab6.H][j] = bufM[i-Lab6.H][j]+(MO2[i][k]*Lab6.MX[k][j]);
				}  
			}
		}
        for(int i=Lab6.H; i<2*Lab6.H; i++)
            for(int j=0; j<Lab6.N; j++)
                bufV[i] += bufM[i-Lab6.H][j] * C2[j];
        for (int i =0; i<bufV.length; i++)
        	bufV[i]= bufV[i]+Lab6.B[i];
        for (int i =0; i<bufV.length; i++)
        	a2 = a2+ bufV[i]*Lab6.Z[i];
		//count a
		monitor.countA(a2);
		System.out.println("T2 finished");
	}

}
