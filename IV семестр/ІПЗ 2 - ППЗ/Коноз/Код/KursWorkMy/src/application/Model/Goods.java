package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * ���� ������ ���� ����� ������� "Goods" � ���� �����.
 * @author ����� ����� 
 */
@Stored(name = "GOODS")
public class Goods {

	/**
	 * {@value} ������ �������� ����.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} ������ ������� ������.
	 */
	@Stored(name = "NUMBEROFGOODS", converter = intConverter.class)
	private int numberOfgoods;
	/**
	 * {@value} ������ �����������.
	 */
	@Stored(name = "MARKOFGOODS", converter = intConverter.class)
	private int mark;
	/**
	 * {@value} ������ ������.
	 */
	@Stored(name = "SHARE_ID", converter = intConverter.class)
	private int shareId;
	/**
	 * {@value} ������ ����.
	 */
	@Stored(name = "PRICE", converter = intConverter.class)
	private int price;
	/**
	 * {@value} ������ �����.
	 */
	@Stored(name = "NAME")
	private String name;
	
	
	/**
	 * ������ �����������.
	 */
	public Goods(){
		
	}
	/**
	 * �����������, ���� �������� �� ����.
	 * @param id �������� ����.
	 * @param numberOfgoods ������� ������.
	 * @param mark �����������.
	 * @param shareId ������.
	 * @param price ����.
	 * @param name �����.
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
