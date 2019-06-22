
public class BOX {
	private int N;
	private int H;	
	private Matrix MO;
	private Vector B,A,P;
	private int F1=0, F2=0,F3=0;
	public Matrix MZ,MT,MK;
	
	public BOX(int N, int H){
		this.N = N;
		this.H = H;
		MZ = new Matrix(N);
		MT = new Matrix(N);
		MK = new Matrix(N);
		MO = new Matrix(N);		
		B = new Vector(N);
		A = new Vector(N);
		P = new Vector(N);
	}
	
	synchronized void input_MO_B(Matrix MO, Vector B){
		copyMatrix(this.MO,MO);
		copyVector(this.B,B);		
		F1++;
		if (F1 == 2){
			notifyAll();
		}
	}

	synchronized void input_Ph(Vector Ph, int Tid){		
		for (int i=(Tid-1)*H; i<Tid*H;i++){			
			this.P.setElement(i,Ph.getElement(i-(Tid-1)*H));
		}
		F2++;
		if (F2 == (int) N/H ){ notifyAll(); }
	}
	
	synchronized void input_Ah(Vector Ah, int Tid){
		for (int i=(Tid-1)*H; i<Tid*H;i++){
			this.A.setElement(i,Ah.getElement(i-(Tid-1)*H)); 
		}
		F3++;
		if (F3 == (int) N/H ){ notify(); }
	}
	
	synchronized void copy_P(Vector P){
		copyVector(P,this.P);
	}
	
	synchronized void copy_A(Vector A){
		copyVector(A,this.A);
	}
	
	synchronized void copy_MO_B(Matrix MO, Vector B){
		copyMatrix(MO,this.MO);
		copyVector(B,this.B);
	}
	
	synchronized void waitInput(){
		if (F1!=2){			
			try {
				wait();
			} catch (InterruptedException e) {			
				e.printStackTrace();
			}
		}
	}
	
	synchronized void waitInput_P(){
		if (F2!= (int) N/H ){			
			try {
				wait();
			} catch (InterruptedException e) {			
				e.printStackTrace();
			}
		}
	}
	
	synchronized void waitOutput(){
		if (F3!= (int) N/H ){			
			try {
				wait();
			} catch (InterruptedException e) {			
				e.printStackTrace();
			}
		}
	}
		
	synchronized void Input_MZ_MT_MK(Matrix MZ, Matrix MT, Matrix MK){
		copyMatrix(this.MZ,MZ);
		copyMatrix(this.MT,MT);
		copyMatrix(this.MK,MK);		
		F1++;
		if (F1 == 2){ notifyAll(); }
	}	
	
	public void copyMatrix(Matrix M1, Matrix M2){
		int N = M1.getN();
		int i,j;
		for (i=0; i<N; i++){
			for (j=0; j<N; j++){
				M1.setElement(i,j,M2.getElement(i,j));
			}
		}
	}
	
	public void copyVector(Vector V1, Vector V2){
		int N = V1.getN();
		for (int i=0; i<N; i++){
			V1.setElement(i,V2.getElement(i));
		}
	}
	
}
