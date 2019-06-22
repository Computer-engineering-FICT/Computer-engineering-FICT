package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * ���� ����������� ��� ��������� ����� � ������� "Googs has description" � ���� �����.
 * @author ����� ����� 
 */
@Stored(name = "GOODS_HAS_DESCRIPTION")
public class GoodsHasDescription {

	/**
	 * ������ ���� "ID"
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * ������ ���� "GOODS_ID"
	 */
	@Stored(name = "GOODS_ID")
	private int goodsId;
	/**
	 * ������ ���� "DESCRIPTION_ID"
	 */
	@Stored(name = "DESCRIPTION_ID")
	private int descriptionId;
	
	/**
	 * ������ �����������
	 */
	public GoodsHasDescription(){
		
	}
	/**
	 * �����������, ���� ������� ��'��� � �������� �����������.
	 * @param id ���� "ID"
	 * @param goodsId ���� "GOODS_ID"
	 * @param descriptionId ���� "DESCRIPTION_ID"
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
