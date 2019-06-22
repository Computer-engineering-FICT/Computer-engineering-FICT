package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

@Stored(name = "Description")
/**
 * Клас моделі що представляє опис товару
 * @author Vova
 *
 */
public class Description {
	/**
	 * ідентифікаційний номер опису
	 */
	@Stored(name = "1", converter = intConverter.class)
	private int id;
	@Stored(name = "2")
	/**
	 * ім'я товару
	 */
	private String name;
	@Stored(name = "3")
	/**
	 * характеристики товару
	 */
	private String comment;
	@Stored(name = "4")
	/**
	 * виробник товару
	 */
	private String maker;
/**
 * метод повертає ідентифікаційний номер
 * @return ідентифікаційний номер
 */
	public int getId() {
		return id;
	}
/**
 * метод встановлює ідентифікаційний номер
 * @param id ідентифікаційний номер
 */
	public void setId(int id) {
		this.id = id;
	}
/**
 * метод повертає ім’я
 * @return ім’я
 */
	public String getName() {
		return name;
	}
/**
 * метод встановлює ім’я
 * @param name ім’я
 */
	public void setName(String name) {
		this.name = name;
	}
/**
 * метод повертає характеристики
 * @return характеристики
 */
	public String getComment() {
		return comment;
	}
/**
 * метод встановлює характеристики
 * @param comment характеристика
 */
	public void setComment(String comment) {
		this.comment = comment;
	}
/**
 * метод повертає виробника
 * @return виробник
 */
	public String getMaker() {
		return maker;
	}
/**
 * метод встановлює виробника
 * @param maker виробник
 */
	public void setMaker(String maker) {
		this.maker = maker;
	}
}
