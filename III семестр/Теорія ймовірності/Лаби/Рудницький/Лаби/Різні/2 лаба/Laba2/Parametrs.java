package Laba2;

public class Parametrs {

	public static double Expectation(int[] ary) {
		int expec = 0;
		for (int i = 0; i < ary.length; ++i) {
			expec += ary[i];
		}
		
		return ((double) expec / ary.length);
	}
	
	

	public static double Dispersion(int [] ary){
		double expec=Expectation(ary);
		double disp=0.0;
		for(int i=0;i<ary.length;++i){
			disp=disp+Math.pow(Math.abs(expec-ary[i]),2); 
		}
		return disp/ary.length; 
	}
}
