package Lab5;

import java.io.*;

public class SolveSLAR  {
	private double slar [][];
	private double solve[];
	private double solution[];
	
	
	public double[][] getMatr(){
		return slar;
	}
	
	public double[] getSolve(){
		return solve;
	}
	/**
	 * Метод зчитує матрицю СЛАР з файлу,
	 * попередньо зчитавши розмір її з файлу
	 */
	public void reader () throws Exception {
		BufferedReader readerForLines = new BufferedReader(new InputStreamReader(
				new FileInputStream("c:\\lab.txt")));
		String vector [];
		int size = Integer.parseInt(readerForLines.readLine());
		slar = new double [size][size];
		solve = new double[size];
		solution = new double[size];
		solve[0] = 1.0;
		for (int i = 0; i < size; i++) {
			vector = readerForLines.readLine().split(" ");
			for (int j = 0; j < vector.length; j++) {
				slar[i][j] = Double.parseDouble(vector[j]);
			}
		}
		vector = readerForLines.readLine().split(" ");
		for (int j = 0; j < vector.length; j++) {
			solve[j] = Double.parseDouble(vector[j]);
		}
		readerForLines.close();
	}
	/**
	 * Приведення матриці до трикутного вигляду
	 */
	private void triangle(){
		double koef;
		int intel = 0;
		for (int i = 0; i < slar.length; i++) {
			for (int j = i + 1; j < slar.length; j++) {
				koef = slar[j][intel]/slar[i][intel];
				for (int j2 = 0; j2 < slar.length; j2++) {
					slar[j][j2] = -slar[i][j2]*koef + slar[j][j2];
				}
				solve[j] = -solve[i]*koef + solve[j]; 
			}
			intel++;
		}
	}
	
	public String readcount(){
		return Gaus(this.slar, this.solve);
	}
	
	/**
	 * Метод гауса.
	 */
	public String Gaus(double slar[][], double solve[]){
		StringBuffer result = new StringBuffer("<html>");
		this.slar = slar;
		this.solve = solve;
		this.solution = new double [slar.length];
		triangle();
		double sum;
		for (int i = slar.length - 1; i >= 0; i--) {
			sum = solve[i];
			for (int j = i + 1; j < slar.length; j++) {
				sum = sum - slar[i][j]*solution[j];
			}
			solution[i] = sum/slar[i][i];
		}
		result.append("Корені:");
		for (int i = 0; i < solution.length; i++) {
			result.append("<br>Х" + (i + 1) + " = " + solution[i]);
		}
		return result.toString();
	}

		

	

}

