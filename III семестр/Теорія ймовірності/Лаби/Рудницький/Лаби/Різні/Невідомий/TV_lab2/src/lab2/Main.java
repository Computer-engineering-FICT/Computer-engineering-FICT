package lab2;

public class Main {
	public static void main(String[] args){
		final double m = 27;
		final double sigma = 15;
		final int COUNT = 5000;
		double[] array = new double[COUNT];
		Normal generator = new Normal(m, sigma);
		for(int i=0; i<COUNT; i++){
			array[i]=generator.R();
		}
		double M =  Normal.get_m(array);
		double D =  Normal.get_D(array, M);
		System.out.println("Математическое ожидание: "+M);
		System.out.println("Среднеквадратическое отклонение: "+Math.sqrt(D));		
		System.out.println("Дисперсия: "+D);
		System.out.println("Мода: "+M);
	}
}
