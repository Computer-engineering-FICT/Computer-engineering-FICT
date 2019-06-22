package com.lab111.labwork3; 
 
/** 
 * Leaf class, 
 * Ellipse line 
 * @author Nightingale 
 */ 
public class Ellipse extends Shape { 
 
	/** 
	 * Constructor, create an ellipse at given place with given dimensions
	 * @param left 
	 * @param top 
	 * @param rx horizontal radius 
	 * @param ry vertical radius 
	 */ 
	public Ellipse(int left, int top, int rx, int ry){ 
		x = left;  
		y = top; 
		width = rx * 2; 
		height = ry * 2; 
	} 
	 
	@Override 
	public void paint() {	 
		System.out.format("Ellipse in: (%d, %d) - (%d, %d)\n", x, y, x + width, y + height);		 
	} 
 
}
