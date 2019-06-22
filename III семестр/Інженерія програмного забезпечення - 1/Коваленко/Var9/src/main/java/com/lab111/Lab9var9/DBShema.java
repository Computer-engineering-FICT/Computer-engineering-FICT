package com.lab111.Lab9var9;

/**
 * Абстрактный класс в паттерне Builder выполняет роль компоненты,
 * которая содержит в себе перечень всех возможных абстрактных методов
 * для создания сложного объекта.
 * Позволяет объектам - стоителям реализовать методы для конструирования объекта.
 * Содержит ССЫЛКУ на результирующий объект.
 * @author user
 * @version 9.9
 */
public abstract class DBShema {
	/**
	 * ссылка на объект - продукт */
	private Table myTable;
	/**
	 * Метод присваивает полю {@link #myTable} ССЫЛКУ 
	 * на созданный объект класса {@link Table}.
	 * @see Table */
	public void createNewTable(){
		myTable = new Table();
	}
	/**
	 * Метод определяет стратегию конструирования определенной части объекта-продукта */
	abstract void buildPartA();
	/**
	 * Метод определяет стратегию конструирования определенной части объекта-продукта */
	abstract void buildPartB();
	/**
	 * Метод возвращает значение поля {@link #myTable}.
	 * @return объект класса {@link Table}
	*/
	public Table getMyTable() { 
		return myTable;
	}
}
