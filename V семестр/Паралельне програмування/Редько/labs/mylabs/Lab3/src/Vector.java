

public class Vector {
	
	private int[] array;

	public Vector(int n) {
		array = new int[n];
	}

	public void set(int index, int value) {
		array[index] = value;
	}
	
	public int get(int index) {
		return array[index];
	}
	
	public int size() {
		return array.length;
	}
	
	public String toString() {
		String res = "";
		for (int i = 0; i < array.length; i++){
			res += "   " + array[i];
		}
		res += "\n";
		return res;
	}

}
