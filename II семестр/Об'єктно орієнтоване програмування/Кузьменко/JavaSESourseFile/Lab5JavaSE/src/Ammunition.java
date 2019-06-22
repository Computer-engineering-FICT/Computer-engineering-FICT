/**
 * 
 * @author Volodia Kuzmenko
 *
 */
public class Ammunition {
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
	 */
	
	public Ammunition (String name, int p , double w){
		name_am=name;
		price=p;
		weight=w;
	}
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
