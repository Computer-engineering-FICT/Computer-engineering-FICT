

package com.lab111.labwork3; 
 
/** 
 * Leaf class, 
 * Straight line 
 * @author Nightingale 
 */ 
public class Line extends Shape { 

	protected int x1;
	protected int x2;
	protected int y1;
	protected int y2;

	/** 
	 * Constructor, create size and place of graphics 
	 * @param x1 is coordinate x of left end 
	 * @param y1 is coordinate y of left end 
	 * @param x2 is coordinate x of right end 
	 * @param y2 is coordinate x of right end 
	 */

	public Line(int x1, int y1, int x2, int y2){ 
		this.x1 = x1;
		this.x2 = x2;
		this.y1 = y1;
		this.y2 = y2;
		x = (x1 < x2) ? x1 : x2;
		y = (y1 < y2) ? y1 : y2;
		width = (x1 < x2) ? x2 - x1 : x1 - x2; 
		height = (y1 < y2) ? y2 - y1 : y1 - y2; 
	}

	/** 
	 * Paint line 
	 */ 
	@Override 
	public void paint() {	 
		System.out.format("Line from (%d, %d) to (%d, %d)\n", x1, y1, x2, y2);		 
	} 
 
}