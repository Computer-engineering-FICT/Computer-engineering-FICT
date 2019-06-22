package lab3;

/** ������ ������� ��� �������
 * @author �������� ������ ������ ��-91 
 * 
 */
public class Vector {
	/**
	 * ������ int
	 */
	private int[] arr;

	/**
	 * @param n ����� �������
	 */
	public Vector(int n) {
		arr = new int[n];
	}
	/**
	 *  �������� ������ 1
	 */
	public void set1() {
		for (int i=0;i<arr.length;i++){
			arr[i]=1;
		}
	}
	/** ���� �������� �������� ���������
	 * @param index ����� ������� int
	 * @param val �������� int
	 */
	public void set(int index, int val) {
		arr[index] = val;
	}
	/** ����� �������� 
	 * @param index ����� ������� ��������� int
	 * @return int
	 */
	public int get(int index) {
		return arr[index];
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
		for (int i = 0; i < arr.length; i++){ 
			res += " " + arr[i];}
		return res;
	}
}

