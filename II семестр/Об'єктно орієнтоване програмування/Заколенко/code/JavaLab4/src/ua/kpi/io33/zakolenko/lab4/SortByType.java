package ua.kpi.io33.zakolenko.lab4;

import java.util.Comparator;

/**
 * This class uses an interface Comparator and overrides the method compare,
 * that is used to sort the Object class Furniture by field "type".
 * 
 * @author Roman Zakolenko
 * @version 1,6 07 Apr 2014
 */
public class SortByType implements Comparator<Furniture> {
	/**
	 *@return type of Integer.
	 *Overrides the method compare for sort massive of object
	 *@param obj1,obj2 are objects of class Furniture 
	 */
	public int compare(Furniture obj1, Furniture obj2) {
		return obj1.type.toLowerCase().compareTo(obj2.type.toLowerCase());
	}
}