package lab62;

import java.io.Serializable;

public class Sweets implements Serializable{
	private int weight;
	private double content;
	private long price;
	private String name;

	/**
	 * ����������� ����� "��������"
	 * 
	 * @param w
	 *            - ����
	 * @param c
	 *            - ���� ��������
	 * @param p
	 *            - ����
	 * @param n
	 *            - �����
	 * @throws SweetException 
	 */
	public Sweets(int w, double c, long p, String n) throws SweetException {
		if (w<0 | c<0 |c>100 | p<0 | n.equals("")) {
			throw new SweetException(w,c,p,n);
		}
		weight = w;
		content = c;
		price = p;
		name = n;
	}

	// ����� ������� ����
	public int getWeight() {
		return weight;
	}

	// ����� ������� ���� ��������
	public double getContent() {
		return content;
	}

	// ����� ������� ����
	public long getPrice() {
		return price;
	}

	public String getName() {
		return name;
	}

	public String getOtherInfo() {
		return getName() + " " + getContent() + "; Price " + getPrice() + "; "
				+ getWeight();
	}

}
