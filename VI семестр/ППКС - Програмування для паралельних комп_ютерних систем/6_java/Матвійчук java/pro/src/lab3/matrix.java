package lab3;

public class matrix {
	/**
	 * матриця int
	 */
	private int[][] arr;
	/**
	 * розмір матриці mas[n][m]
	 */
	private int n;
	/**
	 * розмір матриці mas[n][m]
	 */
	private int m;
	/**
	 * @param n розмір матриці mas[n][m]
	 * @param m розмір матриці mas[n][m]
	 */
	public matrix(int n, int m) {
		arr = new int [n][m];
		this.n=n;
		this.m=m;
	}
	/** задає значення вказаной перемінной
	 * @param n номер позиції  mas[n][m]
	 * @param m номер позиції  mas[n][m]
	 * @param val перемінна int
	 */
	public void set(int n, int m, int val) {
		arr[n][m]=val;
	}
	/**
	 *  заповнює матрицю 1
	 */
	public void set1() {
		for (int i=0;i<n;i++){
			for (int j=0;j<m-1;j++){
				arr[i][j]=1;
			}
		}
	}
	/** вертає перемінну 
	 * @param index n номер позиції перемінной  mas[n][m]
	 * @param index m номер позиції перемінной  mas[n][m]
	 * @return int
	 */
	public int get(int a, int b) {
		return arr[a][b];
	}
	
	/** розмір матриці
	 * @return int
	 */
	public int getSize() {
		return arr.length;
	}
	
	/** формування строкі 
	 * @return String
	 */
	public String toString() {
		String res = "";
		for (int i=0;i<n;i++){
			for (int j=0;j<m;j++){
				res+=Integer.toString(arr[n][m]);
			}
			res+='\n';
		}
		return res;
	}
}
