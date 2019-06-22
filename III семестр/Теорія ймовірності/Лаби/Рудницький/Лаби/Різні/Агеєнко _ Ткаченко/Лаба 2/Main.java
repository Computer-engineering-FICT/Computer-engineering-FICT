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
		System.out.println("����������� ����������: "+calcM);
		System.out.println("������������������� ���������: "+Math.sqrt(calcD));		
		System.out.println("��������: "+calcD);
		System.out.println("����: "+calcM);
	}
}
