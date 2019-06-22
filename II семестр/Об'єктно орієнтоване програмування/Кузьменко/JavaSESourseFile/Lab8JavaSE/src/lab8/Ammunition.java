
package lab8;

import java.io.Serializable;

/**
 * Батьківський клас для Амуніції
 * @author Volodia Kuzmenko
 *
 */
@SuppressWarnings("serial")
public class Ammunition implements Serializable {
	/**ціна */
	private int price;
	/**вага*/
	private double weight;
	/**назва*/
	private String name_am;
	/**
	 * 
	 * @param name назва амуніції
	 * @param p ціна амуніції
	 * @param w вага амуніції
	 * @throws MyException 
	 */
	public Ammunition() {
		
	}
	public Ammunition (String name, int p , double w) throws MyException {
		if (p <0 | w<0 | name == null){
			throw new MyException();
		}
		name_am=name;
		price=p;
		weight=w;}
	;
	/**
	 * 
	 * @return ціну
	 */
	public int getPrice(){
		return price;
	}
	/**
	 * 
	 * @return вагу
	 */
	public double getWeight(){
		return weight;
	}
	/**
	 * 
	 * @return назву амуніції
	 */
	public String getName() {
		return name_am;
	}
	/**
	 * 
	 * @return інформацію про предмет амуніції
	 */
	public String getInformation(){
		return "Name:" +name_am+" Price:"+String.valueOf(price)+" Weight:"+String.valueOf(weight);
	}
	
}
