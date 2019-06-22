package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * Клас реалізує набір полів рядка з таблиці "Catalog" бази даних
 * @author Коноз Андрій 
 */
@Stored(name="CATALOG")
public class Catalog {

	/**
	 * {@value} значення id.
	 */
	@Primary
	@Stored(name="ID", converter= intConverter.class)
	private int id;
	
	/**
	 * {@value} зберігає назву каталога.
	 */
	@Stored(name="NAME")
	private String name;
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	/**
	 * Пустий конструктор.
	 */
	public Catalog(){
		
	}
	
	/**
	 * Конструктор, який ініціалізує всі поля.
	 * @param id основний ключ.
	 * @param name назва каталогу.
	 */
	public Catalog(int id, String name){
		this.id = id;
		this.name = name;
	}

}
