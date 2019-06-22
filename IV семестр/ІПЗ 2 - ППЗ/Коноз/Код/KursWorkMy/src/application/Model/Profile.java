package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.*;
/**
 * Клас зберігає поля таблиці "Profile" з бази даних.
 * @author Коноз Андрій 
 */
@Stored(name="PROFILE") 
public class Profile {
	/**
	 * {@value} Зберігає значення основного ключа.
	 */
	@Stored(name="ID", converter= intConverter.class)
	@Primary
	private int id;
	
	/**
	 * @param private java.lang.String login
	 */
	
	
	
	/**
	 * {@value}  Зберігає логін.
	 */
	@Stored(name="LOGIN")
	private String login;
	/**
	 * {@value}   Зберігає пароль.
	 */
	@Stored(name="PASSWORD")
	private String password;
	/**
	 * {@value} Зберігає стан профілю.
	 */
	@Stored(name="STATE_ID", converter = intConverter.class)
	private int state;
	/**
	 * {@value} Зберігає контактну інформацію.
	 */
	@Stored(name="CONTACTINFORMATION_ID", converter = intConverter.class)
	private int contactinform;
	/**
	 * {@value} Зберігає клас користувача.
	 */
	@Stored(name="CATEGORY_ID", converter = intConverter.class)
	private int category;
	
	/**
	 * Пустий конструктор.
	 */
	public Profile(){
		
	}
	
	/**
	 * Конструктор, який ініціалізує всі поля.
	 * @param id основний ключ
	 * @param login логін
	 * @param password пароль
	 * @param state стан
	 * @param contactinform контактна інформація
	 * @param category категорія
	 */
	public Profile(int id, String login, String password, int state, int contactinform, int category){
		this.setId(id);
		this.setLogin(login);
		this.setPassword(password);
		this.setState(state);
		this.setContactinform(contactinform);
		this.setCategory(category);
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getContactinform() {
		return contactinform;
	}

	public void setContactinform(int contactinform) {
		this.contactinform = contactinform;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	


}
