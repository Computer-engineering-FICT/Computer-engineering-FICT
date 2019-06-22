package domain;

import dao.annotation.*;

@Table(name = "User")
public class User {
	
	@Column(name = "ID", primaryKey = true)
	private int id;
	
	@Column(name = "Category", foreignKey = true)
	private int categoryId;
	
	@Column(name = "Name")
	private String name;
	
	@CascadeReference
	private Category category;
	
	public User() {}
	
	/**
	 * @param id
	 * @param name
	 * @param category
	 */
	public User(int id, String name, Category category) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.categoryId = category.getId();
	}

	public User(String name, Category category) {
		this.name = name;
		this.category = category;
		this.categoryId = category.getId();
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the category
	 */
	public Category getCategory() {
		return category;
	}

	/**
	 * @param category the category to set
	 */
	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", category=" + categoryId + "]";
	}
	
}
