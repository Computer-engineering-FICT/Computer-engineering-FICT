package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * ����, ���� ������ ���� ����� ������� "ContactInformation"  � ���� �����.
 * @author ����� ����� 
 */
@Stored(name = "CONTACTINFORMATION")
public class ContactInformation {

	/**
	 * {@value} �������� ����.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} ����� ��������.
	 */
	@Stored(name = "TELEPHONE", converter = intConverter.class)
	private int telepfone;
	/**
	 * {@value} ���������� ������.
	 */
	@Stored(name = "EMAIL")
	private String email;
	/**
	 * {@value} ������ ����������.
	 */
	@Stored(name = "ADRESS")
	private String adress;
	
	
	/**
	 * ������ �����������.
	 */
	public ContactInformation(){
		
	}
	
	/**
	 * �����������, ���� �������� �� ����.
	 * @param id �������� ����.
	 * @param telepfone �������.
	 * @param email ���������� �����.
	 * @param adress ������.
	 */
	public ContactInformation(int id, int telepfone, String email, String adress){
		this.id = id;
		this.telepfone = telepfone;
		this.email = email;
		this.adress = adress;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTelepfone() {
		return telepfone;
	}
	public void setTelepfone(int telepfone) {
		this.telepfone = telepfone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}

}
