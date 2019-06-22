package Lab6;

public class T3 extends Thread {
	int n = Laba6.N;
	int H = Laba6.H;
	int One = 2*H;
	int Two = 3*H;
	int l3;
	int[] B3;
	int[] Z3;
	int[][] MX3;
	int[][] MT3;
	int [] S1= new int [n];
	int [] S2= new int [n];
	int [] S3= new int [n];
	int [][]MB1= new int [n][n];
	int [][]MB2= new int [n][n];
	public T3(String s) {
		this.setName(s);
	}
	/**
	 * Действия при выполнении T1.
	 */
	public void run() {
		System.out.println(this.getName() + " started");
		Laba6.m.WaitInput();
		l3 = Laba6.m.copyl();
		B3 = Laba6.m.copyB();
		Z3 = Laba6.m.copyZ();
		MX3 = Laba6.m.copyMX();
		MT3 = Laba6.m.copyMT();
		Laba6.w.MatrixMnozh(One, Two, MX3, Laba6.MO, MB1);
		Laba6.w.VectorMatrixMnozh(One, Two, B3, MB1, S1);
		Laba6.w.NumbVectorMnozh(One, Two, l3, S1, S2);
		Laba6.w.MatrixMnozh(One, Two, MT3, Laba6.MR, MB2);
		Laba6.w.VectorMatrixMnozh(One, Two, Z3, MB2, S3);
		Laba6.w.VecSlozh(One, Two, S2, S3, Laba6.A);
		Laba6.m.SignalCalc();
		Laba6.m.WaitCalc();
		System.out.println(this.getName() + " finished.");
		System.out.println();
	}//run
}//T1
