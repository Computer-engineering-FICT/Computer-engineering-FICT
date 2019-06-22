public class lab2 {

	public static void main(String[] args) {
		long A[][] = { { 5, 4, 5 }, { 4, 5, 6 } };
		long B[][] = { { 1, 2, 4 }, { 5, 6, 6 } };
		if (A.length == B.length && A[0].length == B[0].length) {
			long C[][] = new long[A.length][A[0].length];
			double newC[] = new double[C.length];
			for (int i = 0; i < A.length; i++) {
				for (int j = 0; j < A[i].length; j++) {
					C[i][j] = A[i][j] ^ B[i][j];
				}
			}
			System.out.println("Matrix C:");
			for (int i = 0; i < C.length; i++) {
				for (int j = 0; j < C[i].length; j++) {
					System.out.print(C[i][j] + " ");
				}
				System.out.println();
			}
			for (int i = 0; i < A.length; i++) {
				int j = 0;
				for (j = 0; j < A[i].length; j++) {
					newC[i] = C[i][j] + newC[i];
				}
				newC[i] = newC[i] / j;
			}
			System.out.println("Matrix newC:");
			for (int i = 0; i < newC.length; i++) {
				System.out.println(newC[i]);
			}
		} else {
			System.out.println("Dimension of the matrix is not the same.");
		}
	}
}
