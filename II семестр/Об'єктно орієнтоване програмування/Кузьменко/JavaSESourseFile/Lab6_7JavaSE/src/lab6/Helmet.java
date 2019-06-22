package lab6;



/**
 * ����-������� �� ����� Ammunition
 * ����� ��'��� �����
 * @author Volodia Kuzmenko
 *
 */
public class Helmet extends Ammunition {
	/**
	 * 
	 * @param n ����� ������
	 * @param p ���� ������
	 * @param w ���� ������
	 */
	public Helmet(String n, int p, double w) throws MyException{
		super(n, p, w);
	}
	/**��� ����� */
	private String name = "�����";
	/**
	 * @ return ���������
	 */
	public String getInformation(){
		return "��� "+ name + " "+super.getInformation();
	}

}
