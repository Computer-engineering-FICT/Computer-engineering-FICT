package com.lab111.labwork4;
/**

 * Interface of realization
 * Draws shapes _____at any angle_______
 * @author Nightingale
 *
 */
public interface API2 extends API {
	/**
	 * drawing method for line with ANY ANGLE
	 * @param x1 first OX coordinate
	 * @param y1 first OY coordinate
	 * @param x2 second OX coordinate
	 * @param y2 second OY coordinate
	 */
	public void draw(int x1, int y1, int x2, int y2);	
}