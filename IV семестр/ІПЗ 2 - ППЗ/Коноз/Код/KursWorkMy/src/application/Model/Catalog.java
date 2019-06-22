package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * ���� ������ ���� ���� ����� � ������� "Catalog" ���� �����
 * @author ����� ����� 
 */
@Stored(name="CATALOG")
public class Catalog {

	/**
	 * {@value} �������� id.
	 */
	@Primary
	@Stored(name="ID", converter= intConverter.class)
	private int id;
	
	/**
	 * {@value} ������ ����� ��������.
	 */
	@Stored(name="NAME")
	private String name;
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	/**
	 * ������ �����������.
	 */
	public Catalog(){
		
	}
	
	/**
	 * �����������, ���� �������� �� ����.
	 * @param id �������� ����.
	 * @param name ����� ��������.
	 */
	public Catalog(int id, String name){
		this.id = id;
		this.name = name;
	}

}
