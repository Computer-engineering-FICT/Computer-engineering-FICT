package DM;

import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;

public class DM7 {
	public DM7(){
		Scanner sc = new Scanner(System.in);
		System.out.println("Введення з клавіатури - 1");
		System.out.println("Введення з файла - 2");
		boolean q = true;
		int x[][];
		do {
			int h = sc.nextInt();
			switch (h) {
			case 2:
				try {
				new WriteFromFile("C:\\Users\\Lenovo\\Desktop\\Lab7.txt");
				} catch (IOException e) {
					e.printStackTrace();
				}
				SumFile s = new SumFile("C:\\Users\\Lenovo\\Desktop\\Lab7.txt");
				x = s.getSum();
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
				x= null;
				q = true;
				System.out.println("input again");
				break;
			}
		} while (q);
		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < x.length; j++) {
				System.out.print(x[i][j]+"|");
			}
			System.out.println();
		}
		String [] colours = {"black", "red", "white", "orange", 
				"blue", "grey", "purple", "green"};
		int s = 0;
		int [][] tops = new int [2][x.length];
		for (int i = 0; i < x.length; i++) {
			tops[0][i]=i;
			s=0;
			for (int j = 0; j < x.length; j++) {
				if (x[i][j]==1)
					s++;
			}
			tops[1][i]=s;
		}
		System.out.println();
		for (int i = tops[1].length-1; i>0 ; i--) {
			for (int j = 0; j < i; j++) {
				if (tops[1][j] < tops[1][j+1]){
					swap(tops, j, j + 1, 0);
					swap(tops, j, j + 1, 1);
				}
			}
		}
		Arrays.fill(tops[1], 0);
		System.out.println();
		tops[1][0]=1;
		System.out.println((tops[0][0]+1) + " in colour " + colours[0]);
		int p = 0;int i=0;
		while(isNoverch(tops)){
			for (int l = 0; l < tops[0].length; l++) {
			}
			for (int j = 0; j < tops[0].length; j++) {
				if (x[tops[0][i]][j]==0 && tops[1][j]==0){
					System.out.println((tops[0][j]+1) + " in colour " + (colours[p]));
					tops[1][j]=1;		
				}
			}
			i++;
			p++;
		}
	}
	protected void swap (int [][] arr ,int i, int j, int k){
		int t = arr[k][i];
		arr[k][i]= arr[k][j];
		arr[k][j]=t;
	}
	protected boolean isNoverch(int [][] tops){
		boolean q = false;
		for (int i = 0; i < tops[0].length; i++) {
			if (tops[1][i]==0)q=true;
		}
		return q;
	}
}
