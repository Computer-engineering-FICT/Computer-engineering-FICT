package lab3;

public class matrix {
	/**
	 * ������� int
	 */
	private int[][] arr;
	/**
	 * ����� ������� mas[n][m]
	 */
	private int n;
	/**
	 * ����� ������� mas[n][m]
	 */
	private int m;
	/**
	 * @param n ����� ������� mas[n][m]
	 * @param m ����� ������� mas[n][m]
	 */
	public matrix(int n, int m) {
		arr = new int [n][m];
		this.n=n;
		this.m=m;
	}
	/** ���� �������� �������� ���������
	 * @param n ����� �������  mas[n][m]
	 * @param m ����� �������  mas[n][m]
	 * @param val �������� int
	 */
	public void set(int n, int m, int val) {
		arr[n][m]=val;
	}
	/**
	 *  �������� ������� 1
	 */
	public void set1() {
		for (int i=0;i<n;i++){
			for (int j=0;j<m-1;j++){
				arr[i][j]=1;
			}
		}
	}
	/** ����� �������� 
	 * @param index n ����� ������� ���������  mas[n][m]
	 * @param index m ����� ������� ���������  mas[n][m]
	 * @return int
	 */
	public int get(int a, int b) {
		return arr[a][b];
	}
	
	/** ����� �������
	 * @return int
	 */
	public int getSize() {
		return arr.length;
	}
	
	/** ���������� ����� 
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
