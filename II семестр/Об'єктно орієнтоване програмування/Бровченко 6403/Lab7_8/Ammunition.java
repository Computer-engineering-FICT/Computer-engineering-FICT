
package Lab7;

public class Ammunition {
	/**ціна*/
	private int price;
	/**вага*/
	private double weight;
	/**назва*/
	private String name_am;

	public Ammunition() {
		
	}
	public Ammunition (String name, int p , double w) throws MyException {
		/**
		 *
		 * @param name назва амуніції
		 * @param p ціна амуніції
		 * @param w вага амуніції
		 * @throws MyException
		 */
		if (p <0 | w<0 | name == null){
			throw new MyException();
		}
		name_am=name;
		price=p;
		weight=w;}
	;
	/**
	 * 
	 * @return ціна
	 */
	public int getPrice(){
		return price;
	}
	/**
	 * 
	 * @return вага
	 */
	public double getWeight(){
		return weight;
	}
	/**
	 * 
	 * @return назва амуніції
	 */
	public String getName() {
		return name_am;
	}
	/**
	 * 
	 * @return вся інформація
	 */
	public String getInformation(){
		return "Name:" +name_am+" Price:"+String.valueOf(price)+" Weight:"+String.valueOf(weight);
	}
	
}
