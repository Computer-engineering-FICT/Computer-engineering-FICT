package com.lab111.labwork8;

public class ListIterator implements Iterator {
	public ListIterator() {
		System.out.println("Создание итератора для ListLinked");
	}

	public ListLinked listLinked;

	public Integer first() {
		System.out.println("ListIterator.first");
		return 0;
	}

	public Boolean hasNext() {
		System.out.println("ListIterator.hasNext");
		return null;
	}

	public Integer next() {
		System.out.println("ListIterator.next");
		return null;
	}

}