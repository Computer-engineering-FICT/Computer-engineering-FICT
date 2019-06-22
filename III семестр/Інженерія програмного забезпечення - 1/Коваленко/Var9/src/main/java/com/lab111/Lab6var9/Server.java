package com.lab111.Lab6var9;

/**
 * Class Server - for calculation price of Server
 * @author A
 * @version 6.9
 */
public class Server extends PartsOfNetwork{
	private double p;
	
	public Server(double price) { 
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