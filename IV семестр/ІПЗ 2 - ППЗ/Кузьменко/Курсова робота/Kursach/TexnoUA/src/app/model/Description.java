package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

@Stored(name = "Description")
/**
 * ���� ����� �� ����������� ���� ������
 * @author Vova
 *
 */
public class Description {
	/**
	 * ���������������� ����� �����
	 */
	@Stored(name = "1", converter = intConverter.class)
	private int id;
	@Stored(name = "2")
	/**
	 * ��'� ������
	 */
	private String name;
	@Stored(name = "3")
	/**
	 * �������������� ������
	 */
	private String comment;
	@Stored(name = "4")
	/**
	 * �������� ������
	 */
	private String maker;
/**
 * ����� ������� ���������������� �����
 * @return ���������������� �����
 */
	public int getId() {
		return id;
	}
/**
 * ����� ���������� ���������������� �����
 * @param id ���������������� �����
 */
	public void setId(int id) {
		this.id = id;
	}
/**
 * ����� ������� ���
 * @return ���
 */
	public String getName() {
		return name;
	}
/**
 * ����� ���������� ���
 * @param name ���
 */
	public void setName(String name) {
		this.name = name;
	}
/**
 * ����� ������� ��������������
 * @return ��������������
 */
	public String getComment() {
		return comment;
	}
/**
 * ����� ���������� ��������������
 * @param comment ��������������
 */
	public void setComment(String comment) {
		this.comment = comment;
	}
/**
 * ����� ������� ���������
 * @return ��������
 */
	public String getMaker() {
		return maker;
	}
/**
 * ����� ���������� ���������
 * @param maker ��������
 */
	public void setMaker(String maker) {
		this.maker = maker;
	}
}
