/*
 * 
 */

package com.sp2.courseWork.test;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.math.BigInteger;

import org.junit.Before;
import org.junit.Test;

import static com.sp2.courseWork.BigDemUtils.SimpleMathUtils.*;
import static com.sp2.courseWork.BigDemUtils.Utils.*;
// TODO: Auto-generated Javadoc

/**
 * test class.
 *
 * @author Kuzmenko Volodimir
 */
public class UtilsTest {
	
	/** The x1. */
	BigDecimal x1;
	
	/** The x2. */
	BigDecimal x2;
	
	/** The x3. */
	BigDecimal x3;
	
	/** The x4. */
	BigDecimal x4;

	/**
	 * Inits the.
	 */
	@Before
	public void init() {
		x1 = new BigDecimal("2.3445555555555555555555555555555555555555");
		x2 = new BigDecimal("0.65");
		x3 = new BigDecimal("6");
		x4 = new BigDecimal("0.343534534534534534534534534534534534545444545");
	}

	/**
	 * Test factorial.
	 */
	//@Test
	public void testFactorial() {
		BigInteger b = new BigInteger("20922789888000");
		assertTrue(factorial(16).compareTo(b)==0);
	}

	/**
	 * Test sin.
	 */
	@Test
	public void testSin() {
		String value1 = sin(x3).toString();
		String value2 = Double.toString(Math.sin(x3.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = sin(x1).toString();
		value2 = Double.toString(Math.sin(x1.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	
	}

	/**
	 * Test cos.
	 */
	@Test
	public void testCos() {
		String value1 = cos(x3).toString();
		String value2 = Double.toString(Math.cos(x3.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = cos(x1).toString();
		value2 = Double.toString(Math.cos(x1.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	}

	/**
	 * Test tan.
	 */
	@Test
	public void testTan() {
		String value1 = tan(x4).toString();
		String value2 = Double.toString(Math.tan(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = cos(x2).toString();
		value2 = Double.toString(Math.cos(x2.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		
	}
	
	/**
	 * Test ctan.
	 */
	@Test
	public void testCtan(){
		String value1 = ctan(x1).toString();
		String value2 = Double.toString(1.0/Math.tan(x1.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = cos(x2).toString();
		value2 = Double.toString(Math.cos(x2.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	}
	
	/**
	 * Test asin.
	 */
	@Test
	public void testAsin(){
		String value1 = asin(x4).toString();
		String value2 = Double.toString(Math.asin(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 2);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = asin(x4).toString();
		value2 = Double.toString(Math.asin(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	
	}
	
	/**
	 * Test acos.
	 */
	@Test
	public void testAcos(){
		String value1 = acos(x4).toString();
		String value2 = Double.toString(Math.acos(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 2);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = acos(x4).toString();
		value2 = Double.toString(Math.acos(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	
	}
	
	/**
	 * Test atan.
	 */
	@Test
	public void testAtan(){
		String value1 = atan(x4).toString();
		String value2 = Double.toString(Math.atan(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 2);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = atan(x4).toString();
		value2 = Double.toString(Math.atan(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	
	}
	
	/**
	 * Test exp.
	 */
	@Test
	public void testExp(){
		String value1 = exp(x4).toString();
		String value2 = Double.toString(Math.exp(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = exp(x4).toString();
		value2 = Double.toString(Math.exp(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	}
	
	/**
	 * Test sinh.
	 */
	//@Test
	public void testSinh(){
		String value1 = sinh(x4).toString();
		String value2 = Double.toString(Math.sinh(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = sinh(x4).toString();
		value2 = Double.toString(Math.sinh(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	}
	
	/**
	 * Test ln.
	 */
	@Test
	public void testLn(){
		String value1 = ln(x4).toString();
		String value2 = Double.toString(Math.log(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = ln(x1).toString();
		value2 = Double.toString(Math.log(x1.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	}
	
	/**
	 * Test lg.
	 */
	@Test
	public void testLg(){
		String value1 = lg(x4).toString();
		String value2 = Double.toString(Math.log10(x4.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = lg(x1).toString();
		value2 = Double.toString(Math.log10(x1.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	}
	
	/**
	 * Test sqrt.
	 */
	@Test
	public void testSqrt(){
		String value1 = sqrt(x3).toString();
		String value2 = Double.toString(Math.sqrt(x3.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
		value1 = lg(x1).toString();
		value2 = Double.toString(Math.log10(x1.doubleValue()));
		value2 = value2.substring(0, value2.length() - 1);
		value1 = value1.substring(0, value2.length());
		assertTrue(value1.equalsIgnoreCase(value2));
	}
	@Test
	public void testFunk(){
		BigDecimal x = new BigDecimal(2.1);
		BigDecimal result = sin(sqrt(sin(x).pow(2).multiply(cos(x.multiply(ln(x))))));
		System.out.println(result.toString());
		
	}
	 @Test(expected = IllegalArgumentException.class)
	public void testIllegalArgumentException(){
		sin(new BigDecimal("rer4"));
	}
	 @Test(expected = IllegalArgumentException.class)
	 public void testIllegalArgumentExceptionArccos(){
		 acos(new BigDecimal("3.64645645"));
	 }
	 

}
