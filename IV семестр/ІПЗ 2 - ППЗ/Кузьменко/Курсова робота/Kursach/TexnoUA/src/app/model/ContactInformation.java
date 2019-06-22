package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

@Stored(name = "contactinformation")
/**
 * Клас моделі що представляє контактну інформацію користувачів
 * @author Vova
 *
 */
public class ContactInformation {
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * ідентифікаційний номер контактної інформації
	 */
	private int id;
	@Stored(name = "2")
	/**
	 * номер телефону користувача
	 */
	private String telephone;
	@Stored(name = "3")
	/**
	 * адреса електронної пошти користувача
	 */
	private String email;
	@Stored(name = "4")
	/**
	 * домашня адреса користувача
	 */
	private String adress;
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
 * метод повертає номер телефону
 * @return номер телефну
 */
	public String getTelephone() {
		return telephone;
	}
/**
 * метод встановлює номер телефону 
 * @param telephone номер телефону
 */
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
/**
 * метод поервтає адресу електронної пошти
 * @return адреса електронної пошти
 */
	public String getEmail() {
		return email;
	}
/**
 * метод  встановлює адресу електронної пошти
 * @param email адреса електронної пошти
 */
	public void setEmail(String email) {
		this.email = email;
	}
/**
 *метод  повретає домашнью адресу
 * @return домашня адреса
 */
	public String getAdress() {
		return adress;
	}
/**
 * метод встановлює домашню адресе
 * @param adress
 */
	public void setAdress(String adress) {
		this.adress = adress;
	}

}
