package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;
/**
 * @author Vova
 *	���� �����, ��  ������� ���� �����������
 */
@Stored(name="state")

public class State {
/**
 * 	���������������� ����� �����
 */
	@Stored(name = "1", converter = intConverter.class)
	private int id;
	/**
	 * ����
	 */
	@Stored (name="2")
	private String state;

/**
 * ����� �� ������� ���������������� ����� �����
 * @return ���������������� �����
 */
	public int getId() {
		return id;
	}
/**
 * ����� �� ���������� ���������������� ����� �����
 * @param id ���������������� ����� �����
 */
	public void setId(int id) {
		this.id = id;
	}
/**
 * ����� �� ������� ����
 * @return ����
 */
	public String getState() {
		return state;
	}
/**
 * ����� �� ���������� ���� �����������
 * @param state ����
 */
	public void setState(String state) {
		this.state = state;
	}

}
