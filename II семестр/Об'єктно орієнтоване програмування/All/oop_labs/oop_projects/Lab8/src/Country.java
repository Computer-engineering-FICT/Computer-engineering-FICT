import java.io.Serializable;

/**
 * ���������� ���� "�����" ��� ���������
 */

public class Country implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String country;
	Country(){
		country = "������";
	}
	Country(String c){
		setCountry(c);
	}
	public final void setCountry(String c){
		country = c;
	}
	public final String gerCountry(){
		return country;
	}
}
