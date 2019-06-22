
public class T6 extends Thread{
	private monitor monitor;
	private int a6 =-429496729;
	private int[] B6 =new int[PRO6.N];
	private int[] T6 =new int[PRO6.N];
	private int[] Ti =new int[PRO6.N];
	private int [][] MC6 = new int[PRO6.N][PRO6.N];
	
	public T6(monitor monitor){
		this.monitor = monitor;
	}
	public void run(){
		System.out.println("T6 started");
		//enter             

		for (int i =0; i<PRO6.N; i++){
			for (int j =0; j<PRO6.N; j++){
				MC6[i][j]=1;
				PRO6.MZ[i][j]=1;
				PRO6.MT[i][j]=1;
			}
		}
		monitor.writeMC(MC6);;
		monitor.Signal_INPUT_T6();
		monitor.Wait_INPUT_T1();
		
	for (int i =5*PRO6.H; i<6*PRO6.H; i++){
		if (PRO6.Z[i]>a6)
		a6=PRO6.Z[i];
		}

	monitor.max(a6);
	monitor.Signal_a();
	B6 = monitor.copyB();
	
	for (int i = 5*PRO6.H; i< 6*PRO6.H; i++ ){
		for (int j = 0; j< PRO6.N; j++ ){
			Ti[i] = Ti[i]+(B6[j]*PRO6.MO[i][j]);
		}
	}
	
	monitor.Write_T(Ti, 5);
	monitor.Signal_T();
	MC6 = monitor.copyMC();
	monitor.Wait_a();
	a6 = monitor.copy_a();
	monitor.Wait_T();
	T6= monitor.copyT();
	for (int i = 5*PRO6.H; i< 6*PRO6.H; i++ ){
		for (int j = 0; j< PRO6.N; j++ ){
			int w = 0;
			for (int k = 0; k< PRO6.N; k++ ){
				w = w+(MC6[k][j]*PRO6.MZ[i][j]);
			}
			w = w  +a6*PRO6.MT[i][j];
			PRO6.A[i]= PRO6.A[i] + T6[j]*w;
		}
	}
	monitor.Signal_fin();
	System.out.println("T6 finished");
	}
}
