package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * ����, ���� ������ ���� ����� ������� "Category" � ���� �����.
 * @author ����� ����� 
 */
@Stored(name = "CATEGORY")
public class Category {

	/**
	 * {@value} �������� ����.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} ��������.
	 */
	@Stored(name = "CATEGORY")
	private String category;
	
	/**
	 * ������ �����������.
	 */
	public Category(){
		
	}
	
	/**
	 * �����������, ���� �������� �� ����.
	 * @param id �������� ����.
	 * @param category ��������.
	 */
	public Category(int id, String category){
		this.id = id;
		this.category = category;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

}
