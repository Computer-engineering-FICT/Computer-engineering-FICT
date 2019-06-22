
public class Task1 extends Thread {
	private Monitor monitor;
	private int[] C1=new int[Lab6.N];
	private int [][] MO1 = new int[Lab6.N][Lab6.N];
	private int a1 = 0;
	public Task1(Monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T1 started");
		//enter Z
		for (int i =0; i<Lab6.N; i++){
			Lab6.Z[i]=1;
		}
		//signal about input
		monitor.inputSignal();
		//wait for input
		monitor.waitInput();
		//copy C
		this.C1 = monitor.copyC();
		//copy MO
		this.MO1 = monitor.copyMO();
		//count a1
		int[] bufV = new int[Lab6.N];
		int [][] bufM = new int[Lab6.H][Lab6.N];
		for (int i=0; i<Lab6.H; i++){                     
			for (int j=0; j<Lab6.N; j++){
				bufM[i][j]= 0;
				for (int k=0; k<Lab6.N; k++){
					bufM[i][j] = bufM[i][j]+(MO1[i][k]*Lab6.MX[k][j]);
				}  
			}
		}
        for(int i=0; i<Lab6.H; i++)
            for(int j=0; j<Lab6.N; j++)
                bufV[i] += bufM[i][j] * C1[j];
        for (int i =0; i<Lab6.H; i++)
        	bufV[i]= bufV[i]+Lab6.B[i];
        for (int i =0; i<Lab6.H; i++)
        	a1 = a1+ bufV[i]*Lab6.Z[i];
		/**for (int i=0; i<Lab6.H; i++){                     
			for (int j=0; j<Lab6.N; j++){
				temp= 0;
				for (int k=0; k<Lab6.N; k++){
					temp = temp+(MO1[i][k]*Lab6.MX[k][j]);
				}        
		        bufV[i] = temp + temp*C1[j];
			}
			a1= a1+ (bufV[i]+Lab6.B[i])*Lab6.Z[i];
		}*/
		//count a
		monitor.countA(a1);
		//wait for signals
		monitor.waitCountA();
		//output a
		a1 = monitor.outputA();
		System.out.println(a1);
		System.out.println("T1 finished");
	}

}
