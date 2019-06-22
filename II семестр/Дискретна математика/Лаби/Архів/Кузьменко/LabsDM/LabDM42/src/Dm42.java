import java.util.Scanner;

public class Dm42 {
	public Dm42() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Вводити з клавіатури - 1");
		System.out.println("Прочитати з файла - 2");
		boolean q = true;
		int a[][];
		do {
			int h = sc.nextInt();
			switch (h) {
			case 2:
				ReadFromFile s = new ReadFromFile("C:\\Users\\Lenovo\\Desktop\\matr.txt");
				a = s.getsum();
				q = false;
				break;
			case 1:
				System.out.println("Введіть кількість вершин графа");
				int m = sc.nextInt();
				a = new int[m][m];
				System.out
						.println("Почніть вводити матрицю сумісності порядково");
				for (int i = 0; i < a.length; i++) {
					for (int j = 0; j < a[0].length; j++) {
						a[i][j] = sc.nextInt();
					}
				}
				q = false;
				break;
			default:
				a = null;
				q = true;
				System.out.println("input again");
				break;
			}
		} while (q);
		int x = 0;
		if (a != null) {
			for (int i = 0; i < a.length; i++) {
				for (int j = 0; j < a[0].length; j++) {
					if (a[i][j] == 1)
						x++;
					System.out.print(a[i][j] + " ");
				}
				System.out.println();
			}
			int[][] intsend = new int[a.length][x];
			x = 0;

			for (int i = 0; i < a.length; i++) {
				for (int j = 0; j < a[0].length; j++) {
					if ((i == j) & (a[i][j] == 1)) {
						intsend[i][x] = 2;
						x++;
					} else if (a[i][j] == 1) {
						intsend[i][x] = 1;
						intsend[j][x] = -1;
						x++;
					}
				}

			}
			int j = 0;
			for (int i = 0; i < intsend.length; i++) {
				if (i == 0) {
					
					System.out.println();
				}
				System.out.print("x" + i);
				for (j = 0; j < intsend[0].length; j++) {
					switch (intsend[i][j]) {
					case 1:
						System.out.print("  1  ");
						break;
					case -1:
						System.out.print(" -1  ");
						break;
					case 2:
						System.out.print(" +-1 ");
						break;
					case 0:
						System.out.print("  0  ");
						break;
					default:
						break;
					}
				}
				System.out.println();
			}
		} 
	}
}
