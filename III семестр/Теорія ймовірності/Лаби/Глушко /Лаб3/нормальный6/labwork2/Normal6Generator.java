package com.diuk.pt.labwork2;

import java.util.Collection;
import java.util.ArrayList;

/**
 * Normal(6) generator generate random numbers for according to the law Ri = s*Yi - m, 
 * where <code>s</code> and <code>m</code> is specified. Yi = sqrt(2) * (summ(0, 5, (rj)) - 3).
 * rj is generated with standard random generator. 
 * @author diuk
 *
 */
public class Normal6Generator {
	private Collection<Double> numbers = new ArrayList<Double>();
	private static final double _sqrt2 = Math.sqrt(2);
	
	public Collection<Double> generate(double s, double m, int N){
		
		for (int i = 0; i<N; i++){
			double Y = 0;
			for (int h = 0; h<=5; h++){
				Y += Math.random();
			}
			Y = _sqrt2 * (Y - 3);
			double R = s*Y + m;
			numbers.add(R);
		}
		return numbers;
	}
}
