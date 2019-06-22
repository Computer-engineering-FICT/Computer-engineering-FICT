package src.com.lab4;

import java.util.Random;

public class Generator {
	private int r_count = 12;
	private double R;
	public double [] r = new double[2*r_count];
	
	public double [] gen(){
		Random rand = new Random();
	    for (int i = 0; i < r.length; i++) {
	    	r[i] = (rand.nextDouble());	
	    }
	    return r;
	}
	public int  getR(int [] ab_array){
		for (int i=0; i<ab_array.length; i+=2){
			R += (ab_array[i+1]-ab_array[i])*r[i]+ab_array[i];
		}
		return (int) R;
	}
	
}
