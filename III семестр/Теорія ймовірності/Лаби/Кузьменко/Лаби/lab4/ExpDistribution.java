import java.util.Random;


public class ExpDistribution {

	private double lambda;
	public ExpDistribution(double lammbda) {
		this.lambda = lammbda;
	}
	public double getX (){
		double x=0;
		Random r = new Random();
		x=r.nextGaussian();
		return  x;
	}

}
