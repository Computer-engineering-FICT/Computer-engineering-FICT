package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;
@Stored (name = "goods_has_description")
/**
 * ���� ����� �� ����������� ����� ��*���� �� ������� �� ������
 * @author Vova
 *
 */
public class Goods_has_Description {
	/**
	 * ���������������� ����� ������
	 */
	@Stored(name = "1", converter = intConverter.class)
	private int goods_id;
	/**
	 * ���������������� ����� �����
	 */
	@Stored(name = "2", converter = intConverter.class)
	private int description_id;
	/**
	 * ������� ���������������� ����� ������
	 * @return ���������������� �����
	 */
	public int getGoods_id() {
		return goods_id;
	}
	/**
	 * ����� ���������� ���������������� ����� ������
	 * @param goods_id ���������������� �����
	 */
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	/**
	 * ����� ������� ���������������� ����� �����
	 * @return ���������������� �����
	 */
	public int getDescription_id() {
		return description_id;
	}
	/**
	 * ����� ���������� ���������������� ����� �����
	 * @param description_id
	 */
	public void setDescription_id(int description_id) {
		this.description_id = description_id;
	}

}
