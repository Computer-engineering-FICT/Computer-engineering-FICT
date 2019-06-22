package Lab2;

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
		for(int i=0; i<55;i++){
			next=Math.random();
			//System.out.println("r="+next);
				
			S+=next;
					}
		double b= Math.sqrt(12)/Math.sqrt(55);	
		return (S-27.5)*b;
	}
	
	public static double getD(double[] array, double m){
		/*double S = 0;
		for(int i=0; i<array.length; i++){
			S+=Math.pow(array[i]-m, 2);        
		}
		return S/array.length;*/
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
	
	public static double getM(double[] array){
		double S = 0;
		int count;
		for(int i=0; i<array.length; i++){
			count = 0;
			for(int j=0; j<array.length; j++){
				if(array[i]==array[j]){
				
					count++;
				}
			}
			S+=array[i]*count;
		}
		return S/array.length;
	}
}
