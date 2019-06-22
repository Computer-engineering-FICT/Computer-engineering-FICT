/*
 * @(#) Lab4.java	1.0 16 Mar 2017
 * 
 * Copyright (c) 2017 Anastasia Brovchenko. All Rights Reserved.
 */
package Lab4;

import java.util.Arrays;
/*
 * Is used to create 5 objects of class plane and to sort 2 of them 
 * in ascending and descending order.
 * 
 * @version 	1.0 16 Mar 2017
 * @author  	Anastasia Brovchenko
 */

public class Lab4 {

	public static void main(String[] args) {
		Plane Plane1 = new Plane ("Військовий", 35, 4, "жовтогарячий",2);
		Plane Plane2 = new Plane ("Пасажирський", 20, 6, "зелений", 125);
		Plane Plane3 = new Plane ("Поштовий", 60, 2, "жовтий", 2);
		Plane Array[] = {Plane1, Plane2, Plane3};
		System.out.println("\nСортування літаків за типом у алфавітному порядку (у порядку зростання):");
		Arrays.sort(Array, new ByType());
		for (int i = 0; i < Array.length; i++) {
			System.out.println(Array[i].Type);
		}
		System.out.println("\nСортування літаків за кількістю двигунів у спадаючому порядку");
		Arrays.sort(Array, new ByAmount());
		for (int i = 0; i < Array.length; i++) {
			System.out.println(Array[i].AmountOfEngines);
		}
	}
}
