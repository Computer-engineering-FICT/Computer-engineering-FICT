package Lab6;

public class T5 extends Thread {
	int n = Laba6.N;
	int H = Laba6.H;
	int One = 4*H;
	int Two = 5*H;
	int l5;
	int[] B5;
	int[] Z5;
	int[][] MX5;
	int[][] MT5;
	int [] S1= new int [n];
	int [] S2= new int [n];
	int [] S3= new int [n];
	int [][]MB1= new int [n][n];
	int [][]MB2= new int [n][n];
	public T5(String s) {
		this.setName(s);
	}
	/**
	 * Действия при выполнении T1.
	 */
	public void run() {
		System.out.println(this.getName() + " started");
		Laba6.m.WaitInput();
		l5 = Laba6.m.copyl();
		B5 = Laba6.m.copyB();
		Z5 = Laba6.m.copyZ();
		MX5 = Laba6.m.copyMX();
		MT5 = Laba6.m.copyMT();
		Laba6.w.MatrixMnozh(One, Two, MX5, Laba6.MO, MB1);
		Laba6.w.VectorMatrixMnozh(One, Two, B5, MB1, S1);
		Laba6.w.NumbVectorMnozh(One, Two, l5, S1, S2);
		Laba6.w.MatrixMnozh(One, Two, MT5, Laba6.MR, MB2);
		Laba6.w.VectorMatrixMnozh(One, Two, Z5, MB2, S3);
		Laba6.w.VecSlozh(One, Two, S2, S3, Laba6.A);
		Laba6.m.SignalCalc();
		Laba6.m.WaitCalc();
		System.out.println(this.getName() + " finished.");
		System.out.println();
	}//run
}//T1
