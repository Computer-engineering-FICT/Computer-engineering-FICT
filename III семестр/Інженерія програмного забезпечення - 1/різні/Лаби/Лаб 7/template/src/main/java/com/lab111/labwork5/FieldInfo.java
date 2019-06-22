package com.lab111.labwork5;

/**
 * Simple field (column) descriptor. Contains column name and data type.
 * @author freil
 *
 */
public class FieldInfo {

	public enum FieldType {
		TYPE_INTEGER,
		TYPE_LONG,
		TYPE_STRING,
		TYPE_BOOLEAN
	};

	private String name;
	
	private FieldType type;
	
	int order;

	public FieldInfo(String name, FieldType type) {
		this.name = name;
		this.type = type;
	}

	public FieldInfo(FieldInfo info, int order) {
		this.name = info.getName();
		this.type = info.getType();
		this.order = order;
	}

	/**
	 * @return field name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name new field name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return field type
	 */
	public FieldType getType() {
		return type;
	}

	/**
	 * @param type new field type
	 */
	public void setType(FieldType type) {
		this.type = type;
	}

	/**
	 * @return field order in the table or record set row
	 */
	public int getOrder() {
		return order;
	}

	/**
	 * @param order field order to set
	 */
	public void setOrder(int order) {
		this.order = order;
	}

}
