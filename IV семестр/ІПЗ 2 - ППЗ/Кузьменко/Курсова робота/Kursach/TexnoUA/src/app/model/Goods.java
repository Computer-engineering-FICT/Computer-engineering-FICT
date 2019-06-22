package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;
@Stored(name = "goods")
/**
 * Клас моделі що представляє товар
 * @author Vova
 *
 */
public class Goods {
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * ідентифікаційний норме товару
	 */
	private int id;
	@Stored(name = "2", converter = intConverter.class)
	/**
	 * кількість товару на складі
	 */
	private int numberofgoods;
	@Stored(name = "3", converter = intConverter.class)
	/**
	 * вартість одиниці цього товару
	 */
	private int markofgoods;

/**
 * метод повертає ідентифікаційний номер
 * @return ідентифікаційний номер
 */
	public int getId() {
		return id;
	}
/**
 * метод встановлює ідентифікаційний номер 
 * @param id ідентифікаційний номе
 */
	public void setId(int id) {
		this.id = id;
	}
/**
 * метод повертає кількість товарів
 * @return кількість товарів
 */
	public int getNumberofgoods() {
		return numberofgoods;
	}
/**
 * метод встановлює кількість товарів
 * @param numberofgoods кілкьість товарів
 */
	public void setNumberofgoods(int numberofgoods) {
		this.numberofgoods = numberofgoods;
	}
/**
 * метод повертає ціну товару
 * @return ціна
 */
	public int getMarkofgoods() {
		return markofgoods;
	}
/**
 * метод встановлює ціну товару
 * @param markofgoods ціна товару
 */
	public void setMarkofgoods(int markofgoods) {
		this.markofgoods = markofgoods;
	}

}
