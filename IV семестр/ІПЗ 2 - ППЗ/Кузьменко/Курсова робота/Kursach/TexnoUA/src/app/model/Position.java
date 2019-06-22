package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

/**
 * Клас моделі, що зв’язує товари, та конкретне замовлення
 * 
 * @author Vova
 * 
 */
@Stored(name = "position")
public class Position {
	/**
	 * ідентифікаційний номер позиції
	 */
	@Stored(name = "1", converter = intConverter.class)
	private int id;
	@Stored(name = "2", converter = intConverter.class)
	/**
	 * кілкьість товару у позиції
	 */
	private int count;
	@Stored(name = "3", converter = intConverter.class)
	/**
	 * ідентифікатор товару
	 */
	private int goods_id;
	@Stored(name = "4", converter = intConverter.class)
	/**
	 * ідентифікатор замовлення
	 */
	private int order_id;

	/**
	 * метод що повретає ідентифікаційний норер замолення
	 * 
	 * @return номер замовлення
	 */
	public int getId() {
		return id;
	}

	/**
	 * метод що встановлює ідентифікаційний номер замовлення
	 * 
	 * @param id
	 *            ідентифікаційний номер замовлення
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * метод що повертає кількість товарів в позиції
	 * 
	 * @return кількість товарів
	 */
	public int getCount() {
		return count;
	}

	/**
	 * метод що встановлює кількість товарів
	 * 
	 * @param count кількість товарів
	 */
	public void setCount(int count) {
		this.count = count;
	}

	/**
	 * метод що повертає номер замовлення
	 * 
	 * @return номер замовлення
	 */
	public int getOrder_id() {
		return order_id;
	}

	/**
	 * метод що встановлює номер замовлення
	 * 
	 * @param order_id
	 *            номер замовлення
	 */
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	/**
	 * метод що повертає номер товару
	 * 
	 * @return номер товару
	 */
	public int getGoods_id() {
		return goods_id;
	}

	/**
	 * метод що встановлює номер товару
	 * 
	 * @param goods_id
	 *            номер товару
	 */
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
}
