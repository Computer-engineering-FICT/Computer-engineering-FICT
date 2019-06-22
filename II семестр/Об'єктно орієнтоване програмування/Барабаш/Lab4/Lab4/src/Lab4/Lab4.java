/*
 * @(#) Lab4.java	1.0 15 Apr 2015
 * 
 * Copyright (c) 2015 Taras Barabash. All Rights Reserved.
 */
package Lab4;

import java.util.Arrays;
/*
 * Is used to create 5 objects of class plane and to sort 2 of them 
 * in ascending and descending order.
 * 
 * @version 	1.0 15 Apr 2015
 * @author  	Taras Barabash
 */

public class Lab4 {

	public static void main(String[] args) {
		Plane Plane1 = new Plane ("³��������", 35, 4, "������������", 2);
		Plane Plane2 = new Plane ("������������", 20, 6, "�������", 125);
		Plane Plane3 = new Plane ("��������", 60, 2, "������", 2);
		Plane Plane4 = new Plane ("³��������", 25, 3, "�������", 6);
		Plane Plane5 = new Plane ("������������", 45, 4, "����������", 225);
		Plane Array[] = {Plane1, Plane2, Plane3, Plane4, Plane5};
		Arrays.sort(Array, new ByType());
		System.out.println("���������� ����� �� ����� � ���������� ������� (� ������� ���������):");
		for (int i = 0; i < Array.length; i++) {
			System.out.println(Array[i].Type);
		}
		System.out.println("���������� ����� �� ������� ������� � ���������� �������:");
		Arrays.sort(Array, new ByAmount());
		for (int i = 0; i < Array.length; i++) {
			System.out.println(Array[i].AmountOfEngines);
		}
	}
}
