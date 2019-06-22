package com.lab111.Lab8var9;

/**
 * Класс в структуре паттерна Factory Method выполняет роль конкретного класса,
 * который определяет структуру, интерфейс объектов, 
 * вызываемых Фабричными методами классов, 
 * реализующих интерфейс {@link AggregatedStructure}.
 * @author user
 * @version 8.9
 * *	@see AggregatedStructure
 * @see AggregatedStructure#getIterator()
 * @see AggregatedStructure#getIterator(int)
 */
public class MyListIterator1 implements MyIterator<String>{
	/**
	 * Пустой конструктор класса. */
	public MyListIterator1(){
		System.out.println("MyListIterator1 - Конструктор класса без параметров.");
	};

	/**
	 * {@inheritDoc MyIterator}
	 * @see com.lab111.Lab8var9.MyIterator#hasNext()
	 */
	@Override
	public boolean hasNext() {
		System.out.println("Meтод hasNext без параметров. Возвращает булевское значение.");
		return false;
	}
	/**
	 * {@inheritDoc MyIterator}
	 * @see com.lab111.Lab8var9.MyIterator#next()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String next() {
		System.out.println("метод next без параметров, возвращает объект класса String.");
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
