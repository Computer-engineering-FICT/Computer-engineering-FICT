package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

@Stored(name = "orderlist")
/**
 * ���� ����� �� �������� ������ ��������
 * @author Vova
 *
 */
public class OrderList {
	@Stored(name = "2", converter = intConverter.class)
	/**
	 * ���������������� ����� ����������� 
	 */
	private int profile_id;
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * ���������������� ����� ����������
	 */
	private int order_id;

	/**
	 * ������� ���������������� ����� �����������
	 * 
	 * @return ���������������� �����
	 */
	public int getProfile_id() {
		return profile_id;
	}

	/**
	 * ����� ���������� ���������������� ����� �����������
	 * 
	 * @param profile_id ���������������� ����� �����������
	 */
	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}

	/**
	 * ����� ������� ����� ����������
	 * 
	 * @return ����� ����������
	 */
	public int getOrder_id() {
		return order_id;
	}

	/**
	 * ����� ���������� ����� ����������
	 * 
	 * @param order_id ����� ���������
	 */
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

}
