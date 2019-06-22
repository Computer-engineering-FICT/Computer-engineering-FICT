package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;
/**
 * Клас моделі. Представляє собою категорію користувача
 * @author Vova
 */
@Stored(name="category")
public class Category {
	/**
	 * ідентифікаційний номер категорії
	 */
	@Stored(name="1", converter = intConverter.class)
	private int id;
	/**
	 * категорія
	 */
	@Stored(name="2")
	private String category;
	/**
	 * повертає ідентифікаційний номер
	 * @return ідентифікаційний номер
	 */
	public int getId() {
		return id;
	}
	/**
	 *  встановлює ідентифікаційний номер
	 * @param id ідентифікаційний номер
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * повертає категорію
	 * @return категорія
	 */
	public String getCategory() {
		return category;
	}
	/**
	 * встановлює категорію
	 * @param category категорія
	 */
	public void setCategory(String category) {
		this.category = category;
	}

}
