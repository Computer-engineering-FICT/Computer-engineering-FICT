package Lab4;

public class Normal {
	private double m;
	private double sigma;
	
	Normal(double m, double sigma){
		this.m=m;
		this.sigma=sigma;
	}
	
	public double next(){
		return nextY()*sigma+m;
	}
	
	private double nextY(){
		double S=0;
		double next=0;
		for(int i=0; i<12;i++){
			next=Math.random();
			S+=next;
		}
		return S-6;
	}
	
	public double getD(double[] array, double m){
		double S = 0;
		for(int i=0; i<array.length; i++){
			S+=array[i]*array[i];
		}
		return S/array.length-m*m;
	}
	
	public double getM(double[] array){
		double S = 0;
		for(int i=0; i<array.length; i++){
			S+=array[i];
		}
		return S/array.length;
	}
}
