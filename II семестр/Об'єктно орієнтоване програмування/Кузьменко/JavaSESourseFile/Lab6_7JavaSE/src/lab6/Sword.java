package lab6;


/**
 * лас-Нащадок від класу Ammunition
 * описує об'єкт Меч
 * @author Volodia Kuzmenko
 *
 */
public class Sword extends Ammunition{
	/**
	 * 
	 * @param n назва меча
	 * @param p ціна меча
	 * @param w вага меча
	 */
	public Sword(String n, int p, double w) throws MyException{
		super(n, p, w);
	}
	/**тип Меч*/
	private String name = "Меч";
	/**
	 * @ return інформацю
	 */
	public String getInformation(){
		return "Тип "+ name + " "+super.getInformation();
	}

}
