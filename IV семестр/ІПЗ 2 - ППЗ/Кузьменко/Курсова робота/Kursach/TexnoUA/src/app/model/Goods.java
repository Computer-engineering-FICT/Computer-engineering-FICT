package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;
@Stored(name = "goods")
/**
 * ���� ����� �� ����������� �����
 * @author Vova
 *
 */
public class Goods {
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * ���������������� ����� ������
	 */
	private int id;
	@Stored(name = "2", converter = intConverter.class)
	/**
	 * ������� ������ �� �����
	 */
	private int numberofgoods;
	@Stored(name = "3", converter = intConverter.class)
	/**
	 * ������� ������� ����� ������
	 */
	private int markofgoods;

/**
 * ����� ������� ���������������� �����
 * @return ���������������� �����
 */
	public int getId() {
		return id;
	}
/**
 * ����� ���������� ���������������� ����� 
 * @param id ���������������� ����
 */
	public void setId(int id) {
		this.id = id;
	}
/**
 * ����� ������� ������� ������
 * @return ������� ������
 */
	public int getNumberofgoods() {
		return numberofgoods;
	}
/**
 * ����� ���������� ������� ������
 * @param numberofgoods �������� ������
 */
	public void setNumberofgoods(int numberofgoods) {
		this.numberofgoods = numberofgoods;
	}
/**
 * ����� ������� ���� ������
 * @return ����
 */
	public int getMarkofgoods() {
		return markofgoods;
	}
/**
 * ����� ���������� ���� ������
 * @param markofgoods ���� ������
 */
	public void setMarkofgoods(int markofgoods) {
		this.markofgoods = markofgoods;
	}

}
