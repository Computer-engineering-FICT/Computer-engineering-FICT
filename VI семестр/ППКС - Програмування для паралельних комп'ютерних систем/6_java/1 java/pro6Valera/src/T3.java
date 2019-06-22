
public class T3 extends Thread{
	private monitor monitor;
	private int a3 =-429496729;
	private int[] B3 =new int[PRO6.N];
	private int[] T3 =new int[PRO6.N];
	private int[] Ti =new int[PRO6.N];
	private int [][] MC3 = new int[PRO6.N][PRO6.N];
	
	public T3(monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T3 started");
		
		monitor.Wait_INPUT_T1();
		
	for (int i =0; i<PRO6.H; i++){
		if (PRO6.Z[i]>a3)
		a3=PRO6.Z[i];
		}

	monitor.max(a3);
	monitor.Signal_a();
	B3 = monitor.copyB();
	
	for (int i = 2*PRO6.H; i< 3*PRO6.H; i++ ){
		for (int j = 0; j< PRO6.N; j++ ){
			Ti[i] = Ti[i]+(B3[j]*PRO6.MO[i][j]);
		}
	}
	
	monitor.Write_T(Ti, 2);
	monitor.Signal_T();
	
	monitor.Wait_a();
	a3 = monitor.copy_a();
	T3= monitor.copyT();
	monitor.Wait_INPUT_T6();
	MC3 = monitor.copyMC();
	for (int i = 2*PRO6.H; i< 3*PRO6.H; i++ ){
		for (int j = 0; j< PRO6.N; j++ ){
			int w = 0;
			for (int k = 0; k< PRO6.N; k++ ){
				w = w+(MC3[k][j]*PRO6.MZ[i][j]);
			}
			w = w  +a3*PRO6.MT[i][j];
			PRO6.A[i]= PRO6.A[i] + T3[j]*w;
		}
	}
	monitor.Signal_fin();
	System.out.println("T3 finished");
	}
}
