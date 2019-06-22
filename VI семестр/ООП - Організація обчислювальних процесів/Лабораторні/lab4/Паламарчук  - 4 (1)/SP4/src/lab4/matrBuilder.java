package lab4;

import java.util.ArrayList;
import java.util.Random;

public class matrBuilder {
	private int[][] matrix;
	private int size;
	private ArrayList<Double> percent = new ArrayList<Double>();
	private ArrayList<Double> probability = new ArrayList<Double>();

	public matrBuilder(int size) {
		this.size = size;
	}

	public void generateMatrix(double perc) {
		matrix = new int[size][size];
		if (perc < 1) {
			double part = size * size * perc;
			int count = (int) part;
			if ((part - count) >= 0.5)
				count++;
			Random r = new Random();
			int row;
			int column;
			while (count > 0) {
				row = r.nextInt(size);
				column = r.nextInt(size);
				if (matrix[row][column] == 0) {
					matrix[row][column] = 1;
					count--;
				}
			}
		} else {
			for (int i = 0; i < size; i++)
				for (int j = 0; j < size; j++)
					matrix[i][j] = 1;
		}
	}

	public int checkMatrix() {
		int sum;
		double rand = Math.random();
		if (rand < 0.5)
			for (int i = 0; i < size; i++) {
				sum = 0;
				for (int j = 0; j < size; j++) {
					sum += matrix[i][j];
				}
				if (sum == 1)
					return 1;
			}
		for (int i = 0; i < size; i++) {
			sum = 0;
			for (int j = 0; j < size; j++) {
				sum += matrix[j][i];
			}
			if (sum == 1)
				return 1;
		}
		return 0;
	}

	public void run() {
		double perc = 0.01;
		int count = 100;
		double sum;
		while (perc <= 1.0001) {
			sum = 0;
			for (int i = 0; i < count; i++) {
				generateMatrix(perc);
				sum += checkMatrix();
			}
			percent.add(perc);
			probability.add(sum / count);
			if (perc == 0.01)
				perc = 0.05;
			else
				perc += 0.05;
		}
	}

	public ArrayList<Double> getPercent() {
		return percent;
	}

	public ArrayList<Double> getProbability() {
		return probability;
	}
}
