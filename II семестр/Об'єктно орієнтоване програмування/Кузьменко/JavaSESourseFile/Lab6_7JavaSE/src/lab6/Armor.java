package lab6;



/**
 * лас-Нащадок від класу Ammunition
 * описує об'єкт Кольчуга
 * @author Volodia Kuzmenko
 *
 */
public class Armor extends Ammunition {
	/**
	 * 
	 * @param n назва кольчуги
	 * @param p	ціна кольчуги
	 * @param w вага кольчуги
	 * @throws MyException 
	 */
	public Armor(String n, int p, double w) throws MyException {
		super(n, p, w);			
	}
	/**тип кольчуга*/
	private String name = "Кольчуга";
	/**
	 * @ return інформацю
	 */
	public String getInformation(){
		return "Тип "+ name + " "+super.getInformation();
	}
	
}

