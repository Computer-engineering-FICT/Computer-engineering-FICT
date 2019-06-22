package com.lab111.Lab6var9;

/**
 * General abstract class for all parts of Networks
 * @author A
 * @version 6.9
 */
public abstract class PartsOfNetwork {
	private double price=0;
	public abstract void accept(Visitor v);
	
	public double getPrice() { 
		return price;
	}
	public void setPrice(double p) { 
		this.price = p;
	}	
}
