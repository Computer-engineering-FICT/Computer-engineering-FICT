package com.lab111.Lab8var9;

/**
 * interface AggregatedStructure - Компонент в структуре паттерна Factory Method 
 * выполняет роль интерфейса,
 * который объявляет фабричные методы, 
 * возвращающие объект типа {@link Mylterator}. * 
 * @author user
 * @version 8.9
 * @param <T> - тип, который лежит в основе агрегированной СТРУКТУРЫ.
 */
public interface AggregatedStructure<T> {
	/**
	 * Метод должен формировать объект типа {@link MyIterator}, 
	 * который выполняет операции с объектами типа {@link Т}.
	 * @return объект типа {@link MyIterator}.	*/
	public <Т> MyIterator<T> getIterator();
	/**
	 * Метод должен Формировать объект типа {@link MyIterator}, 
	 * который выполняет операции с объектами типа {@link j§}. 
	 * Объект - итератор, который будет возвращен в результате выполнения метода,
	 * зависит от входного параметра.
	 * @param і - целочисленное значение, задающий условие возврата объекта-итератора.
	 * @return объект типа {@link MyIterator}.
	*/
	public MyIterator<T> getIterator(int і);
}
