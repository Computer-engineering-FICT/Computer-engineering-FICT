	package lab2;

/**
 * 
 * @author Ruslan Popenko
 * 
 */
public class Lab2 {

	public static void main(String[] args) {
		double p=0.5;
		int n=72;
		int length=5000;
		BinomialDistribution BM=new BinomialDistribution(p, n, length);
		System.out.println("����������� ����������");
		System.out.println(BM.MathematicalExpectation(BM.Sequence));
		System.out.println("��������");
		System.out.println(BM.Dispersion(BM.Sequence));
		System.out.println("������ ����������� ���������");
		System.out.println(BM.StandardDeviation(BM.Sequence));
		System.out.println("�� ������");
		System.out.println("m=np="+(double) n*p);
		double D=(double) n*p*(1-p);
		System.out.println("D=np(1-p)="+D);
		double sigma=Math.pow(D, 0.5);
		System.out.println("���="+sigma);
		
		
	}

}
