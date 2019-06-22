package com.lab111.Lab9var9;

/**
 * В паттерне Builder выполняет роль конкретного класса-строителя,
 * инкапсулирующего стратегию конструирования частей объекта-продукта.
 * @author user
 * @version 9.9
 */
public class DBShemaBuilder2 extends DBShema{
	/**
	 * Константное статическое поле класса, 
	 * содержащее ссылку на объект этого же класса. 
	 * Реализован паттерн Singleton.
	 * */
	public static final DBShemaBuilder2 shema2 = new DBShemaBuilder2();
	/**
	 * Конструктор класса без параметров.*/
	private DBShemaBuilder2(){
		System.out.println("DBShemaBuilder2 - Конструктор класса");
	};
	/**
	 * {@inheritDoc}
	 * @see com.lab111.Lab9var9.DBShema#buildPartA()
	 */
	@Override
	void buildPartA() {
		System.out.println("Meтод buildPartA класса DBShemaBuilder2");
	}
	/**
	 * {@inheritDoc}
	 * @see com.lab111.Lab9var9.DBShema#buildPartB()
	 */
	@Override
	void buildPartB() {
		System.out.println("Meтод buildPartB класса DBShemaBuilder2");		
	}
}
