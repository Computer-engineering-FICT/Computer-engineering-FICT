package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

@Stored(name = "orderlist")
/**
 * Клас моделі що відображає список замолень
 * @author Vova
 *
 */
public class OrderList {
	@Stored(name = "2", converter = intConverter.class)
	/**
	 * ідентифікаційний номер користувача 
	 */
	private int profile_id;
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * ідентифікацйійний номер замовлення
	 */
	private int order_id;

	/**
	 * повертає ідентифікаційний норме користувача
	 * 
	 * @return ідентифікаційний номер
	 */
	public int getProfile_id() {
		return profile_id;
	}

	/**
	 * метод встановлює ідентифікацййний номер користувача
	 * 
	 * @param profile_id ідентифікаційний номер користувача
	 */
	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}

	/**
	 * метод повертає номер замовлення
	 * 
	 * @return номер замовлення
	 */
	public int getOrder_id() {
		return order_id;
	}

	/**
	 * метод встановлює номер замовлення
	 * 
	 * @param order_id номер замолення
	 */
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

}
