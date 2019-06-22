package com.lab111.Lab9var9;

/**
 * Класс демонстрирует работу программы.
 * @author user
 * @version 9.9
 */
public final class TestMain {

	public static void main(String[] args) {
		DBLoader load1 = new DBLoader(DBShemaBuilder1.shema1);
		load1.construct();
		System.out.println();
		DBLoader load2 = new DBLoader(DBShemaBuilder2.shema2); 
		load2.construct();
	}
}
