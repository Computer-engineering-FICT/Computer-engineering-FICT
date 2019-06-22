package com.lab111.labwork5;

/**
 * Represents single record in a record set
 * @author freil
 *
 */
public interface Record {

	/**
	 * Retrieves value of column with given name
	 * @param field column name to retrieve value of
	 * @return value of given column
	 */
	Object getFieldValue(String field);

	/**
	 * Retrieves value of column with given index
	 * @param index column ordering number to retrieve value of
	 * @return value of given column
	 */
	Object getFieldValue(int index);

}
