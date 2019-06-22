package com.lab111.Lab9var9;

/**
 * В паттерне Builder выполняет роль конкретного класса-строителя,
 * инкапсулирующего стратегию конструирования частей объекта-продукта.
 * Реализует методы абстрактного класса {@link DBShema}.
 * @author user
 * @version 9.9
 */
public class DBShemaBuilder1 extends DBShema{
	/**
	 * Константное статическое поле класса, 
	 * содержащее ссылку на объект этого же класса. 
	 * Реализован паттерн Singleton. */
	public static final DBShemaBuilder1 shema1 = new DBShemaBuilder1();
	/**
	 * Конструктор класса без параметров. */
	private DBShemaBuilder1(){
		System.out.println("DBShemaBuilder1 - Конструктор класса");
	}
	/**
	 * {@inheritDoc}
	 * @see com.lab111.Lab9var9.DBShema#buildPartA()
	 */
	@Override
	void buildPartA() {
		System.out.println("Meтод buildPartA класса DBShemaBuilder1");		
	}
	/**
	 * {@inheritDoc}
	 * @see com.lab111.Lab9var9.DBShema#buildPartB()
	 */
	@Override
	void buildPartB() {
		System.out.println("Meтод buildPartB класса DBShemaBuilder1");		
	}
}
