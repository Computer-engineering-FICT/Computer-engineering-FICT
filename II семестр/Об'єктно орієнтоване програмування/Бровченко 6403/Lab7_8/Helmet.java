package Lab7;


public class Helmet extends Ammunition {
	/**
	 *
	 * @param n назва амуніції
	 * @param p ціна амуніції
	 * @param w вага амуніції
	 * @throws MyException
	 */
	public Helmet(String n, int p, double w) throws MyException{
		super(n, p, w);
	}
	/**Тип Шолом */
	private String name = "Шолом";
	/**
	 * @ return інформацію
	 */
	public String getInformation(){
		return "Тип "+ name + " "+super.getInformation();
	}

}
