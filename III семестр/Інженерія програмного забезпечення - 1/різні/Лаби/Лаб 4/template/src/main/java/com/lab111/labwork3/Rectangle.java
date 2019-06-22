package com.lab111.labwork3; 
 
/** 
 * Leaf class, 
 * Rectangle line 
 * @author Nightingale 
 */ 
public class Rectangle extends Shape{ 
 
	/** 
	 * Constructor, create size and place of graphics 
	 * @param left is coordinate of left side 
	 * @param top is coordinate of top side 
	 * @param right is coordinate of right side
	 * @param bottom is coordinate of bottom side 
	 */ 
	public Rectangle(int left, int top, int right, int bottom){ 
		x=left;  
		y=top; 
		width=right-left; 
		height=bottom-top; 
	} 
	 
	@Override 
	public void paint() {	 
		System.out.format("Rectangle in (%d, %d) - (%d, %d)\n", x, y, x + width, y + height);		 
	} 
 
}
