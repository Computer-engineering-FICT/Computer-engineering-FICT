package com.lab111.Lab6var9;

/**
 * Class Cable - for calculation price of Cable
 * @author A
 * @version 6.9
 */
public class Cable extends PartsOfNetwork{
	private double p;
	
	public Cable(double price) { 
		this.p = price;
	}
	/**
	 * @see com.lab111.Lab6var9.PartsOfNetwork#accept(com.lab111.Lab6var9.Visitor)
	 */
	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}
	public double getP() { 
		return p;
	}
}
