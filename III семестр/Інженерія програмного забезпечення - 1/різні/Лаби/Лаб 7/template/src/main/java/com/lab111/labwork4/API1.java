package com.lab111.labwork4;
/**
 * Interface of realization
 * Draws figures that are  ___Parallel____ axes
  * @author Nightingale
 *
 */
public interface API1 extends API {
	/**
	 * drawing method for RECTANGLE, angle phi = 0
	 * @param x1 coordinate of 1st vertex (pervoi vershinu)
	 * @param y1 coordinate of 1st vertex 
	 * @param x2 coordinate of 3 vertex 
	 * @param y2 coordinate of 3 vertex 
	 */
	public void draw(int x1, int y1, int x2, int y2);
}