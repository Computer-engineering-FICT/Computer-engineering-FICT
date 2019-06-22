
public class T5 extends Thread{
	private monitor monitor;
	private int a5 =-429496729;
	private int[] B5 =new int[PRO6.N];
	private int[] T5 =new int[PRO6.N];
	private int[] Ti =new int[PRO6.N];
	private int [][] MC5 = new int[PRO6.N][PRO6.N];
	
	public T5(monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T5 started");
		
		monitor.Wait_INPUT_T1();
		
	for (int i =0; i<PRO6.H; i++){
		if (PRO6.Z[i]>a5)
		a5=PRO6.Z[i];
		}

	monitor.max(a5);
	monitor.Signal_a();
	B5 = monitor.copyB();
	
	for (int i = 4*PRO6.H; i< 5*PRO6.H; i++ ){
		for (int j = 0; j< PRO6.N; j++ ){
			Ti[i] = Ti[i]+(B5[j]*PRO6.MO[i][j]);
		}
	}
	
	monitor.Write_T(Ti, 4);
	monitor.Signal_T();
	
	monitor.Wait_a();
	a5 = monitor.copy_a();
	T5= monitor.copyT();
	monitor.Wait_INPUT_T6();
	MC5 = monitor.copyMC();
	for (int i = 4*PRO6.H; i< 5*PRO6.H; i++ ){
		for (int j = 0; j< PRO6.N; j++ ){
			int w = 0;
			for (int k = 0; k< PRO6.N; k++ ){
				w = w+(MC5[k][j]*PRO6.MZ[i][j]);
			}
			w = w  +a5*PRO6.MT[i][j];
			PRO6.A[i]= PRO6.A[i] + T5[j]*w;
		}
	}
	monitor.Signal_fin();
	System.out.println("T5 finished");
	}
}

