import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * 
 * Class with matrix and vector operations
 *
 */
public class Data {
	
	private int n;
	private int value;
	
	protected Data (int n, int value) {
		this.setN(n);
		this.setValue(value);
	}
	
	protected Vector inputVector() {
		Vector vector = new Vector(n); 
		for(int i = 0; i < n; i++) {
			vector.set(i, value);
		}
		return vector;
	}
	
	protected Matrix inputMatrix() {
		Matrix matrix = new Matrix(n);
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++) {
				matrix.set(i, j, value);	
			}
		}
		return matrix;
	}
	
	protected void outputVector(Vector vector, File file) {
		if(vector.size() < 5) {
			System.out.print(vector.toString());
		}
		else {
			try {
				this.save(file, vector.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	protected void outputMatrix(Matrix matrix, File file) {
		if(matrix.size() < 5) {
			System.out.print(matrix.toString());
		}
		else {
			try {
				this.save(file, matrix.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	protected void setN(int n) {
		try {
			if(n < 0)
				throw new Exception("Positive Number Required");
			this.n = n;
		}
		catch(Exception e) {
		    System.out.println("Error: " + e.getMessage());
		}
	}

	protected int getValue() {
		return value;
	}

	protected void setValue(int value) {
		this.value = value;
	}
	
	
	protected static Vector add(final Vector left, final Vector right) {
		Vector result = new Vector(left.size());
		for(int i = 0; i < result.size(); i++) {
			result.set(i, left.get(i) + right.get(i));
		}
		return result;
	}
	
	
	protected static Vector mult(final Vector left, final Matrix right) {
		Vector result = new Vector(left.size());
		for (int i = 0; i < left.size(); i++) {
			result.set(i, 0);
			for (int j = 0; j < left.size(); j++) {
				result.set(i, result.get(i) + left.get(j) * right.get(j, i));
			}
		}
		return result;
	}
	
	protected static Matrix mult(final Matrix left, final Matrix right) {
		Matrix result = new Matrix(left.size());
		for (int i = 0; i < left.size(); i++) {
			for (int j = 0; j < left.size(); j++) {
				result.set(i, j, 0);
				for (int y = 0; y < left.size(); y++) {
					result.set(i, j, result.get(i, j) + left.get(i, y)
							* right.get(y, j));
				}
			}
		}
		return result;
	}

	
	private void save(File file, final String data) 
			throws IOException {
		PrintWriter pw = new PrintWriter(new BufferedWriter(
				new FileWriter(file)));
			pw.println(data);
		pw.close();
	}


}
