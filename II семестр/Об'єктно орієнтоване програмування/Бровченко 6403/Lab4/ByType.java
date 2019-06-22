/*
 * @(#) ByType.java	1.0 16 Mar 2017
 * 
 * Copyright (c) 2017 Anastasia Brovchenko. All Rights Reserved.
 */

package Lab4;

import java.util.Comparator;
/*
 * Is used to sort field Type in ascending order.
 * 
 * @version 	1.0 16 Mar 2017
 * @author  	Anastasia Brovchenko
 */

	public class ByType implements Comparator<Plane> {

		@Override
		public int compare(Plane o1, Plane o2) {
			return o1.Type.compareToIgnoreCase(o2.Type);
		}
		
}
