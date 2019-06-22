//	MAIN CLASS
class kyk_kr extends Object {
	static TData Data = new TData();
	static TTask Task[];
	static void RunTasks() {
		Task = new TTask[Data.p];
		for (int i=0; i<Data.p; i++) {
			Task[i] = new TTask(Data, i);
		}
		for (int i=0; i<Data.p; i++) {
			Task[i].start();
		}
	}

	static public void main(String args[]) {	
		RunTasks();
	}
}// end class kyk_kr

//----------class TVector
class TVector extends Object {
	public int len;
	public double element[];
	TVector(int n) {				
		len = n;
		element = new double[len];
	}
	public void output() {					
		System.out.print("Vector : \n");
		for (int i=0; i<len; i++) {
			System.out.print(element[i] + "   ");
		}
		System.out.print("\n");
	}
	public void GenerateValues(double x) {			
		for (int i=0; i<len; i++) {
			element[i] = x;
		}
	}
}// end class TVector

//-----------class TMatrix
class TMatrix extends Object {
	public int len;
	public double element[][];
	TMatrix(int n) {				
		len = n;
		element = new double[len][len];
	}
	
	public void output() {					
		System.out.print("Matrix : \n");
		for (int i=0; i<len; i++){
			for (int j=0; j<len; j++) {
				System.out.print(element[i][j] + "   ");
			}
			System.out.print("\n");
		}
		System.out.print("\n");
	}
	public void GenerateValues(double x) {			
		for (int i=0; i<len; i++) {
			for (int j=0; j<len; j++) {
				element[i][j] = x;
			}
		}
	}
}// end class TMatrix

//------------class TSemaphore
class TSemaphore extends Object {	
	private int value;
	TSemaphore(int x) {			
		value = x;
	}

	public synchronized void WaitValue(int x) {
		try {
			if (value < x) {
				wait();
			}
		} catch ( Exception e ) { System.out.print("\n Error!"); }
	}
	public synchronized void ReleaseValueAndNotify(int x) {
		try {
			value++;
			if (value >= x) {
				notifyAll();
			}
		} catch ( Exception e ) { System.out.print("\n Error!"); }
	}
}// end TSemaphore

//----------- class TData
class TData extends Object {		// data class
	public int n = 160;
	public int p = 4;
	public int H = (int) n / p ;
	public TMatrix MB = new TMatrix(n);
	public TMatrix MX = new TMatrix(n);
	public TMatrix MY = new TMatrix(n);		
	public TVector Z = new TVector(n);
        public TVector Y = new TVector(n);
	private TVector A = new TVector(n);
	private TVector X = new TVector(n);
        private TVector B = new TVector(n);
	public long TimeStart;
	public long TimeFinish;
	public TSemaphore SemInput = new TSemaphore(0) ;
	public TSemaphore SemOutput = new TSemaphore(0) ;
	public TSemaphore SemCalcOne = new TSemaphore(0) ;
	public TSemaphore SemCalcTwo = new TSemaphore(0) ;	
	public TSemaphore SemWaitX = new TSemaphore(0);
	public TSemaphore SemWaitB = new TSemaphore(0);	

	public synchronized void FormA(TVector Vec) {
		for (int i=0; i<n; i++) {
			A.element[i] = Vec.element[i];
		}
	}
	
	public synchronized void FormX(TVector Vec) {
		for (int i=0; i<n; i++) {
			X.element[i] = Vec.element[i];
		}
	}
	public synchronized void FormB(TVector Vec) {
		for (int i=0; i<n; i++) {
			B.element[i] = Vec.element[i];
		}
	}
	public synchronized void CopyA(TVector Vec) {
		for (int i=0; i<n; i++) {
			Vec.element[i] = A.element[i];
		}
	}
	public synchronized void CopyX(TVector Vec) {
		for (int i=0; i<n; i++) {
			Vec.element[i] = X.element[i];
		}
	}
	public synchronized void CopyB(TVector Vec) {
		for (int i=0; i<n; i++) {
			Vec.element[i] = B.element[i];
		}
	}
	
}// end class Data

//	TASK CLASS
class TTask extends Thread {
	private int ID;
	private TVector At;
	private TVector Xt;
	private TVector Bt;
	TData D;		// point on class TData
	TTask (TData PointData, int Tid) {	
		D = PointData;
		ID = Tid;
	}
	public void run() {
		System.out.print(" -> Task " + (ID) + " Started... \n");
                D.TimeStart = System.currentTimeMillis();
// Input data
		if (ID == 0) {
			
			D.MB.GenerateValues(1);
			D.MX.GenerateValues(1);
			D.SemInput.ReleaseValueAndNotify(2);
		}
		
		if (ID == D.p-1) {			
                        D.Y.GenerateValues(1);
			D.FormA(D.Y);
			D.MY.GenerateValues(1);
			D.SemInput.ReleaseValueAndNotify(2);
		}
// end input data
		D.SemInput.WaitValue(2);
		At = new TVector(D.n);
		D.CopyA(At); 
                for (int i=(ID)*D.H; i<((ID+1)*D.H); i++ )  {
			D.Y.element[i] = 0; 
			for (int j=0; j<D.n; j++ ) {
				D.Y.element[i] += At.element[j] * D.MB.element[i][j];
					}
		}
	        D.SemCalcOne.ReleaseValueAndNotify(D.p);
		D.SemCalcOne.WaitValue(D.p);
		if (ID == 0) {
			D.FormX(D.Y);
			D.SemWaitX.ReleaseValueAndNotify(1);
		} else {
			D.SemWaitX.WaitValue(1);
		}  
		Xt = new TVector(D.n); 
		D.CopyX(Xt); 
		for (int i=(ID)*D.H; i<((ID+1)*D.H); i++ )  {
			D.Y.element[i] = 0;
			for (int j=0; j<D.n; j++ ) {
				D.Y.element[i] += Xt.element[j] * D.MX.element[i][j];
			}
		}
		D.SemCalcTwo.ReleaseValueAndNotify(D.p);
		D.SemCalcTwo.WaitValue(D.p); 
		if (ID == 0) {
			D.FormB(D.Y);
			D.SemWaitB.ReleaseValueAndNotify(1);
		} else {
			D.SemWaitB.WaitValue(1);
		}
		Bt = new TVector(D.n); 
		D.CopyB(Bt);
		for (int i=(ID)*D.H; i<((ID+1)*D.H); i++ )  {
			D.Z.element[i] = 0;
			for (int j=0; j<D.n; j++ ) {
				D.Z.element[i] += Bt.element[j] * D.MY.element[i][j];
			}
		}		
                if (ID == 0 ) {
			D.SemOutput.WaitValue(D.p-1);
                        D.TimeFinish = System.currentTimeMillis();
			D.TimeFinish -= D.TimeStart;
			System.out.print("\n The total time  is " + D.TimeFinish + " ms \n");
		
		} else {
			D.SemOutput.ReleaseValueAndNotify(D.p-1);
		}
		System.out.print(" -> Task " + (ID) + " Ended! \n");
		
	}// end run
}// end TTask










