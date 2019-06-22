package com.lab111.labwork4;
/**
 * defines the interface for implementation classes
 * @author Nightingale
 *
 */
public interface API {
	/**
	 * drawing method for POINT
	 * @param x coordinate
	 * @param y coordinate
	 */
	public void drawPoint(int x, int y);
	/**
	 * drawing method for LINE
	 * @param x1 first OX coordinate 
	 * @param y1 first OY coordinate 
	 * @param x2 second OX coordinate 
	 * @param y2 second OY coordinate 
	 */
	public void drawLine(int x1, int y1, int x2, int y2);
	/**
	 * drawing method for RECTANGLE
	 * @param x center OX coordinate
	 * @param y center OY coordinate
	 * @param width 
	 * @param height 
	 * @param phi deviation angle from the x-axis
	 */
	public void drawRect(int x, int y, int width, int height, double phi);
}