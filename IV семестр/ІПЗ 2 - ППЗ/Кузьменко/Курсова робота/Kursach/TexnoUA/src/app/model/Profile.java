package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

/**
 * клас моделі що відображає інформацію користувача
 * 
 * @author Vova
 * 
 */

@Stored(name = "profile")
public class Profile {
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * 	ідентифікаційний номер користувача
	 */
	private int id;
	@Stored(name = "2")
	/**
	 * логін користувача
	 */
	private String login;
	@Stored(name = "3")
	/**
	 * пароль користувача
	 */
	private String password;
	@Stored(name = "4", converter = intConverter.class)
	/**
	 * ідентифікаційний номер стану користувача
	 */
	private int state_id;
	@Stored(name = "5", converter = intConverter.class)
	/**
	 * ідентифікаційний номер контанктної інформації користувача
	 */
	private int contactinformation_id;
	@Stored(name = "6", converter = intConverter.class)
	/**
	 * іжентифікаційний норме категорії користувача
	 */
	private int category_id;

	/**
	 * метод поретає ідентифікаційний номер користувача
	 * 
	 * @return ідентифікаційний нормер
	 */
	public int getId() {
		return id;
	}

	/**
	 * метод встановлює ідентифікаційний номер
	 * 
	 * @param id ідентиіфкаційний номер
	 */
	public void setId(int id) {

		this.id = id;
	}

	/**
	 * метод повертає логін
	 * 
	 * @return логін
	 */
	public String getLogin() {
		return login;
	}

	/**
	 * метод встановляє логін
	 * 
	 * @param login
	 *            логін
	 */
	public void setLogin(String login) {

		this.login = login;
	}

	/**
	 * метод повертає пароль
	 * 
	 * @return пароль
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * метод встановляє пароль
	 * 
	 * @param password
	 *            пароль
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * метод повертає номер стану корисутвача
	 * 
	 * @return номер стану
	 */
	public int getState_id() {
		return state_id;
	}

	/**
	 * метод встановляє номер стану користувача
	 * 
	 * @param state_id
	 *            номер стану
	 */
	public void setState_id(int state_id) {
		this.state_id = state_id;

	}

	/**
	 * метод повертає номер контактної інормації користувача
	 * 
	 * @return номер контантної інформації
	 */
	public int getContactinformation_id() {
		return contactinformation_id;
	}

	/**
	 * метод встановлює номер контактної інормації користувача
	 * 
	 * @param contactinformation_id
	 *            номер контактної інормації
	 */
	public void setContactinformation_id(int contactinformation_id) {
		this.contactinformation_id = contactinformation_id;

	}

	/**
	 * метод повертає номер категорії користувача
	 * 
	 * @return номер категорії користувача
	 */
	public int getCategory_id() {
		return category_id;
	}

	/**
	 * метод встановлює номер категорії користувача
	 * 
	 * @param category_id
	 *            номер категорії
	 */
	public void setCategory_id(int category_id) {
		this.category_id = category_id;

	}
}
