package ua.kpi.io33.zakolenko.lab4;

/**
 * This class describe data about object Furniture.
 * 
 * @author Roman Zakolenko
 * @version 1,6 07 Apr 2014
 */

public class Furniture {

	public String type;
	public String color;
	public int length;
	public int height;
	public int width;

	/**
	 * @param t
	 *            this variable is assigned to the field "type".
	 * @param c
	 *            this variable is assigned to the field "color".
	 * @param l
	 *            this variable is assigned to the field "height".
	 * @param h
	 *            this variable is assigned to the field "height".
	 * @param w
	 *            this variable is assigned to the field "width".
	 */

	public Furniture(String t, String c, int l, int h, int w) {
		type = t;
		color = c;
		length = l;
		height = h;
		width = w;
	}
}
