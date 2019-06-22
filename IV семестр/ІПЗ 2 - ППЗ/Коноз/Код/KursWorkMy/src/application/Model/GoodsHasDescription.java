package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * Клас призначений для зберігання рядків з таблиці "Googs has description" з бази даних.
 * @author Коноз Андрій 
 */
@Stored(name = "GOODS_HAS_DESCRIPTION")
public class GoodsHasDescription {

	/**
	 * зберігає поле "ID"
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * зберігає поле "GOODS_ID"
	 */
	@Stored(name = "GOODS_ID")
	private int goodsId;
	/**
	 * зберігає поле "DESCRIPTION_ID"
	 */
	@Stored(name = "DESCRIPTION_ID")
	private int descriptionId;
	
	/**
	 * Пустий конструктор
	 */
	public GoodsHasDescription(){
		
	}
	/**
	 * Конструктор, який створює об'єкт з заданими параметрами.
	 * @param id поле "ID"
	 * @param goodsId поле "GOODS_ID"
	 * @param descriptionId поле "DESCRIPTION_ID"
	 */
	public GoodsHasDescription(int id, int goodsId, int descriptionId){
		this.id = id;
		this.goodsId = goodsId;
		this.descriptionId = descriptionId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getDescriptionId() {
		return descriptionId;
	}
	public void setDescriptionId(int descriptionId) {
		this.descriptionId = descriptionId;
	}
	

}
