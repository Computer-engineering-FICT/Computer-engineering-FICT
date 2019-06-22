package lab6;




/**
 * ���-������� �� ����� Ammunition
 * ����� ��'��� ���
 * @author Volodia Kuzmenko
 *
 */
public class Shield extends Ammunition {
	/**
	 * 
	 * @param n ����� ����
	 * @param p	���� ����
	 * @param w	���� ����
	 */
	public Shield(String n, int p, double w) throws MyException{
		super(n, p, w);	
	}

	/**
	 * 
	 * @param ��� ������� - ���
	 */
	private String name = "���";
	/**
	 * @ return ���������
	 */
	public String getInformation(){
		return "��� "+ name + " "+super.getInformation();
	}
	
}
