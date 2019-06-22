package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * Клас призначений для зберігання рядків таблиці "DESCRIPTION" з бази даних.
 * @author Коноз Андрій 
 */
@Stored(name = "DESCRIPTION")
public class Description {

	/**
	 * зберізає поле "ID"
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * зберізає поле "NAME"
	 */
	@Stored(name = "NAME")
	private String name;
	/**
	 * зберігає поле "COMMENT"
	 */
	@Stored(name = "COMMENT")
	private String text;
	/**
	 * зберігає поле "MAKER"
	 */
	@Stored(name = "MAKER")
	private String maker;
	
	/**
	 * Пустий конструктор для створення не ініціалізованого об'єкта.
	 */
	public Description(){
		
	}
	
	/**
	 * Конструктор для створення об'єкта з заданими параметрами.
	 * @param id "ID"
	 * @param name "NAME"
	 * @param text "COMMENT"
	 * @param maker "MAKER"
	 */
	public Description(int id, String name, String text, String maker){
		this.id = id;
		this.name = name;
		this.text = text;
		this.maker = maker;
	}
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}

}
