package Lab7;


public class Shield extends Ammunition {
	/**
	 *
	 * @param n назва амуніції
	 * @param p ціна амуніції
	 * @param w вага амуніції
	 * @throws MyException
	 */
	public Shield(String n, int p, double w) throws MyException{
		super(n, p, w);	
	}

	/**Тип Щит*/
	private String name = "Щит";
	/**
	 * @ return інформацію
	 */
	public String getInformation(){
		return "Тип "+ name + " "+super.getInformation();
	}
	
}
