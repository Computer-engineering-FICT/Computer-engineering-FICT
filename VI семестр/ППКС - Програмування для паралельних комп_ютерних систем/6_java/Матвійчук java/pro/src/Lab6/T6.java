package Lab6;

public class T6 extends Thread {
	int n = Laba6.N;
	int H = Laba6.H;
	int One = 5*H;
	int Two = 6*H;
	int l6;
	int[] B6;
	int[] Z6;
	int[][] MX6;
	int[][] MT6;
	int [] S1= new int [n];
	int [] S2= new int [n];
	int [] S3= new int [n];
	int [][]MB1= new int [n][n];
	int [][]MB2= new int [n][n];
	public T6(String s) {
		this.setName(s);
	}
	/**
	 * Действия при выполнении T1.
	 */
	public void run() {
		System.out.println(this.getName() + " started");
		Laba6.lo = 1;
		Laba6.Bo = Laba6.w.VectorInput();
		Laba6.Zo = Laba6.w.VectorInput();
		Laba6.m.setB(Laba6.Bo);
		Laba6.m.setZ(Laba6.Zo);
		Laba6.m.setl(Laba6.lo);
		Laba6.m.SignalInput();
		Laba6.m.WaitInput();
		l6 = Laba6.m.copyl();
		B6 = Laba6.m.copyB();
		Z6 = Laba6.m.copyZ();
		MX6 = Laba6.m.copyMX();
		MT6 = Laba6.m.copyMT();
		Laba6.w.MatrixMnozh(One, Two, MX6, Laba6.MO, MB1);
		Laba6.w.VectorMatrixMnozh(One, Two, B6, MB1, S1);
		Laba6.w.NumbVectorMnozh(One, Two, l6, S1, S2);
		Laba6.w.MatrixMnozh(One, Two, MT6, Laba6.MR, MB2);
		Laba6.w.VectorMatrixMnozh(One, Two, Z6, MB2, S3);
		Laba6.w.VecSlozh(One, Two, S2, S3, Laba6.A);
		Laba6.m.SignalCalc();
		Laba6.m.WaitCalc();
		Laba6.w.VectorOutput(Laba6.A);
		System.out.println(this.getName() + " finished.");
		System.out.println();
	}//run
}//T1
