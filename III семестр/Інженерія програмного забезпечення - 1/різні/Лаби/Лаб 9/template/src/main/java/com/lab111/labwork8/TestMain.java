package com.lab111.labwork8;
/**
 * run class
 * @author Nightingale
 *
 */
public class TestMain {
	/**
	 * Invokes at application startup.
	 * create example of classes, perform their method
	 * @param Args parameters from command line
	 */
	public static void main (String args[]){
		ConcreteCreator x = new ConcreteCreator();
		x.CreateProduct();
		x.GetProduct(x.CreateProduct());
	}
}
