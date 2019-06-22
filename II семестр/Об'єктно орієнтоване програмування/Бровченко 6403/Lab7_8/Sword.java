package Lab7;


public class Sword extends Ammunition{
	/**
	 *
	 * @param n назва амуніції
	 * @param p ціна амуніції
	 * @param w вага амуніції
	 * @throws MyException
	 */
	public Sword(String n, int p, double w) throws MyException{
		super(n, p, w);
	}
	/**Тип Меч*/
	private String name = "Меч";
	/**
	 * @ return інформацію
	 */
	public String getInformation(){
		return "Тип "+ name + " "+super.getInformation();
	}

}
