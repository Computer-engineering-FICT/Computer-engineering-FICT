package domain;

import dao.annotation.*;


@Table(name = "Category")
public class Category {
	
	
	@Column(name = "ID", primaryKey = true)
	private int id;
	
	@Column(name = "Name")
	private String name;

	public Category() {}
	
	/**
	 * @param id
	 * @param name
	 */
	public Category(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Category(String name) {
		this.name = name;
	}
	
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


	@Override
	public String toString() {
		return "Category [name=" + name + "]";
	}
	
	

}
