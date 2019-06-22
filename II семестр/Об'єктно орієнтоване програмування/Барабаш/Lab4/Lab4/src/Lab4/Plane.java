/*
 * @(#) Plane.java	1.0 15 Apr 2015
 * 
 * Copyright (c) 2015 Taras Barabash. All Rights Reserved.
 */
package Lab4;

/*
 * Is used to describe object plane
 * 
 * @version 	1.0 15 Apr 2015
 * @author  	Taras Barabash
 */

public class Plane {

	public String Type;
	public int Weight;
	public int AmountOfEngines;
	public String Color;
	public int PassangerSeats;
	

	/**
	 * @param Type
	 *            this variable is assigned to the field "Type".
	 * @param Weight
	 *            this variable is assigned to the field "Take-off weight".
	 * @param AmountOfEngines
	 *            this variable is assigned to the field "Amount of Engines".
	 * @param Color
	 *            this variable is assigned to the field "Color".
	 * @param PassangerSeats
	 *            this variable is assigned to the field "PassangerSeats".
	 */
	
public Plane (String t, int m, int n, String c, int p) {
	Type=t;
	Weight=m;
	AmountOfEngines=n;
	Color=c;
	PassangerSeats=p;
}
}