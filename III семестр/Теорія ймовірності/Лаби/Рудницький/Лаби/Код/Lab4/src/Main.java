import java.util.*;

public class Main {
	public static double[] getTablePropabilities(int[] numbers, double[] propabilities) {
		double[] returned = new double[numbers[numbers.length - 1]*numbers[numbers.length - 1]];
		for (int i = 0; i < numbers.length; i++) {
			for (int j = 0; j < numbers.length; j++) {
				returned[numbers[i]*numbers[j] - 1] += propabilities[i]*propabilities[j];
			}
		}
		return returned;
	}
	
	public static int[] getSequence(int[] numbers, double[] propabilities, int size) {
		double[] prop = new double[propabilities.length];
		prop[0] = propabilities[0];
		for (int i = 1; i < propabilities.length; i++) {
			prop[i] = prop[i - 1] + propabilities[i];
		}
		int[] returned = new int[size];
		Random random = new Random(); 
		double temp;
		int j;
		for (int i = 0; i < size; i++) {
			temp = random.nextDouble();
			j = 0;
			while (temp > prop[j]) {
				j++;
			}
			returned[i] = numbers[j];
			temp = random.nextDouble();
			j = 0;
			while (temp > prop[j]) {
				j++;
			}
			returned[i] *= numbers[j];
		}
		return returned;
	}
	
	public static int[] getIntervals(int[] sequence, int intervalsCount) {
		int[] returned = new int[intervalsCount + 1];
		int intervalsSize = sequence.length/intervalsCount;
		int j;
		int k;
		for (int i = 1; i < intervalsCount; i++) {
			j = intervalsSize*i;
			while ((sequence[j] == sequence[j - 1]) && j < sequence.length) {
				j++;
			}
			k = intervalsSize*i;
			while ((sequence[k] == sequence[k - 1]) && k > 1) {
				k--;
			}	
			if (j - intervalsSize*i < intervalsSize*i - k) {
				returned[i] = j;
			} else {
				if (returned[i - 1] == k) {
					returned[i] = j;
				} else {
					returned[i] = k;
				}
			}
		}
		returned[intervalsCount] = sequence.length;
		return returned;
	}
	
	public static double getPropability(int[] sequence, double[] tablePropabilities) {
		Map<Integer, Double[]> map = new HashMap<Integer, Double[]>();
		Double[] two = { 0.02, 0.04, 0.103, 0.211, 0.446, 0.713, 1.386, 2.41, 3.22, 4.6, 5.99 };
		map.put(2, two);
		Double[] nine = { 2.09, 2.53, 3.32, 4.17, 5.38, 6.39, 8.34, 10.66, 12.24, 14.68, 16.92 };
		map.put(9, nine);
		double[] g = { 0.01, 0.02, 0.05, 0.1, 0.2, 0.3, 0.5, 0.7, 0.8, 0.9, 0.95 };
		int intervalsCount;
		if (sequence.length <= 20) {
			intervalsCount = 3;
		} else {
			intervalsCount = 10;
		}
		int[] intervals = Main.getIntervals(sequence, intervalsCount);
		int[] intervalsSize = new int[intervals.length - 1];
		for (int i = 0; i < intervalsSize.length; i++) {
			intervalsSize[i] = intervals[i + 1] - intervals[i];
		}
		double[] intervalsProbabilities = new double[intervals.length - 1];
		for (int i = 0; i < sequence[intervals[1]] - 1; i++) {
			intervalsProbabilities[0] += tablePropabilities[i];
		}
		for (int i = 1; i < intervalsProbabilities.length - 1; i++) {
			for (int j = sequence[intervals[i]] - 1; j < sequence[intervals[i + 1]] - 1; j++) {
				intervalsProbabilities[i] += tablePropabilities[j];
			}
		}
		for (int i = sequence[intervals[intervalsProbabilities.length - 1]] - 1; i < tablePropabilities.length; i++) {
			intervalsProbabilities[intervalsProbabilities.length - 1] += tablePropabilities[i];
		}
		double xi = 0;
		for (int i = 0; i < intervalsSize.length; i++) {
			xi += Math.pow((intervalsSize[i] - sequence.length*intervalsProbabilities[i]), 2)/(intervalsProbabilities[i]*sequence.length);
		}
		Double[] tableXi = map.get(intervalsCount - 1);
		int j = 0;
		for (int i = 0; i < 11; i++) {
			j = 0;
			while ((xi > tableXi[j]) && j != 10) {
				j++;
			}
		}
		double returned = 1 - g[j];
		return returned;
	}
	
	public static void main(String[] args) {
		int size = 1000;
		int[] numbers = {1, 2, 3, 4, 5};
		double[] propabilities = {0.1, 0.2, 0.1, 0.3, 0.3};
		double[] tablePropabilities = Main.getTablePropabilities(numbers, propabilities);
		int[] sequence = Main.getSequence(numbers, propabilities, size);
		Arrays.sort(sequence);
		System.out.println("Propability - " + Main.getPropability(sequence, tablePropabilities));
	}
}