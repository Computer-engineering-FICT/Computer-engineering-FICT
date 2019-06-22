package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;
/**
 * ���� �����. ����������� ����� �������� �����������
 * @author Vova
 */
@Stored(name="category")
public class Category {
	/**
	 * ���������������� ����� �������
	 */
	@Stored(name="1", converter = intConverter.class)
	private int id;
	/**
	 * ��������
	 */
	@Stored(name="2")
	private String category;
	/**
	 * ������� ���������������� �����
	 * @return ���������������� �����
	 */
	public int getId() {
		return id;
	}
	/**
	 *  ���������� ���������������� �����
	 * @param id ���������������� �����
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * ������� ��������
	 * @return ��������
	 */
	public String getCategory() {
		return category;
	}
	/**
	 * ���������� ��������
	 * @param category ��������
	 */
	public void setCategory(String category) {
		this.category = category;
	}

}
