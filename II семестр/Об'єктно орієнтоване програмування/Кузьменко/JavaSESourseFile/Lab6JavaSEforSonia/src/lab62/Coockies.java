package lab62;

import java.io.Serializable;

/**
 * ���� ������
 * 
 * @author Sofi
 * 
 */
class Coockies extends Sweets implements Serializable {
	/**
	 * �����������, �� ����������� �� ����������
	 * 
	 * @param w
	 *            ����
	 * @param c
	 *            ���� ��������
	 * @param p
	 *            ����
	 * @param n
	 *            -��"�
	 * @throws SweetException 
	 */
	Coockies(int w, double c, long p, String n) throws SweetException {
		super(w, c, p, n);
	}

	/**
	 * ��� ���������� ��� ������� - ������� ������ �� ������
	 */
	public String getOtherInfo() {
		return "Coocies (" + super.getOtherInfo() + ")";
	}
}