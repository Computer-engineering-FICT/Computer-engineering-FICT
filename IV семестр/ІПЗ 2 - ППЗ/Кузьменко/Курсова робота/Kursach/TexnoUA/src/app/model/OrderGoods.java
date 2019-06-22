package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.BooleanConverter;
import dao.annotation.utils.converter.intConverter;

/**
 * ���� �� ����������� ����� ����������
 * 
 * @author Vova
 * 
 */
@Stored(name = "ordergoods")
public class OrderGoods {
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * ���������������� ����� ����������
	 */
	private int id;
	@Stored(name = "2", converter = BooleanConverter.class)
	/**
	 * ������ ���������� (��������/����������)
	 */
	private boolean IsPay;
	
	@Stored(name = "3", converter = BooleanConverter.class)
	private boolean isOnCourier;

	/**
	 * ������� ������ ����������
	 * 
	 * @return ������
	 */
	public boolean getIsPay() {
		return IsPay;
	}

	/**
	 * ���������� ������ ����������
	 * 
	 * @param isPay
	 *            ������
	 */
	public void setIsPay(boolean isPay) {
		IsPay = isPay;
	}

	/**
	 * ������� ���������������� ����� ����������
	 * 
	 * @return ���������������� ������
	 */
	public int getId() {
		return id;
	}

	/**
	 * ����� ���������� ���������������� ����� ����������
	 * 
	 * @param id ���������������� ����� ����������
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * ����� ������� ������ ����������
	 * @return ������
	 */
	public boolean getIsOnCourier() {
		return isOnCourier;
	}
	/**
	 * ����� ���������� ������� ���������
	 * @param isOnCourier ������
	 */
	public void setIsOnCourier(boolean isOnCourier) {
		this.isOnCourier = isOnCourier;
	}
}
