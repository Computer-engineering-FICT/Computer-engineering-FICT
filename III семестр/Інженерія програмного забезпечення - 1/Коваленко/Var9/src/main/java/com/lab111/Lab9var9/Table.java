package com.lab111.Lab9var9;

/**
 * В паттерне Builder выполняет роль объекта-продукта,
 * который конструируется объектом, реализующим интерфейс {@link DBShema}
 * по алгоритму, заданному в объекте класса {@link DBLoader}.
 * @author user
 * @version 9.9
 */
public class Table {
	/**
	 * Конструктор класса без параметров.*/
	public Table() {
		System.out.println("Table - Конструктор класса");
	}
}
