package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * Клас, який зберігає поля рядка таблиці "ContactInformation"  з бази даних.
 * @author Коноз Андрій 
 */
@Stored(name = "CONTACTINFORMATION")
public class ContactInformation {

	/**
	 * {@value} Основний ключ.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} Номер телефону.
	 */
	@Stored(name = "TELEPHONE", converter = intConverter.class)
	private int telepfone;
	/**
	 * {@value} Електронна адреса.
	 */
	@Stored(name = "EMAIL")
	private String email;
	/**
	 * {@value} Адреса проживання.
	 */
	@Stored(name = "ADRESS")
	private String adress;
	
	
	/**
	 * Пустий конструктор.
	 */
	public ContactInformation(){
		
	}
	
	/**
	 * Конструктор, який ініціалізує всі поля.
	 * @param id основний ключ.
	 * @param telepfone телефон.
	 * @param email електронна пошта.
	 * @param adress адреса.
	 */
	public ContactInformation(int id, int telepfone, String email, String adress){
		this.id = id;
		this.telepfone = telepfone;
		this.email = email;
		this.adress = adress;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTelepfone() {
		return telepfone;
	}
	public void setTelepfone(int telepfone) {
		this.telepfone = telepfone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}

}
