package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

/**
 * ���� �����, �� ����� ������, �� ��������� ����������
 * 
 * @author Vova
 * 
 */
@Stored(name = "position")
public class Position {
	/**
	 * ���������������� ����� �������
	 */
	@Stored(name = "1", converter = intConverter.class)
	private int id;
	@Stored(name = "2", converter = intConverter.class)
	/**
	 * �������� ������ � �������
	 */
	private int count;
	@Stored(name = "3", converter = intConverter.class)
	/**
	 * ������������� ������
	 */
	private int goods_id;
	@Stored(name = "4", converter = intConverter.class)
	/**
	 * ������������� ����������
	 */
	private int order_id;

	/**
	 * ����� �� ������� ���������������� ����� ���������
	 * 
	 * @return ����� ����������
	 */
	public int getId() {
		return id;
	}

	/**
	 * ����� �� ���������� ���������������� ����� ����������
	 * 
	 * @param id
	 *            ���������������� ����� ����������
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * ����� �� ������� ������� ������ � �������
	 * 
	 * @return ������� ������
	 */
	public int getCount() {
		return count;
	}

	/**
	 * ����� �� ���������� ������� ������
	 * 
	 * @param count ������� ������
	 */
	public void setCount(int count) {
		this.count = count;
	}

	/**
	 * ����� �� ������� ����� ����������
	 * 
	 * @return ����� ����������
	 */
	public int getOrder_id() {
		return order_id;
	}

	/**
	 * ����� �� ���������� ����� ����������
	 * 
	 * @param order_id
	 *            ����� ����������
	 */
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	/**
	 * ����� �� ������� ����� ������
	 * 
	 * @return ����� ������
	 */
	public int getGoods_id() {
		return goods_id;
	}

	/**
	 * ����� �� ���������� ����� ������
	 * 
	 * @param goods_id
	 *            ����� ������
	 */
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
}
