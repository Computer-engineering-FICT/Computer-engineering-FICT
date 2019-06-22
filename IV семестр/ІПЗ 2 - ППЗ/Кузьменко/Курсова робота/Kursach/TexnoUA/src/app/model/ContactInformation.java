package app.model;

import dao.annotation.Stored;
import dao.annotation.utils.converter.intConverter;

@Stored(name = "contactinformation")
/**
 * ���� ����� �� ����������� ��������� ���������� ������������
 * @author Vova
 *
 */
public class ContactInformation {
	@Stored(name = "1", converter = intConverter.class)
	/**
	 * ���������������� ����� ��������� ����������
	 */
	private int id;
	@Stored(name = "2")
	/**
	 * ����� �������� �����������
	 */
	private String telephone;
	@Stored(name = "3")
	/**
	 * ������ ���������� ����� �����������
	 */
	private String email;
	@Stored(name = "4")
	/**
	 * ������� ������ �����������
	 */
	private String adress;
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
 * ����� ������� ����� ��������
 * @return ����� �������
 */
	public String getTelephone() {
		return telephone;
	}
/**
 * ����� ���������� ����� �������� 
 * @param telephone ����� ��������
 */
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
/**
 * ����� ������� ������ ���������� �����
 * @return ������ ���������� �����
 */
	public String getEmail() {
		return email;
	}
/**
 * �����  ���������� ������ ���������� �����
 * @param email ������ ���������� �����
 */
	public void setEmail(String email) {
		this.email = email;
	}
/**
 *�����  ������� �������� ������
 * @return ������� ������
 */
	public String getAdress() {
		return adress;
	}
/**
 * ����� ���������� ������� ������
 * @param adress
 */
	public void setAdress(String adress) {
		this.adress = adress;
	}

}
