package lab62;

import java.io.Serializable;

/**
 * ���� �������
 * 
 * @author Sofi
 * 
 */
class Cackes extends Sweets implements Serializable {
	/**
	 * �����������, �� ����������� �� ����������
	 * 
	 * @param w
	 *            -����
	 * @param c
	 *            -���� ��������
	 * @param p
	 *            -����
	 * @param n
	 *            -��"�
	 * @throws SweetException 
	 */
	Cackes(int w, double c, long p, String n) throws SweetException {
		
		super(w, c, p, n);
	
	}

	/**
	 * ��� ���������� ��� ������� - ������� ������ �� ������
	 */
	public String getOtherInfo() {
		return "Cackes (" + super.getOtherInfo()+ ")";
				

	}
}
