import java.util.Date;

public class Task extends Thread{
	private int H;
	private int N;
	private long T1,T2;
	private BOX Box;
	private int Tid;
	private Matrix MO;
	private Vector B,A;

	public Task(int N, int H, BOX Box, int Tid){
		this.H = H;
		this.N = N;
		this.Box = Box;
		this.Tid = Tid;
	}
	
	public void run(){
		System.out.println("Task"+Tid+" started");		
		// Ввод MO,B и передача в BOX
		if (Tid == 1){			
			MO = new Matrix(N,1);
			B = new Vector(N,1);
			Box.input_MO_B(MO,B);
		} else {
			MO = new Matrix(N);
			B = new Vector(N);
		}		
		// Ввод MZ,MT,MK и передача в BOX
		if (Tid == (int) N/H ){
			Matrix MZ = new Matrix(N,1);
			Matrix MT = new Matrix(N,1);
			Matrix MK = new Matrix(N,1);
			Box.Input_MZ_MT_MK(MZ,MT,MK);
			MZ = null; MT = null; MK = null;
		}
		// Ждать ввода данных в BOX
		Box.waitInput();
		// Скопировать B,MO из BOX
		Box.copy_MO_B(this.MO,this.B);
		// Счёт Ph
		Vector Ph = new Vector(H); 
		for (int i=(Tid-1)*H; i<Tid*H;i++){
			for (int j=0; j<N; j++){
				Ph.setElement(i-(Tid-1)*H,B.getElement(j)*Box.MZ.getElement(i,j)+Ph.getElement(i-(Tid-1)*H));
			}
		}
		B = null;
		// Передать Ph в BOX
		Box.input_Ph(Ph,Tid);
		Ph = null;
		// Ждать счета P в BOX
		Box.waitInput_P();
		// Копировать P в локальную переменную
		Vector P = new Vector(N);
		Box.copy_P(P);
		// Счёт Ah
		Vector Ah = new Vector(H);
		Matrix MX = new Matrix(H,N,true);		
		for (int i=(Tid-1)*H; i<Tid*H; i++){
			for (int j=0; j<N; j++){
				for (int k=0; k<N; k++){					
					MX.setElement(i-(Tid-1)*H,j,(MO.getElement(k,j)*Box.MT.getElement(i,k))+MX.getElement(i-(Tid-1)*H,j));					
				}
			}
		}
		MO = null;
		for (int i=(Tid-1)*H; i<Tid*H;i++){
			for (int j=0; j<N; j++){
				int value = P.getElement(j)*( MX.getElement(i-(Tid-1)*H,j)-Box.MK.getElement(i,j)) + Ah.getElement(i-(Tid-1)*H);
				Ah.setElement(i-(Tid-1)*H,value);
			}
		}
		MX = null;
		// Передать Ah в BOX
		Box.input_Ah(Ah,Tid);
		if (Tid == (int) N/H){
			// Ждать окогчагия счёта Ah
			Box.waitOutput();
			// Вывод А
			A = new Vector(N);
			Box.copy_A(A);			
			for (int i=0; i<N; i++){
				System.out.print(A.getElement(i)+"  ");
			}
			System.out.println();
			Date time = new Date();
			T2 = time.getTime();
			long Tres=T2-T1;
			System.out.println("Time = "+Tres);			
		}		
		System.out.println("Task"+Tid+" finished");
	}
	
	public void setT1(long T1){
		this.T1 = T1;
	}
	
}
