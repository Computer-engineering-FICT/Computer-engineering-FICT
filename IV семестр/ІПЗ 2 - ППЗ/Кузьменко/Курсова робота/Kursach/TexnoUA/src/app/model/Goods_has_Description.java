package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;
@Stored (name = "goods_has_description")
/**
 * Клас моделі що представлює собою зв*язок між товаром та описом
 * @author Vova
 *
 */
public class Goods_has_Description {
	/**
	 * ідентифікаційний номер товару
	 */
	@Stored(name = "1", converter = intConverter.class)
	private int goods_id;
	/**
	 * ідентифікаційний номер опису
	 */
	@Stored(name = "2", converter = intConverter.class)
	private int description_id;
	/**
	 * повертає ідентифікаційний номер товару
	 * @return ідентифікаційний номер
	 */
	public int getGoods_id() {
		return goods_id;
	}
	/**
	 * метод встановлює ідентифікаційний номер товару
	 * @param goods_id ідентифікаційний номер
	 */
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	/**
	 * метод повертає ідентифікаційний номер опису
	 * @return ідентифікаційний номер
	 */
	public int getDescription_id() {
		return description_id;
	}
	/**
	 * метод встановлює ідентифікаційний номер опису
	 * @param description_id
	 */
	public void setDescription_id(int description_id) {
		this.description_id = description_id;
	}

}
