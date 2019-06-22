package Lab6;

public class T2 extends Thread {
	int n = Laba6.N;
	int H = Laba6.H;
	int One = 1*H;
	int Two = 2*H;
	int l2;
	int[] B2;
	int[] Z2;
	int[][] MX2;
	int[][] MT2;
	int [] S1= new int [n];
	int [] S2= new int [n];
	int [] S3= new int [n];
	int [][]MB1= new int [n][n];
	int [][]MB2= new int [n][n];
	public T2(String s) {
		this.setName(s);
	}
	/**
	 * Действия при выполнении T1.
	 */
	public void run() {
		System.out.println(this.getName() + " started");
		Laba6.MO = Laba6.w.MatrixInput();
		Laba6.MR = Laba6.w.MatrixInput();
		Laba6.m.SignalInput();
		Laba6.m.WaitInput();
		l2 = Laba6.m.copyl();
		B2 = Laba6.m.copyB();
		Z2 = Laba6.m.copyZ();
		MX2 = Laba6.m.copyMX();
		MT2 = Laba6.m.copyMT();
		Laba6.w.MatrixMnozh(One, Two, MX2, Laba6.MO, MB1);
		Laba6.w.VectorMatrixMnozh(One, Two, B2, MB1, S1);
		Laba6.w.NumbVectorMnozh(One, Two, l2, S1, S2);
		Laba6.w.MatrixMnozh(One, Two, MT2, Laba6.MR, MB2);
		Laba6.w.VectorMatrixMnozh(One, Two, Z2, MB2, S3);
		Laba6.w.VecSlozh(One, Two, S2, S3, Laba6.A);
		Laba6.m.SignalCalc();
		Laba6.m.WaitCalc();
		System.out.println(this.getName() + " finished.");
		System.out.println();
	}//run
}