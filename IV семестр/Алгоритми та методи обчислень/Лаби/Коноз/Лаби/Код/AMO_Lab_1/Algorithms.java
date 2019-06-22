package AMO_Lab_1;

import java.util.Scanner;

public class Algorithms {
	Scanner reader = new Scanner(System.in);
	
	public void run(){
		int key = 0;
		System.out.println("Для запуску першого алгоритму введіть 1.");
		System.out.println("Для запуску другого алгоритму введіть 2.");
		System.out.println("Для запуску третього алгоритму введіть 3.");
		key = reader.nextInt();
		if ((key < 1) || (key > 3)){
			System.out.println("Введіть коректний варіант.");
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
		System.out.println("Введіть r1, j через пробіл (наприклад 4,5 3,2) і натисніть Enter.");
		r1 = reader.nextDouble();
		j = reader.nextDouble();
		z2 = r1 + 21 + (r1 + 21)/j;
		System.out.println("Відповідь:");
		System.out.println("z2 = " + z2);
		
	}
	
	public void algorithm2(){
		double y = 0.0;
		double x = 0.0;
		double k = 0.0;
		System.out.println("Введіть х яке лежить в інтервалі (3,7) і натисніть Еnter.");
		x = reader.nextDouble();
		if ((x > 7) || (x < 3)){
			System.out.println("Ви ввели х, який не належить інтервалу (3,7). Спробуйте ввести коректний х ще раз.");
			x = reader.nextDouble();
		}
		System.out.println("Введіть k.");
		k = reader.nextDouble();
		y = k * x * x;
		System.out.println("Відповідь:");
		System.out.println("y = " + y);
	}
	
	public void algorithm3(){
		double result = 1;
		System.out.println("Введіть 10 чисел через пробіл і натисніть Enter.");
		for (int i = 0; i < 10; i++) {
			result *= reader.nextDouble();
		}
		result = Math.pow(result, 0.1);
		System.out.println("Відповідь:");
		System.out.println("y = " + result);
	}

}
