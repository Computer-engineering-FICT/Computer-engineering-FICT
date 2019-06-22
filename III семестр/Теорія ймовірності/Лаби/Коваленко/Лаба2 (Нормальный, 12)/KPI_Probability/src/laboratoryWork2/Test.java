package laboratoryWork2;

public class Test {
	
	private double testM=0.;

	double testM(double[] arr){
		for(double i:arr)		testM+=i;
		testM=testM/((double) arr.length);
		return testM;
	}
		
	double testSigma(double[] arr){
		double d=0.;
		for(double i:arr)		d+=(i-testM)*(i-testM);
		d=d/((double) arr.length);
		double testSigma=Math.sqrt(d);
		return testSigma;
	}
}