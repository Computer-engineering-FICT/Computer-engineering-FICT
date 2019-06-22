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
		//������� i <= 0 
		i = randomInteger(-5, 2);
		if(i <= 0) {
			//V3
			V[2]++;
			//V4
			V[3]++;
		}
		else {
			//������� j > 0
			j = randomInteger(-2, 6);
			if(j > 0){
				//V5
				V[4]++;
				//V6
				V[5]++;
			}
			else {
				//���� N = 7
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
		//������ ���������
		for(int i = 0; i < cycleIterations; i++){
			algo();
		}
		
		//������� n
		System.out.println("������� n:");
		for(int i = 0; i < n.length; i++){
			n[i] = V[i] / cycleIterations;
			System.out.println("n" + (i+1) + " = " + n[i]);
		}
		
		System.out.println("\n---------------------------------------------------------------\n");
		
		double N = 0; // C������ ����� �������� ��� ����� ������� ���������
		double operNum = 0;
		for(int i = 0; i < regularOper.length; i++){
			operNum += (n[regularOper[i][1]] * regularOper[i][0]);
			N += n[regularOper[i][1]];
		}
		System.out.println("C������ ����� �������� ��� ����� ������� ���������: " + operNum);

		double appealNum; // ������� ����� ��������� � ������� �� ������
		double infoNum; // ������� ����� ����������, ������������ ��� ����� ��������� � �����
		double fileNum; // ����� �����
		for(int i = 0; i < 3; i++){
			appealNum = 0;
			infoNum = 0;
			fileNum = i + 1;
			
			//C������ ����� ��������� � ������� �� ������
			for(int j = 0; j < fileOper.length; j++){
				if(fileNum == fileOper[j][1])
					appealNum += n[fileOper[j][2]];
			}
			System.out.println("C������ ����� ��������� � ����� " + (i + 1) + ": " + appealNum);
			
			//C������ ����� ����������, ������������ ��� ����� ��������� � �����
			for(int j = 0; j < fileOper.length; j++){
				if(fileNum == fileOper[j][1])
					infoNum += (n[fileOper[j][2]] * fileOper[j][0]);
			}
			System.out.println("C������ ����� ����������, ������������ ��� ����� ��������� � ����� " + (i + 1) + ": " + (infoNum / appealNum));
		}
		System.out.println("������� ������������ ����� �����: " + (operNum / N));
	}
	
	private static int randomInteger(int min, int max){
		return randomInteger.nextInt((max - min) + 1) + min;
	}
}
