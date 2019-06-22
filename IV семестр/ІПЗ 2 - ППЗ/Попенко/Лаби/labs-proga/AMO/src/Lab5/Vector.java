package Lab5;

import java.util.Arrays;
public class Vector {
	private double[] vector;
	private int length;
	
	public Vector(double[] vector) {
		this.vector = vector;
		length = vector.length;
	}
	public double getElement(int index) {
		return vector[index];
	}
	public void setElement(int index, double val) {
		vector[index] = val;
	}
	public Vector setAll(Double val) {
		Arrays.fill(vector, val);
		return this;
	}
	public int getLength() {
		return length;
	}
	public void swap(int v1, int v2) {
		double c = vector[v1];
		vector[v1] = vector[v2];
		vector[v2] = c;
	}
	public void add(int v1, int v2, double k) {
		vector[v1] += vector[v2] * k;
	}
	public void multiply(int v, double m) {
		vector[v] *= m;
	}
	@Override
	public String toString() {
		return Arrays.toString(vector);
	}
	public Vector copyOf() {
		return new Vector(Arrays.copyOf(vector, length));
	}
	
	public double []  getVector (){
		return Arrays.copyOf(vector, length);
	}
	
}

