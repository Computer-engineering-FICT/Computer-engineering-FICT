package Lab6;

public class T4 extends Thread {
	int n = Laba6.N;
	int H = Laba6.H;
	int One = 3*H;
	int Two = 4*H;
	int l4;
	int[] B4;
	int[] Z4;
	int[][] MX4;
	int[][] MT4;
	int [] S1= new int [n];
	int [] S2= new int [n];
	int [] S3= new int [n];
	int [][]MB1= new int [n][n];
	int [][]MB2= new int [n][n];
	public T4(String s) {
		this.setName(s);
	}
	/**
	 * Действия при выполнении T1.
	 */
	public void run() {
		System.out.println(this.getName() + " started");
		Laba6.m.WaitInput();
		l4 = Laba6.m.copyl();
		B4 = Laba6.m.copyB();
		Z4 = Laba6.m.copyZ();
		MX4 = Laba6.m.copyMX();
		MT4 = Laba6.m.copyMT();
		Laba6.w.MatrixMnozh(One, Two, MX4, Laba6.MO, MB1);
		Laba6.w.VectorMatrixMnozh(One, Two, B4, MB1, S1);
		Laba6.w.NumbVectorMnozh(One, Two, l4, S1, S2);
		Laba6.w.MatrixMnozh(One, Two, MT4, Laba6.MR, MB2);
		Laba6.w.VectorMatrixMnozh(One, Two, Z4, MB2, S3);
		Laba6.w.VecSlozh(One, Two, S2, S3, Laba6.A);
		Laba6.m.SignalCalc();
		Laba6.m.WaitCalc();
		System.out.println(this.getName() + " finished.");
		System.out.println();
	}//run
}//T1
