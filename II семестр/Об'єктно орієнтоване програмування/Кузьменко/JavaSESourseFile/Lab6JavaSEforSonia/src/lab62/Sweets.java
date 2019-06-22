package lab62;

import java.io.Serializable;

public class Sweets implements Serializable{
	private int weight;
	private double content;
	private long price;
	private String name;

	/**
	 * Конструктор класу "Солодощі"
	 * 
	 * @param w
	 *            - вага
	 * @param c
	 *            - вміст шоколаду
	 * @param p
	 *            - ціна
	 * @param n
	 *            - назва
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

	// Метод повертає вагу
	public int getWeight() {
		return weight;
	}

	// Метод повертає вміст шоколаду
	public double getContent() {
		return content;
	}

	// Метод повертає ціну
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
