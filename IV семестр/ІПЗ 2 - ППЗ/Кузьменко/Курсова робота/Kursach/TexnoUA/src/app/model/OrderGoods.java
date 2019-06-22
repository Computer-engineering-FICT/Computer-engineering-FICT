package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.BooleanConverter;
import dao.annotation.utils.converter.intConverter;

/**
 * Клас що представляє собою замовлення
 * 
 * @author Vova
 * 
 */
@Stored(name = "ordergoods")
public class OrderGoods {
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * ідентифікаційний номер замовлення
	 */
	private int id;
	@Stored(name = "2", converter = BooleanConverter.class)
	/**
	 * статус замовлення (оплачено/неполачено)
	 */
	private boolean IsPay;
	
	@Stored(name = "3", converter = BooleanConverter.class)
	private boolean isOnCourier;

	/**
	 * повертає статус замевлення
	 * 
	 * @return статус
	 */
	public boolean getIsPay() {
		return IsPay;
	}

	/**
	 * встановлює статус замовлення
	 * 
	 * @param isPay
	 *            статус
	 */
	public void setIsPay(boolean isPay) {
		IsPay = isPay;
	}

	/**
	 * повертає ідентифікаційний номер замовлення
	 * 
	 * @return ідентифікаційний номмер
	 */
	public int getId() {
		return id;
	}

	/**
	 * метод встановлює ідентифікаційний норме замовлення
	 * 
	 * @param id ідентифікаційний номер замовлення
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * метод повертає статус замовлення
	 * @return статус
	 */
	public boolean getIsOnCourier() {
		return isOnCourier;
	}
	/**
	 * метод встановлює статуст замолення
	 * @param isOnCourier статус
	 */
	public void setIsOnCourier(boolean isOnCourier) {
		this.isOnCourier = isOnCourier;
	}
}
