package com.lab111.labwork8;

public class ListLinked implements List {

	public Iterator iterator() {
		return new ListIterator();
	}

}