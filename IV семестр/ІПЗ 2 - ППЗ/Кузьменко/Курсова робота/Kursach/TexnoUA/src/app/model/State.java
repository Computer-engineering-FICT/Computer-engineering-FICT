package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;
/**
 * @author Vova
 *	клас моделі, що  визначає стан користувача
 */
@Stored(name="state")

public class State {
/**
 * 	ідентифікаційний норме стану
 */
	@Stored(name = "1", converter = intConverter.class)
	private int id;
	/**
	 * стан
	 */
	@Stored (name="2")
	private String state;

/**
 * метод що повертає ідентифікаційний номер стану
 * @return ідентифікаційний номер
 */
	public int getId() {
		return id;
	}
/**
 * метод що встановлює ідентифікаційний номер стану
 * @param id ідентифікаційний номер стану
 */
	public void setId(int id) {
		this.id = id;
	}
/**
 * метод що повертає стан
 * @return стан
 */
	public String getState() {
		return state;
	}
/**
 * метод що встановляє стан користувача
 * @param state стан
 */
	public void setState(String state) {
		this.state = state;
	}

}
