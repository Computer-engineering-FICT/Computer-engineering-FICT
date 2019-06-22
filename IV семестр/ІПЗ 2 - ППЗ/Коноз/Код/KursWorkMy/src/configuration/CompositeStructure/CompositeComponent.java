package configuration.CompositeStructure;

import java.util.Properties;

/**
 * Клас є інтерфейсом для елементів композитної структури
 * конфігурації. Він є нащадком класу {@link Properties},
 * а  також додає власні методи для роботи з 
 * ієрархічною структурою.
 * @author Коноз Андрій 
 */
public abstract class CompositeComponent extends Properties {
	
	/**
	 * Метод записує у файл об'єкт, у якого було викликано
	 * цей метод. Адреса, для запису задається при створенні
	 * об'єкта.
	 */
	public abstract void save();
	/**
	 * Метод наповнює об'єкт, у якого було викликано цей метод
	 * інформацією з файла. 
	 * @param savePath адреса файла
	 */
	public abstract void load(String savePath);
	/**
	 * Метод для отримання адреси збереження.
	 * @return адресу, за якою буде зберігатися файл
	 */
	public abstract String getPath();
	/**
	 * Метод для отримання імені компонета.
	 * @return повертає ім'я компонета.
	 */
	public abstract String getName();
	/**
	 * Метод повертає об'єкт типу {@link CompositeComponent}, 
	 * ім'я якого було передано методу в якості аргументу.
	 * @param name назва компонета, який потрібно повернути.
	 * @return об'єкт типу {@link CompositeComponent}, якщо об'єкт
	 * з таким іменем присутній в композиті. В іншому разі повертає <code>null</code>
	 */
	public abstract CompositeComponent getProperties(String name);
	/**
	 * Метод додає до даного композиту об'єкт типу {@link CompositeComponent}.
	 * @param comp об'єкт, який потрібно включити в композиту.
	 */
	public abstract void addComponent(CompositeComponent comp);
}
