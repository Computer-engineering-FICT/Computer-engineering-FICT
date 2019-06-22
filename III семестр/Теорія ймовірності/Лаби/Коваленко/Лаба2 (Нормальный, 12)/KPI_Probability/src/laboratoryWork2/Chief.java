package laboratoryWork2;

public class Chief {

	public static void main(String[] args) {
		
		double[] arr=new double[5000];

		Generate gen=new Generate();
		Test test=new Test();
		
		// performs part
		// enter values of coefficients
		gen.coefM();
		gen.coefSigma();
		// filling array
		for(int i=0; i<arr.length; i++){
			arr[i]=gen.getElementOfSequence(gen.tempSequence());
		}
		// comparison of theoretical and experimental values
		System.out.println("experimental value of m :"+test.testM(arr));
		System.out.println("experimental value of sigma coefficient :"+test.testSigma(arr));
	}
}