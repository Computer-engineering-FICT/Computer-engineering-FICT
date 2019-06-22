
public class T4 extends Thread{
	private monitor monitor;
	private int a4 =-429496729;
	private int[] B4 =new int[PRO6.N];
	private int[] T4 =new int[PRO6.N];
	private int[] Ti =new int[PRO6.N];
	private int [][] MC4 = new int[PRO6.N][PRO6.N];
	
	public T4(monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T4 started");
		
		monitor.Wait_INPUT_T1();
		
	for (int i =0; i<PRO6.H; i++){
		if (PRO6.Z[i]>a4)
		a4=PRO6.Z[i];
		}

	monitor.max(a4);
	monitor.Signal_a();
	B4 = monitor.copyB();
	
	for (int i = 3*PRO6.H; i< 4*PRO6.H; i++ ){
		for (int j = 0; j< PRO6.N; j++ ){
			Ti[i] = Ti[i]+(B4[j]*PRO6.MO[i][j]);
		}
	}
	
	monitor.Write_T(Ti, 3);
	monitor.Signal_T();
	
	monitor.Wait_a();
	a4 = monitor.copy_a();
	T4= monitor.copyT();
	monitor.Wait_INPUT_T6();
	MC4 = monitor.copyMC();
	for (int i = 3*PRO6.H; i< 4*PRO6.H; i++ ){
		for (int j = 0; j< PRO6.N; j++ ){
			int w = 0;
			for (int k = 0; k< PRO6.N; k++ ){
				w = w+(MC4[k][j]*PRO6.MZ[i][j]);
			}
			w = w  +a4*PRO6.MT[i][j];
			PRO6.A[i]= PRO6.A[i] + T4[j]*w;
		}
	}
	monitor.Signal_fin();
	System.out.println("T4 finished");
	}
}
