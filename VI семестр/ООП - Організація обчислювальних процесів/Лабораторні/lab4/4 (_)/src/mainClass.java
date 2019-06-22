import java.util.Random;

/**
 * Created by IntelliJ IDEA.
 * User: Dmitry
 * Date: 17.04.2006
 * Time: 23:51:19
 * To change this template use File | Settings | File Templates.
 */
public class mainClass{

	static int[][] mass = new int[20][20];
	static Random rand = new Random();

	public static void main(String[] argv){

		Thread thread = new Thread();
		thread.start();

		for (int i = 0; i < mass.length; i++){
			for (int j = 0; j < mass.length; j++){
				mass[i][j] = (int)(rand.nextDouble() * 2);
			}
		}

	   	matrixOut(mass);
		sort(mass,19,true);

		for (int s = 0; s < 500; s++){
			for (int d = 19; d >= 0; d--){
	//			System.out.println("Iteration------------------------------");
	//			matrixOut(mass);
				sort(mass, d, false);

			}
		}

		matrixOut(mass);
		sort(mass,19,true);

	}

	public static void sort(int[][] matr, int x, boolean viv){

			//нахождение номер минимального р€да
			int sum = 0;
			int number = 10000;
			int p = 0;
			if (viv){
				System.out.println("");
				System.out.println("–аспределение по X : ");
			}
			for (int i = 0; i < x; i++){
				sum = 0;
				for (int j = 0; j < x; j++){
					sum = sum + matr[i][j];
				}
				if (viv){
					System.out.print(sum + " ");
				}
				if (sum <= number){
					p = i;
					number = sum;
				}
			}

			if (viv)
					System.out.println("");

//			System.out.println("p = " + p);
			//минимальный р€д - p
			//замена р - го р€да с k - ым.

			int temp = 0;

			for (int z = 0; z < x; z++){

				temp = mass[p][z];
				mass[p][z] = mass[x][z];
				mass[x][z] = temp;

			}


					//нахождение номер минимального столбца
			sum = 0;
			number = 10000;
			p = 0;
			if (viv){
				System.out.println("");
				System.out.println("–аспределение по Y : ");
			}
			for (int j = 0; j < x; j++){
				sum = 0;
				for (int i = 0; i < x; i++){
					sum = sum + matr[i][j];
				}
				if (viv){
					System.out.print(sum + " ");
				}
				if (sum <= number){
					p = j;
					number = sum;
				}
			}
			if (viv)
					System.out.println("");

//			System.out.println("p = " + p);
			//минимальный р€д - p
			//замена р - го р€да с k - ым.

			temp = 0;

			for (int z = 0; z < x; z++){

				temp = mass[z][p];
				mass[z][p] = mass[z][x];
				mass[z][x] = temp;

			}


	}


	public static void matrixOut(int[][] matr){
		for (int i = 0; i < matr.length; i++){
			for (int j = 0; j < matr.length; j++){
				System.out.print(matr[i][j] + " ");
			}
			System.out.println();
		}
	}

}
