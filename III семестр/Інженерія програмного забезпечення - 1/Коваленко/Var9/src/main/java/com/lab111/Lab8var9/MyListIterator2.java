package com.lab111.Lab8var9;

/**
 * Класс в структуре паттерна Factory Method выполняет роль конкретного класса;
 * который определяет структуру, интерфейс объектов, 
 * вызываемых фабричными методами классов, 
 * реализующих интерфейс {@link AggregatedStructure}.
 * @author user
 * @version 8.9
 * @see AggregatedStructure
 * @see AggregatedStructure#getIterator()
 * @see AggregatedStructure#getIterator(int)
 */
public class MyListIterator2 implements MyIterator<String>{
	/**
	 * Пустой конструктор класса.*/
	public MyListIterator2(){
		System.out.println("MyListIterator2 - Конструктор класса без параметров.");
	};
	/**
	 * {@inheritDoc MyIterator}
	 * @see com.lab111.Lab8var9.MyIterator#hasNext()
	 */
	@Override
	public boolean hasNext() {
		System.out.println("Meтод hasNext без параметров"); 
		return false;
	}
	/**
	 * {@inheritDoc MyIterator}
	 * @see com.lab111.Lab8var9.MyIterator#next()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String next() {
		System.out.println("Meтод next без параметров, возвращает объект класса String");
		return null;
	}
	/**
	 * {@inheritDoc MyIterator}
	 * @see com.lab111.Lab8var9.MyIterator#skipTo()
	 */
	@Override
	public String skipTo() {
		System.out.println("метод skipTo без параметров. Возвращает объект класса String.");
		return null;
	}
}
