package com.lab111.Lab8var9;

/**
 * Класс TestMain демонстрирует работу всех программ.
 * @author user
 * @version 8.9
 */
public final class TestMain {

	public static void main(String[] args) {
		AggregatedStructure<String> structure = new MyArrayList(); 
		structure.getIterator().next();
		System.out.println("structure.getIterator(3) = "+ structure.getIterator(3));
		System.out.println("structure.getIterator(1) = "+ structure.getIterator(1));
		System.out.println("structure.getIterator(2) = "+ structure.getIterator(2));		
		System.out.println("structure.getIterator(0) = "+ structure.getIterator(0));
	}
}
