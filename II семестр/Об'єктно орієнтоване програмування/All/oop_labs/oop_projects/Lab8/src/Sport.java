import java.io.Serializable;

/**
 * ���������� ���� "��� ������" ��� ���������
 */

public class Sport implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -9034521014015302675L;
	private String sport;
	Sport(){
		sport = "��� ������";
	}
	Sport(String s){
		setSport(s);
	}
	public final void setSport(String s){
		sport = s;
	}
	public final String getSport(){
		return sport;
	}
}
