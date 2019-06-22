package Lab7;


public class Armor extends Ammunition {
	/**
	 *
	 * @param n назва амуніції
	 * @param p ціна амуніції
	 * @param w вага амуніції
	 * @throws MyException
	 */
	public Armor(String n, int p, double w) throws MyException {
		super(n, p, w);			
	}
	/**Тип кольчуга*/
	private String name = "Кольчуга";
	/**
	 * @ return інформацію
	 */
	public String getInformation(){
		return "Тип "+ name + " "+super.getInformation();
	}
	
}

