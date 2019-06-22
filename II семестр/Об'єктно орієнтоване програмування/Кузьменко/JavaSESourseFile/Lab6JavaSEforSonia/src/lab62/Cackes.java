package lab62;

import java.io.Serializable;

/**
 * Клас тістечок
 * 
 * @author Sofi
 * 
 */
class Cackes extends Sweets implements Serializable {
	/**
	 * Конструктор, що викликається із суперкласу
	 * 
	 * @param w
	 *            -вага
	 * @param c
	 *            -вімст шоколаду
	 * @param p
	 *            -ціна
	 * @param n
	 *            -ім"я
	 * @throws SweetException 
	 */
	Cackes(int w, double c, long p, String n) throws SweetException {
		
		super(w, c, p, n);
	
	}

	/**
	 * іша інформація про тістечка - кількість горіхів та фруктів
	 */
	public String getOtherInfo() {
		return "Cackes (" + super.getOtherInfo()+ ")";
				

	}
}
