package controller;

import java.util.Hashtable;

/**
 * Клас представляє собою контейнер для о'єкта типу {@link Hashtable}
 * в якому передаються параметри контекста контролеру.
 * @author Коноз Андрій 
 */
public class ContextForCommand {

	/**
	 * {@value} таблиця, в якій зберігаються параметри контексту.
	 */
	private Hashtable<String, Object> table;
	
	/**
	 * Конструктор, який при створення ініціалізує внутрішню таблицю.
	 */
	public ContextForCommand(){
		table = new Hashtable<>();
	}
	
	/**
	 * Заносить в таблицю параметр контексту.
	 * @param key ключ параметра.
	 * @param value знасення параметра.
	 */
	public void put(String key, Object value){
		table.put(key, value);
	}
	/**
	 * @return повертає внутрішню таблицю типу {@link Hashtable}
	 */
	public Hashtable<String, Object> getHashTable(){
		return table;
	}

}
