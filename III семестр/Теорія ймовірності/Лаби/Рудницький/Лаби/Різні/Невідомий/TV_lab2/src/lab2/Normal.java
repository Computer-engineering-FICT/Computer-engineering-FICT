package lab2;

public class Normal {
	private double m;
	private double sigma;
	
	Normal(double m, double sigma){
		this.m=m;
		this.sigma=sigma;
	}
	
	public double R(){
		return Y()*sigma+m;
	}
	
	private double Y(){
		double S=0;
		double next=0;
		for(int i=0; i<12;i++){
			next=Math.random();
			System.out.println("r="+next);
			S+=next;
		}
		return S-6;
	}
	
	public static double get_D(double[] array, double m){
		double S = 0;
		int count;
		for(int i=0; i<array.length; i++){
			count = 0;
			for(int j=0; j<array.length; j++){
				if(array[i]==array[j]){
					count++;
				}
			}
			S+=array[i]*array[i]*count;
		}
		return S/array.length-m*m;
	}
	
	public static double get_m(double[] array){
		double S =0;
		for (int i = 0; i < array.length; i++) {
			S = S + array[i];
		}
		return S / array.length;
	}
}
