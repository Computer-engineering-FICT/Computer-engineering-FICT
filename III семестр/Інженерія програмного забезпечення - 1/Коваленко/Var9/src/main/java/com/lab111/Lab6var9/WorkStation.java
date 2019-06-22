package com.lab111.Lab6var9;

/**
 * Class WorkStation - for calculation price of WorkStation
 * @author A
 * @version 6.9
 */
public class WorkStation extends PartsOfNetwork{
	private double p;
	
	public WorkStation(double price) { 
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
