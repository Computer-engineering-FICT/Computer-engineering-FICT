package lab6;



/**
 * Клас-Нащадок від класу Ammunition
 * описує об'єкт Шолом
 * @author Volodia Kuzmenko
 *
 */
public class Helmet extends Ammunition {
	/**
	 * 
	 * @param n назва шолома
	 * @param p ціна шолома
	 * @param w вага шолома
	 */
	public Helmet(String n, int p, double w) throws MyException{
		super(n, p, w);
	}
	/**Тип шолом */
	private String name = "Шолом";
	/**
	 * @ return інформацю
	 */
	public String getInformation(){
		return "Тип "+ name + " "+super.getInformation();
	}

}
