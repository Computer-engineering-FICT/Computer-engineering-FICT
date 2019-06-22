package com.lab111.Lab9var9;

/**
 * В паттерне Builder выполняет роль объекта - распорядителя, 
 * который инкапсулирует стратегию сборки объекта. 
 * Агрегирует интерфейс объекта - строителя.
 * @author user
 * @version 9.9
 */
public class DBLoader {
	/**
	 * Ссылка на объект - строитель.
	 * @see DBShema */
	private DBShema shema;
	/**
	 * Конструктор класса, инициализирует значение поля {@link #shema>.
	 * @param s объект, реализующий интерфейс {@link DBShema}
	 * @see DBShema */
	public DBLoader(DBShema s){ 
		shema = s;
	}
	/**
	 * Конструктор класса без параметров. */
	public DBLoader(){
		System.out.println("DBLoader - Конструктор класса");
	}
	/**
	 * Метод инкапсулирует стратегию сборки объекта.
	 * Для конструирования объекта используются методы объекта, 
	 * реализующего интерфейс {@linkDBShema}.
	 * @see Table
	 * @see DBShema */
	public void construct() {
		shema.createNewTable();
		shema.buildPartA();
		shema.buildPartB();
		getProduct();
	}
	/**
	 * Метод возвращает ссылку на готовый продукт.
	 * @return объект класса {@link Table}
	 * @see Table */
	public Table getProduct(){
		return shema.getMyTable();
	}
	/**
	 * Метод устанавливает значение полю {@link #shema).
	 * @param s объект, реализующий интерфейс {@link DBShema}
	 * @see DBShema */
	public void setDBShema(DBShema s){ 
		shema = s;
	}
}
