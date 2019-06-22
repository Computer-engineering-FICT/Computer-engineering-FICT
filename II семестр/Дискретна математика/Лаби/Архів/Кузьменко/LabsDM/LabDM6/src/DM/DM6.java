package DM;

import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;

public class DM6 {

	public DM6() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Введення з клавіатури - 1");
		System.out.println("Введення з файла - 2");
		boolean q = true;
		int x[][];
		do {
			int h = sc.nextInt();
			switch (h) {
			case 2:
				WriteFromFile w = null;
				ReadFromFile r = null;
				try {
					System.out.println("Номер кінцевої вершини:");
					w = new WriteFromFile(h = sc.nextInt());
					r = new ReadFromFile(
							"C:\\Users\\Lenovo\\Desktop\\lab6.data");
				} catch (IOException e) {
					e.printStackTrace();
				}

				x = r.getMas();
				q = false;
				break;
			case 1:
				System.out.println("Введіть кількість вершин графа");
				int size = sc.nextInt();
				x = new int[size][size];
				System.out
						.println("Почніть вводити матрицю сумісності порядково");
				for (int i = 0; i < x.length; i++) {
					for (int j = 0; j < x[0].length; j++) {
						x[i][j] = sc.nextInt();
					}
				}
				q = false;
				break;
			default:
				x = null;
				q = true;
				System.out.println("input again");
				break;
			}
		} while (q);
		int l = 0;
		int k = 0;
		int j = 0;
		for (int i = 0; i < x.length; i++) {
			for (j = 0; j < x.length; j++) {
				if (x[i][j] > 9) {
					System.out.print("|" + x[i][j] + "|");
				} else
					System.out.print("|" + x[i][j] + " |");
			}
			System.out.println();
		}
		j = 0;
		k = 0;

		while (j < x.length & k != x.length) {
			k = 0;
			for (int i = 0; i < x.length; i++) {

				if (x[j][i] == 0)
					k++;
			}
			if (k == x.length) {
				x[j] = Arrays.copyOf(x[x.length - 1], x.length);
				Arrays.fill(x[x.length - 1], 0);
				l++;
			}
			j++;
		}

		if (k != x.length | l > 2)
			System.out.println("не вірна матриця");
		else {
			int[] oldTop = new int[x.length];
			for (int i = 0; i < x.length; i++) {
				oldTop[i] = i;
			}
			int buf = 0;
			int m = 0;
			int n = 0;
			int[] bufvector = new int[x.length];
			for (int i = 0; i < x.length; i++) {
				for (j = 0; j < i; j++) {
					if (x[i][j] != 0) {
						oldTop[j] = i;
						oldTop[i] = j;
						buf = x[i][j];
						x[i][j] = 0;
						m = i;
						n = j;
						for (int j2 = 0; j2 < bufvector.length; j2++) {
							bufvector[j2] = x[j2][j];
						}
						for (int j2 = 0; j2 < bufvector.length; j2++) {
							x[j2][j] = x[j2][j + 1];
						}
						for (int j2 = 0; j2 < bufvector.length; j2++) {
							x[j2][j + 1] = bufvector[j2];
						}
						Arrays.fill(bufvector, 0);
						bufvector = Arrays.copyOf(x[i], x.length);
						x[i] = Arrays.copyOf(x[i - 1], x.length);
						x[i - 1] = Arrays.copyOf(bufvector, x.length);
						x[n][m] = buf;
					}
				}
			}

			k = 0;
			int s = 0;
			System.out.println();
			System.out.print("X 1 -->");
			int min = Integer.MAX_VALUE;
			for (int i = 0; i < x.length; i++) {
				if (x[0][i] != 0 && x[0][i] < min) {
					k = i;
					min = x[0][i];
				}
			}
			if (min != Integer.MAX_VALUE)
				s += min;

			System.out.print("X " + (oldTop[k] + 1) + " --> ");
			for (int i = k; i < x.length - 1; i++) {

				min = Integer.MAX_VALUE;
				for (j = 0; j < bufvector.length; j++) {
					if (x[i][j] != 0 && x[i][j] < min && k != j) {
						min = x[i][j];
						k = j;
					}
				}
				if (min != Integer.MAX_VALUE)
					s += min;
				if (i + 2 == x.length)
					System.out.print("X " + (oldTop[k] + 1) + "");
				else
					System.out.print("X " + (oldTop[k] + 1) + " -->");
			}
			System.out.println();
			System.out.println("Довжина шляху " + s);
		}

	}
}
