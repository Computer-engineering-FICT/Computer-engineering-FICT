package AMO_Lab_1;

import java.util.Scanner;

public class Algorithms {
	Scanner reader = new Scanner(System.in);
	
	public void run(){
		int key = 0;
		System.out.println("��� ������� ������� ��������� ������ 1.");
		System.out.println("��� ������� ������� ��������� ������ 2.");
		System.out.println("��� ������� �������� ��������� ������ 3.");
		key = reader.nextInt();
		if ((key < 1) || (key > 3)){
			System.out.println("������ ��������� ������.");
			key = reader.nextInt();
		}
		switch (key) {
		case 1:
			algorithm1();
			break;
			
		case 2:
			algorithm2();
			break;
			
		case 3:
			algorithm3();
			break;
		default:
			break;
		}
	}
	
	public void algorithm1(){
		double r1 = 0.0;
		double j = 0.0;
		double z2 = 0.0;
		System.out.println("������ r1, j ����� ����� (��������� 4,5 3,2) � �������� Enter.");
		r1 = reader.nextDouble();
		j = reader.nextDouble();
		z2 = r1 + 21 + (r1 + 21)/j;
		System.out.println("³������:");
		System.out.println("z2 = " + z2);
		
	}
	
	public void algorithm2(){
		double y = 0.0;
		double x = 0.0;
		double k = 0.0;
		System.out.println("������ � ��� ������ � �������� (3,7) � �������� �nter.");
		x = reader.nextDouble();
		if ((x > 7) || (x < 3)){
			System.out.println("�� ����� �, ���� �� �������� ��������� (3,7). ��������� ������ ��������� � �� ���.");
			x = reader.nextDouble();
		}
		System.out.println("������ k.");
		k = reader.nextDouble();
		y = k * x * x;
		System.out.println("³������:");
		System.out.println("y = " + y);
	}
	
	public void algorithm3(){
		double result = 1;
		System.out.println("������ 10 ����� ����� ����� � �������� Enter.");
		for (int i = 0; i < 10; i++) {
			result *= reader.nextDouble();
		}
		result = Math.pow(result, 0.1);
		System.out.println("³������:");
		System.out.println("y = " + result);
	}

}
