package lab6;


/**
 * ���-������� �� ����� Ammunition
 * ����� ��'��� ���
 * @author Volodia Kuzmenko
 *
 */
public class Sword extends Ammunition{
	/**
	 * 
	 * @param n ����� ����
	 * @param p ���� ����
	 * @param w ���� ����
	 */
	public Sword(String n, int p, double w) throws MyException{
		super(n, p, w);
	}
	/**��� ���*/
	private String name = "���";
	/**
	 * @ return ���������
	 */
	public String getInformation(){
		return "��� "+ name + " "+super.getInformation();
	}

}
