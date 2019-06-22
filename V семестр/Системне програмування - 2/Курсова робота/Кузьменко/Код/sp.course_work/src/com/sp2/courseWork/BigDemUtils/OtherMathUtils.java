/*
 * 
 */
package com.sp2.courseWork.BigDemUtils;

import java.math.BigDecimal;
import java.util.Random;

import static com.sp2.courseWork.BigDemUtils.Utils.*;
import static com.sp2.courseWork.BigDemUtils.SimpleMathUtils.*;
// TODO: Auto-generated Javadoc

/**
 * Class for store erf, factorial nad random function.
 *
 * @author Kuzmenko Volodimir
 */
public class OtherMathUtils {
	
	/**
	 * error function.
	 *
	 * @param x argument function
	 * @return result value
	 */
	public static BigDecimal erf (final BigDecimal x){
			BigDecimal b = new BigDecimal(2);
			b = b.divide(sqrt(PI),mc);
			BigDecimal d1, d2,d3,res;
			res = BigDecimal.ZERO;
			for (int n = 0; n < 100; n++) {
				d1 = x.divide(new BigDecimal(2*n+1),mc);
				d2 = BigDecimal.ONE;
				for (int k = 1; k <= n; k++) {
					d3 = x.pow(2).multiply(new BigDecimal(-1));
					d2 = d2.multiply(d3.divide(new BigDecimal(k),mc),mc);
				}
				d1 = d1.multiply(d2,mc);
				res =res.add(d1,mc);
			}
			res = res.multiply(b,mc);
			return res;
	}
	
	/**
	 * function for uniformly distribution between 0 and 1.
	 *
	 * @return random number
	 */
	public static BigDecimal nextRandom(){
		Random random = new Random();
		
		return new BigDecimal(random.nextDouble(),mc);
	}
	
	/**
	 * function for standard normal distribution .
	 *
	 * @return random number for this distribution
	 */
	public static BigDecimal nextGaussian(){
		Random random = new Random();
		return new BigDecimal(random.nextGaussian());
	}
	
		
}
