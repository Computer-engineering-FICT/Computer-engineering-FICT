//----------class TVector
class TVector extends Object {
	public int len;
	public double element[];
	TVector(int n) {				//constructor TVector
		len = n;
		element = new double[len];
	}// end constructor TVector
	public void show() {					//procedure output Vector
		System.out.print("Vector : \n");
		for (int i=0; i<len; i++) {
			System.out.print(element[i] + "   ");
		}
		System.out.print("\n");
	}// end output Vector
	public void GenerateEquelValue(double x) {			//all elements take equel value = x
		for (int i=0; i<len; i++) {
			element[i] = x;
		}
	}// end GenerateEquelValue
}// end class TVector

//-----------class TMatrix
class TMatrix extends Object {
	public int len;
	public double element[][];
	TMatrix(int n) {				//constructor TMatrix
		len = n;
		element = new double[len][len];
	}// end constructor TMatrix;
	public void show() {					// procedure output Matrix
		System.out.print("Matrix : \n");
		for (int i=0; i<len; i++){
			for (int j=0; j<len; j++) {
				System.out.print(element[i][j] + "   ");
			}
			System.out.print("\n");
		}
		System.out.print("\n");
	}// end output Matrix
	public void GenerateEquelValue(double x) {			//all elements take equel value = x
		for (int i=0; i<len; i++) {
			for (int j=0; j<len; j++) {
				element[i][j] = x;
			}
		}
	}// end GenerateEquelValue
}// end class TMatrix

//------------calss TSemaphore
class TSemaphore extends Object {	//class TSemaphore
	private int value;
	TSemaphore(int x) {			//constructor
		value = x;
	}// end constructor

	public synchronized void WaitValue(int x) {
		try {
			if (value < x) {
				wait();
			}
		} catch ( Exception e ) { System.out.print("\n Error!"); }
	}// end WaitValue
	public synchronized void ReleaseValueAndNotify(int x) {
		try {
			value++;
			if (value >= x) {
				notifyAll();
			}
		} catch ( Exception e ) { System.out.print("\n Error!"); }
	}// end ReleaseValue
}// end TSemaphore

//----------- class TData
class TData extends Object {		// class contain data
	public int n = 1000;
	public int p = 4;
	public int H = (int) n / p ;
	public TMatrix MR = new TMatrix(n);
	public TMatrix MT = new TMatrix(n);
	public TMatrix MF = new TMatrix(n);
	public TVector Y = new TVector(n);
	private double a = 1.7e+308;
	private TVector R = new TVector(n);
	private TVector B = new TVector(n);
	private TVector X = new TVector(n);
	public TSemaphore SemInput = new TSemaphore(0) ;
	public TSemaphore SemCalc = new TSemaphore(0) ;
	public TSemaphore SemOutput = new TSemaphore(0) ;
	public TSemaphore SemForX = new TSemaphore(0);
	public synchronized void SetB(TVector Vec) {
		for (int i=0; i<n; i++) {
			B.element[i] = Vec.element[i];
		}
	}
	public synchronized void SetR(TVector Vec) {
		for (int i=0; i<n; i++) {
			R.element[i] = Vec.element[i];
		}
	}
	public synchronized void SetX(TVector Vec) {
		for (int i=0; i<n; i++) {
			X.element[i] = Vec.element[i];
		}
	}
	public synchronized void CopyVectorB(TVector Vec) {
		for (int i=0; i<n; i++) {
			Vec.element[i] = B.element[i];
		}
	}
	public synchronized void CopyVectorX(TVector Vec) {
		for (int i=0; i<n; i++) {
			Vec.element[i] = X.element[i];
		}
	}
	public synchronized void CopyVectorR(TVector Vec) {
		for (int i=0; i<n; i++) {
			Vec.element[i] = R.element[i];
		}
	}
	public synchronized void CalcMin(double x) {
		if (a > x) {
			a = x;
		}
	}
	public synchronized double Geta() {
		return a;
	}
}// end class Data

//***********************************************************************
//				TASK CLASS
//***********************************************************************
class TTask extends Thread {
	private double Ymin = 1.7e+308;
	private int ID;
	private TVector OR1;
	private TVector OR2;
	private TVector OR3;
	private double sum1;
	private double sum2;
	TData D;		// point on class TData
	TTask (TData PointData, int Tid) {	// constructor TTask
		D = PointData;
		ID = Tid;
	}// end constructor TTask
	public void run() {
		System.out.print(" -> Task " + (ID) + " Started... \n");
//		BufferedOutputStream();
// Input variables
		if (ID == 0) {
			D.MR.GenerateEquelValue(1);
		}
		if (ID == 1) {
			D.Y.GenerateEquelValue(1);
			D.SetR(D.Y);
			D.Y.GenerateEquelValue(1);
			D.SetB(D.Y);
		}
		if (ID == 2) {
			D.MT.GenerateEquelValue(1);
		}
		if (ID == 3) {
			D.MF.GenerateEquelValue(1);
		}
// end input variables
		D.SemInput.ReleaseValueAndNotify(4);
		D.SemInput.WaitValue(4);
		OR1 = new TVector(D.n);		
		D.CopyVectorB(OR1);

		for (int i=(ID)*D.H; i<((ID+1)*D.H); i++ )  {
			D.Y.element[i] = 0;
			for (int j=0; j<D.n; j++ ) {
				D.Y.element[i] += OR1.element[j] * D.MR.element[i][j];
			}
		}
	
		D.SemCalc.ReleaseValueAndNotify(4);
		D.SemCalc.WaitValue(4);
		if (ID == 0) {
			D.SetX(D.Y);
			D.SemForX.ReleaseValueAndNotify(1);
		} else {
			D.SemForX.WaitValue(1);
		}
		OR2 = new TVector(D.n);
		OR3 = new TVector(D.n);
		D.CopyVectorX(OR2);
		D.CopyVectorR(OR3);
		
		for (int i = (ID * D.H); i< ((ID + 1) * D.H); i++) {
			sum1 = 0;
			sum2 = 0;
			for (int j=0; j<D.n; j++) {
				sum1 += OR2.element[j] * D.MR.element[i][j];
				sum2 += OR3.element[j] * D.MF.element[i][j];
			}
			if (Ymin > sum1 - sum2) {
				Ymin = sum1 - sum2;
			}
		}
		
		D.CalcMin(Ymin);

		if (ID == 0 ) {
			D.SemOutput.WaitValue(3);
			System.out.print("\n a = " + D.Geta() + " \n");
		} else {
			D.SemOutput.ReleaseValueAndNotify(3);
		}
		System.out.print(" -> Task " + (ID) + " Ended! \n");
	}// end run
}// end TTask

//***********************************************************************
//				MAIN CLASS
//***********************************************************************
class sfr_pp4 extends Object {
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
	}// end RunTasks

	static public void main(String args[]) {		//main program
		RunTasks();
	}// end main program
}// end class sfr_pp4