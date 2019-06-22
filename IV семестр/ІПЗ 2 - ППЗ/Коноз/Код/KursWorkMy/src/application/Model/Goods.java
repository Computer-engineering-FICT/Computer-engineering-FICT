package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 *  дас збер≥гаЇ пол€ р€дка таблиц≥ "Goods" з бази даних.
 * @author  оноз јндр≥й 
 */
@Stored(name = "GOODS")
public class Goods {

	/**
	 * {@value} «бер≥гаЇ основний ключ.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} «бер≥гаЇ к≥льк≥сть товару.
	 */
	@Stored(name = "NUMBEROFGOODS", converter = intConverter.class)
	private int numberOfgoods;
	/**
	 * {@value} «бер≥гаЇ попул€рн≥сть.
	 */
	@Stored(name = "MARKOFGOODS", converter = intConverter.class)
	private int mark;
	/**
	 * {@value} «бер≥гаЇ знижку.
	 */
	@Stored(name = "SHARE_ID", converter = intConverter.class)
	private int shareId;
	/**
	 * {@value} «бер≥гаЇ ц≥ну.
	 */
	@Stored(name = "PRICE", converter = intConverter.class)
	private int price;
	/**
	 * {@value} «бер≥гаЇ назву.
	 */
	@Stored(name = "NAME")
	private String name;
	
	
	/**
	 * ѕустий конструктор.
	 */
	public Goods(){
		
	}
	/**
	 *  онструктор, €кий ≥н≥ц≥ал≥зуЇ вс≥ пол€.
	 * @param id основний ключ.
	 * @param numberOfgoods к≥льк≥сть товару.
	 * @param mark попул€рн≥сть.
	 * @param shareId знижка.
	 * @param price ц≥на.
	 * @param name назва.
	 */
	public Goods(int id, int numberOfgoods, int mark, int shareId, int price, String name){
		this.id = id;
		this.numberOfgoods = numberOfgoods;
		this.mark = mark;
		this.shareId = shareId;
		this.price = price;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNumberOfgoods() {
		return numberOfgoods;
	}
	public void setNumberOfgoods(int numberOfgoods) {
		this.numberOfgoods = numberOfgoods;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	public int getShareId() {
		return shareId;
	}
	public void setShareId(int shareId) {
		this.shareId = shareId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
