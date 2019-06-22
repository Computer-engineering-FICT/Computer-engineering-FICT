import java.util.Arrays;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		int countNumber = 1000;// длина последовательности
		int m = 30;
		int[] x = new int[countNumber];// генерируемая последовательность
		int n = 1000;// количество проводимых испытаний
		double p = 0.6;// вероятность успеха в одной испытании
		BinomialDistribution bd = new BinomialDistribution(n, p);
		double valueTest;
//
//		// автоматическое генерирование выборки
		System.out.println("Значение параметров биномиального закона распределения");
		System.out.println("n = "+n);
		System.out.println("p = "+p);
	
		for (int i = 0; i < x.length; i++) {
			x[i] = bd.nextNumber();	
		}
		 valueTest= ChiSquaredTest
				.chiSquaredValue(countNumber, m, x, bd);
		System.out.println("значение критерия Пирсона = " + valueTest);
		System.out.println("вероятность правильности гипотезы = "
				+ ChiSquaredTest.valueProbability(valueTest, m));
		
//		System.out.println();
//		Arrays.sort(x);
//		for (int i = 0; i < x.length; i++) {
//			System.out.print(x[i]+" ");
//		}
//		System.out.println();
//		double b=Math.sqrt(n*p*(1-p));
//		System.out.println("ожидаемая отклонение = "+b);
//		double a=Math.sqrt(dispersion(x));
//		System.out.println("отклонение = "+a);
//		System.out.println("разница"+(a-b));

		// ввод данных пользователем
		m = 3;
//		n=20;
//		p=0.4;
//		x=new int[]{8,8,7,6,5,4,6,9,10,5};
		countNumber = 10;
		x = new int[countNumber];
		Scanner in = new Scanner(System.in);
		System.out.println();
		System.out
				.println("Введите параметры биномиального закона распределения");
		System.out.print("n = ");
		n = in.nextInt();
		System.out.print("p = ");
		p = in.nextDouble();

		bd = new BinomialDistribution(n, p);
		System.out.println("введите " + countNumber + " значений выборки");
		for (int i = 0; i < x.length; i++) {
			x[i]=in.nextInt();
		}
		valueTest = ChiSquaredTest
				.chiSquaredValue(x.length, m, x, bd);
		System.out.println("значение критерия Пирсона  = " + valueTest);
		System.out.println("вероятность правильности гипотезы = "
				+ ChiSquaredTest.valueProbability(valueTest, m));
	   double  b=Math.sqrt(n*p*(1-p));
		System.out.println("ожидаемое отклонение = "+b);
		double a=Math.sqrt(dispersion(x));
		System.out.println("отклонение = "+a);
		System.out.println("разница"+(a-b));

	}
	static double mathematicalExpectation(int[] x) {
		double summa = 0;
		for (int i = 0; i < x.length; i++) {
			summa += x[i];
		}
		double result = summa / x.length;
		return result;
	}
	static double dispersion(int[] x) {
		double m = mathematicalExpectation(x);
		double summa = 0;
		for (int i = 0; i < x.length; i++) {
			summa += (x[i] - m) * (x[i] - m);
		}
		double result = summa / x.length;
		return result;
	}

}
