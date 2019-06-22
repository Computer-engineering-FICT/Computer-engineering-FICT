
package lab8;

import java.io.Serializable;

/**
 * ����������� ���� ��� �������
 * @author Volodia Kuzmenko
 *
 */
@SuppressWarnings("serial")
public class Ammunition implements Serializable {
	/**���� */
	private int price;
	/**����*/
	private double weight;
	/**�����*/
	private String name_am;
	/**
	 * 
	 * @param name ����� �������
	 * @param p ���� �������
	 * @param w ���� �������
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
	 * @return ����
	 */
	public int getPrice(){
		return price;
	}
	/**
	 * 
	 * @return ����
	 */
	public double getWeight(){
		return weight;
	}
	/**
	 * 
	 * @return ����� �������
	 */
	public String getName() {
		return name_am;
	}
	/**
	 * 
	 * @return ���������� ��� ������� �������
	 */
	public String getInformation(){
		return "Name:" +name_am+" Price:"+String.valueOf(price)+" Weight:"+String.valueOf(weight);
	}
	
}
