package DM;
import java.util.Scanner;

public class DM4 {
	public DM4() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Введення з клавіатури - 1");
		System.out.println("Введення з файла - 2");
		boolean q = true;
		int sum[][];
		do {
			int h = sc.nextInt();
			switch (h) {
			case 2:
				SumFile s = new SumFile("C:\\Users\\Lenovo\\Desktop\\matr.txt");
				sum = s.getSum();
				q = false;
				break;
			case 1:
				System.out.println("Введіть кількість вершин графа");
				int size = sc.nextInt();
				sum = new int[size][size];
				System.out
						.println("Почніть вводити матрицю сумісності порядково");
				for (int i = 0; i < sum.length; i++) {
					for (int j = 0; j < sum[0].length; j++) {
						sum[i][j] = sc.nextInt();
					}
				}
				q = false;
				break;
			default:
				sum = null;
				q = true;
				System.out.println("input again");
				break;
			}
		} while (q);
		int verticesCounter = 0;
		if (sum != null) {
			for (int i = 0; i < sum.length; i++) {
				for (int j = 0; j < sum[0].length; j++) {
					if (sum[i][j] == 1)
						verticesCounter++;
					System.out.print("|" + sum[i][j] + "|");
				}
				System.out.println();
			}
			int[][] intsend = new int[sum.length][verticesCounter];
			verticesCounter = 0;

			for (int i = 0; i < sum.length; i++) {
				for (int j = 0; j < sum[0].length; j++) {
					if ((i == j) & (sum[i][j] == 1)) {
						intsend[i][verticesCounter] = 2;
						verticesCounter++;
					} else if (sum[i][j] == 1) {
						intsend[i][verticesCounter] = 1;
						intsend[j][verticesCounter] = -1;
						verticesCounter++;
					}
				}

			}
			int j = 0;
			for (int i = 0; i < intsend.length; i++) {
				if (i == 0) {
					System.out.print("  ");
					for (int k = 0; k < intsend[0].length; k++) {
						System.out.print("|A " + k + "|");
					}
					System.out.println();
				}
				System.out.print("X" + i);
				for (j = 0; j < intsend[0].length; j++) {
					switch (intsend[i][j]) {
					case 1:
						System.out.print("| 1 |");
						break;
					case -1:
						System.out.print("|-1 |");
						break;
					case 2:
						System.out.print("|+-1|");
						break;
					case 0:
						System.out.print("| 0 |");
						break;
					default:
						break;
					}
				}
				System.out.println();
			}
		} else
			System.out.println("Матриця пуста");
	}
}
