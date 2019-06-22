package lab62;

import java.io.Serializable;

/**
 * Клас печива
 * 
 * @author Sofi
 * 
 */
class Coockies extends Sweets implements Serializable {
	/**
	 * Конструктор, що викликається із суперкласу
	 * 
	 * @param w
	 *            вага
	 * @param c
	 *            вміст шоколаду
	 * @param p
	 *            ціна
	 * @param n
	 *            -ім"я
	 * @throws SweetException 
	 */
	Coockies(int w, double c, long p, String n) throws SweetException {
		super(w, c, p, n);
	}

	/**
	 * іша інформація про тістечка - кількість горіхів та фруктів
	 */
	public String getOtherInfo() {
		return "Coocies (" + super.getOtherInfo() + ")";
	}
}