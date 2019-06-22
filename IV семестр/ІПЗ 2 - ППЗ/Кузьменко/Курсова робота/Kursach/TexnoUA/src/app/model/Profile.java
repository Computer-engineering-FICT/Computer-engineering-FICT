package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

/**
 * ���� ����� �� �������� ���������� �����������
 * 
 * @author Vova
 * 
 */

@Stored(name = "profile")
public class Profile {
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * 	���������������� ����� �����������
	 */
	private int id;
	@Stored(name = "2")
	/**
	 * ���� �����������
	 */
	private String login;
	@Stored(name = "3")
	/**
	 * ������ �����������
	 */
	private String password;
	@Stored(name = "4", converter = intConverter.class)
	/**
	 * ���������������� ����� ����� �����������
	 */
	private int state_id;
	@Stored(name = "5", converter = intConverter.class)
	/**
	 * ���������������� ����� ���������� ���������� �����������
	 */
	private int contactinformation_id;
	@Stored(name = "6", converter = intConverter.class)
	/**
	 * ���������������� ����� ������� �����������
	 */
	private int category_id;

	/**
	 * ����� ������ ���������������� ����� �����������
	 * 
	 * @return ���������������� ������
	 */
	public int getId() {
		return id;
	}

	/**
	 * ����� ���������� ���������������� �����
	 * 
	 * @param id ��������������� �����
	 */
	public void setId(int id) {

		this.id = id;
	}

	/**
	 * ����� ������� ����
	 * 
	 * @return ����
	 */
	public String getLogin() {
		return login;
	}

	/**
	 * ����� ���������� ����
	 * 
	 * @param login
	 *            ����
	 */
	public void setLogin(String login) {

		this.login = login;
	}

	/**
	 * ����� ������� ������
	 * 
	 * @return ������
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * ����� ���������� ������
	 * 
	 * @param password
	 *            ������
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * ����� ������� ����� ����� �����������
	 * 
	 * @return ����� �����
	 */
	public int getState_id() {
		return state_id;
	}

	/**
	 * ����� ���������� ����� ����� �����������
	 * 
	 * @param state_id
	 *            ����� �����
	 */
	public void setState_id(int state_id) {
		this.state_id = state_id;

	}

	/**
	 * ����� ������� ����� ��������� ��������� �����������
	 * 
	 * @return ����� ��������� ����������
	 */
	public int getContactinformation_id() {
		return contactinformation_id;
	}

	/**
	 * ����� ���������� ����� ��������� ��������� �����������
	 * 
	 * @param contactinformation_id
	 *            ����� ��������� ���������
	 */
	public void setContactinformation_id(int contactinformation_id) {
		this.contactinformation_id = contactinformation_id;

	}

	/**
	 * ����� ������� ����� ������� �����������
	 * 
	 * @return ����� ������� �����������
	 */
	public int getCategory_id() {
		return category_id;
	}

	/**
	 * ����� ���������� ����� ������� �����������
	 * 
	 * @param category_id
	 *            ����� �������
	 */
	public void setCategory_id(int category_id) {
		this.category_id = category_id;

	}
}
