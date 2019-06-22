package lab62;

import java.util.Iterator;

/**
 * клас подарункового кошика
 * 
 * @author Sofi
 * 
 */
public class Present {
	private Sweets[] sweets;
	/**
	 * конструктор класу "Подарунковий кошик"
	 * @param ar - масив з цукерок, що входять до кошика
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
	 * метод,що знаходить вагу кошика
	 * 
	 * @param present
	 *            - масив солодощів кошика
	 * @return повертає вагу кошика
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
	 * метод, що знаходить ті солодощі, які входять в діапазон заданого вмісту
	 * шоколаду
	 * 
	 * @param present
	 *            - вміст шоколаду
	 * @param minContent
	 *            - мінімальний вміст шоколаду
	 * @param maxContent
	 *            - максимальний вміст шоколаду
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
			System.out.println("немає таких солодощів");
		return s;
	}

	/**
	 * метод, який сортує цукрки за ціною
	 * 
	 * @param present
	 *            - масив подарункового кошика
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
	 * метод, який виводить вміст кошика, та всю інформацію про солодощі
	 * 
	 * @param present
	 *            - масив подарункового кошика
	 */
	public Sweets[] getPresent() {
		return sweets;
	}
}
