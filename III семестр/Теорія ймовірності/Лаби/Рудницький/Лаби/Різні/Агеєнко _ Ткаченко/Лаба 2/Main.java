package Lab2;


public class Main {
	public static void main(String[] args){
		final double m =3;
		final double sigma = 7;
		final int COUNT = 5000;
		double[] array = new double[COUNT];
		Normal generator = new Normal(m, sigma);
		for(int i=0; i<COUNT; i++){
			array[i]=generator.next();
		}
		double calcM =  Normal.getM(array);
		double calcD =  Normal.getD(array,calcM);
		System.out.println("Математичне очікування: "+calcM);
		System.out.println("Середньоквадратичне відхилення: "+Math.sqrt(calcD));		
		System.out.println("Дисперсія: "+calcD);
		System.out.println("Мода: "+calcM);
	}
}
