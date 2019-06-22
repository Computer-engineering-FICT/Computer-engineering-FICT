package com.lab111.Lab8var9;

import java.util.ArrayList;

/**
 * Класс реализует агрегированную структуру. 
 * В структуре паттерна Factory Method выполняет роль класса, 
 * реализующего Фабричные методы интерфейса {@link AggregatedStructure}.
 * @author user
 * @version 8.9
 * @see AggregatedStructure
 */
public class MyArrayList implements AggregatedStructure<String>{
	/**
	 * агрегированная структура. */
	private ArrayList<String> myList;
	/**
	 * Конструктор класса без параметров.	*/
	public MyArrayList(){
		System.out.println("MyArrayList - Конструктор класса без параметров.");
	};
	/**
	 * Возвращает объект класса {@link MyListlteratorl}.
	 * @see com.lab111.Lab8var9.AggregatedStructure#getIteraton()
	 */
	@Override
	public MyIterator<String> getIterator() {
		return new MyListIterator1();		
	}
	/**
	 * В зависимости от входного параметра, метод может возвратить
	 * {@link MyListlteratorl}, {@link MyListIterator2} или
	 * <code>null</code>.
	 * @param і - параметр, указывающий,
	 *  объект какого класса должен	быть инстанцирован. 
	 *  Если і = 0 - возвращается объект класса	{@link MyListIteratorl}, 
	 *  если і = 1 - {@link MyListIterator2},
	 *  в ином случае возвращается <code>null</code>.
	 *  @see MyListIterator1
	 *  @see MyListIterator2
	 *  @see Mylterator
	 *  @see com.lab111.Lab8var9.AggregatedStructure#getIterator(int) */
	@Override
	public MyIterator<String> getIterator(int і) {
		switch (і){ 
		case 0:	return new MyListIterator1(); 
		case 1:	return new MyListIterator2(); 
		default: return null;
		}
	}
	/**
	 * Метод возвращает значение поля {@link #myList}.
	 * @return объект класса {@link ArrayList}
	 * @see ArrayList */
	public ArrayList<String> getMyList() { 
		return myList;
	}
	public void setMyList(ArrayList<String> myList) { 
		this.myList = myList;
	}	
}
