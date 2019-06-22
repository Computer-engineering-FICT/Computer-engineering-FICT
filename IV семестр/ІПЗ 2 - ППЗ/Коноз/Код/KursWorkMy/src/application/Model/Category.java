package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * Клас, який зберігає поля рядка таблиці "Category" з бази даних.
 * @author Коноз Андрій 
 */
@Stored(name = "CATEGORY")
public class Category {

	/**
	 * {@value} Основний ключ.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} Категорія.
	 */
	@Stored(name = "CATEGORY")
	private String category;
	
	/**
	 * Пустий конструктор.
	 */
	public Category(){
		
	}
	
	/**
	 * Конструктор, який ініціалізує всі поля.
	 * @param id основний ключ.
	 * @param category категорія.
	 */
	public Category(int id, String category){
		this.id = id;
		this.category = category;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

}
