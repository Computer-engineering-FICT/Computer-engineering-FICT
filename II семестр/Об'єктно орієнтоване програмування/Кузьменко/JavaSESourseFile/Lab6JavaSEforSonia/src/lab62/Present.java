package lab62;

import java.util.Iterator;

/**
 * ���� ������������� ������
 * 
 * @author Sofi
 * 
 */
public class Present {
	private Sweets[] sweets;
	/**
	 * ����������� ����� "������������ �����"
	 * @param ar - ����� � �������, �� ������� �� ������
	 */
	public Present(Sweets[] ar) {
		sweets = ar;
	}

	public Present(CollectionSweets col) {
		sweets = new Sweets[col.size()];
		Iterator<Sweets> itr = col.iterator();
		int i = 0;
		while (itr.hasNext()) {
			Sweets sw = (Sweets) itr.next();
			sweets[i] = sw;
			i++;
		}
	}

	private int weight = 0;

	/**
	 * �����,�� ��������� ���� ������
	 * 
	 * @param present
	 *            - ����� ��������� ������
	 * @return ������� ���� ������
	 */
	public int presentWeight() {

		for (int i = 0; i < sweets.length; i++) {
			weight = weight + sweets[i].getWeight();
		}
		return weight;
	}

	String[] s = new String[3];
	int j = 0;

	/**
	 * �����, �� ��������� � ��������, �� ������� � ������� �������� �����
	 * ��������
	 * 
	 * @param present
	 *            - ���� ��������
	 * @param minContent
	 *            - ��������� ���� ��������
	 * @param maxContent
	 *            - ������������ ���� ��������
	 * @return
	 */
	public String[] findSweet(double minContent, double maxContent) {
		for (int i = 0; i < sweets.length; i++) {

			if ((sweets[i].getContent() >= minContent)
					& sweets[i].getContent() <= maxContent) {
				System.out.println(sweets[i].getName());
				j++;

			}
		}
		if (j == 0)
			System.out.println("���� ����� ���������");
		return s;
	}

	/**
	 * �����, ���� ����� ������ �� �����
	 * 
	 * @param present
	 *            - ����� ������������� ������
	 */
	public void sortByPrice() {
		for (int i = 0; i < sweets.length; i++)
			for (int j = i + 1; j < sweets.length; j++)
				if (sweets[i].getPrice() > sweets[j].getPrice()) {
					Sweets t = sweets[i];
					sweets[i] = sweets[j];
					sweets[j] = t;
				}
	}

	/**
	 * �����, ���� �������� ���� ������, �� ��� ���������� ��� ��������
	 * 
	 * @param present
	 *            - ����� ������������� ������
	 */
	public Sweets[] getPresent() {
		return sweets;
	}
}
