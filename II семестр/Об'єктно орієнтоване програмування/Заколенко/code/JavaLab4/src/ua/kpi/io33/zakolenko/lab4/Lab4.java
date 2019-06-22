package ua.kpi.io33.zakolenko.lab4;

import java.util.Arrays;

/**
 * Is used to create objects of class Furniture, as well as for sorting objects
 * of class Furniture for their fields.
 * 
 * @author Roman Zakolenko
 * @version 1,7 07 Apr 2014
 * @see uk.kpi.io33.zakolenko.lab4.Furniture
 *      uk.kpi.io33.zakolenko.lab4.SortByLength
 *      uk.kpi.io33.zakolenko.lab4.SortByType
 *      uk.kpi.io33.zakolenko.lab4.SortByHeight
 */

public class Lab4 {
	public static void main(String[] args) {
		Furniture table1 = new Furniture("table", "brown", 15, 42, 65);
		Furniture table2 = new Furniture("table", "green", 25, 44, 66);
		Furniture table3 = new Furniture("table", "red", 34, 43, 25);
		Furniture chair1 = new Furniture("chair", "brown", 10, 21, 11);
		Furniture chair2 = new Furniture("chair", "white", 12, 4, 34);
		Furniture Array[] = { table1, table2, table3, chair1, chair2 };
		Arrays.sort(Array, new SortByType());
		System.out.println("Lexicographical sorting:");
		for (int i = 0; i < Array.length; i++) {
			System.out.println(Array[i].type.toLowerCase());
		}
		Arrays.sort(Array, new SortByLength());
		System.out.println("Sorting by length:");
		for (int i = 0; i < Array.length; i++) {
			System.out.println(Array[i].length);
		}
		Arrays.sort(Array, new SortByHeight());
		System.out.println("Sorting by height:");
		for (int i = 0; i < Array.length; i++) {
			System.out.println(Array[i].height);
		}
	}
}