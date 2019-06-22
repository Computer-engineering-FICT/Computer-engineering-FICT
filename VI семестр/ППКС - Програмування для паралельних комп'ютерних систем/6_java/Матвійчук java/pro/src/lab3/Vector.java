package lab3;

/** реалізує функції для вектора
 * @author Матвійчук Богдан группа ІО-91 
 * 
 */
public class Vector {
	/**
	 * вектор int
	 */
	private int[] arr;

	/**
	 * @param n розмір вектора
	 */
	public Vector(int n) {
		arr = new int[n];
	}
	/**
	 *  заповнює вектор 1
	 */
	public void set1() {
		for (int i=0;i<arr.length;i++){
			arr[i]=1;
		}
	}
	/** задає значення вказаной перемінной
	 * @param index номер позиції int
	 * @param val перемінна int
	 */
	public void set(int index, int val) {
		arr[index] = val;
	}
	/** вертає перемінну 
	 * @param index номер позиції перемінной int
	 * @return int
	 */
	public int get(int index) {
		return arr[index];
	}
	/** розмір вектора
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
		for (int i = 0; i < arr.length; i++){ 
			res += " " + arr[i];}
		return res;
	}
}

