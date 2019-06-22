/*
 * @(#) ByType.java	1.0 15 Apr 2015
 * 
 * Copyright (c) 2015 Taras Barabash. All Rights Reserved.
 */

package Lab4;

import java.util.Comparator;
/*
 * Is used to sort field Type in ascending order.
 * 
 * @version 	1.0 15 Apr 2015
 * @author  	Taras Barabash
 */

	public class ByType implements Comparator<Plane> {

		@Override
		public int compare(Plane o1, Plane o2) {
			return o1.Type.compareToIgnoreCase(o2.Type);
		}
		
}
