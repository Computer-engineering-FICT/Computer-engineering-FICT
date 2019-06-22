import java.util.Random;

public class Lab1 {
	private static Random randomInteger = new Random();
	private static int[][] regularOper = {{50, 1},
										  {75, 2},
										  {65, 4},
										  {90, 6},
										  {100, 8}};
	private static int[][] fileOper = {{100, 1, 0},
									   {150, 1, 3},
									   {175, 3, 5},
									   {125, 3, 7},
									   {250, 2, 9}};
	private static double[] n = new double [10];
	private static double[] V = new double [10];
	private static int cycleIterations = 10000;

	private static void algo(){
		int i, j;
		//V1 
		V[0]++;
		//V2 
		V[1]++;
		//Условие i <= 0 
		i = randomInteger(-5, 2);
		if(i <= 0) {
			//V3
			V[2]++;
			//V4
			V[3]++;
		}
		else {
			//Условие j > 0
			j = randomInteger(-2, 6);
			if(j > 0){
				//V5
				V[4]++;
				//V6
				V[5]++;
			}
			else {
				//Цикл N = 7
				for(int N = 1; N < 7; N++){
					//V9
					V[8]++;
					//V10
					V[9]++;
				}
			}
		}
		//V7
		V[6]++;
		//V8
		V[7]++;
	}
	
	public static void main(String... args){
		//Прогон алгоритма
		for(int i = 0; i < cycleIterations; i++){
			algo();
		}
		
		//Подсчёт n
		System.out.println("Подсчёт n:");
		for(int i = 0; i < n.length; i++){
			n[i] = V[i] / cycleIterations;
			System.out.println("n" + (i+1) + " = " + n[i]);
		}
		
		System.out.println("\n---------------------------------------------------------------\n");
		
		double N = 0; // Cреднее число операций при одном прогоне алгоритма
		double operNum = 0;
		for(int i = 0; i < regularOper.length; i++){
			operNum += (n[regularOper[i][1]] * regularOper[i][0]);
			N += n[regularOper[i][1]];
		}
		System.out.println("Cреднее число операций при одном прогоне алгоритма: " + operNum);

		double appealNum; // Среднее число обращений к каждому из файлов
		double infoNum; // Среднее число информации, передаваемое при одном обращении к файлу
		double fileNum; // Номер файла
		for(int i = 0; i < 3; i++){
			appealNum = 0;
			infoNum = 0;
			fileNum = i + 1;
			
			//Cреднее число обращений к каждому из файлов
			for(int j = 0; j < fileOper.length; j++){
				if(fileNum == fileOper[j][1])
					appealNum += n[fileOper[j][2]];
			}
			System.out.println("Cреднее число обращений к файлу " + (i + 1) + ": " + appealNum);
			
			//Cреднее число информации, передаваемое при одном обращении к файлу
			for(int j = 0; j < fileOper.length; j++){
				if(fileNum == fileOper[j][1])
					infoNum += (n[fileOper[j][2]] * fileOper[j][0]);
			}
			System.out.println("Cреднее число информации, передаваемое при одном обращении к файлу " + (i + 1) + ": " + (infoNum / appealNum));
		}
		System.out.println("Средняя трудоемкость этапа счёта: " + (operNum / N));
	}
	
	private static int randomInteger(int min, int max){
		return randomInteger.nextInt((max - min) + 1) + min;
	}
}
