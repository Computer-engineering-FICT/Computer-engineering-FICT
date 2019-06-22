package com.lab111.labwork5;

/**
 * Generic table with named columns
 * @author freil
 *
 */
public interface Table {

	/**
	 * @return columns information including name and data type
	 */
	public FieldInfo [] getFileds();

	/**
	 * @return column names
	 */
	public String [] getFieldNames();

	/**
	 * Sets fields info for this table 
	 * @param fields fields info for this table
	 */
	public void setFields(FieldInfo fields[]);

	/**
	 * Sets an array of fields used as primary key
	 * @param fields
	 */
	public void setPrimaryKey(FieldInfo fields[]);

	/**
	 * @return array of fields used as primary key
	 */
	public FieldInfo [] getPrimaryKeyFields();

	/**
	 * Inserts a record in a table
	 * @param fields field names
	 * @param values field values to insert
	 */
	public void insert(String fields[], Object values[]);

	/**
	 * Updates all records that matches a filter
	 * @param fields names of fields to update
	 * @param values values to set to that fields
	 * @param filter filter that matches the records to update
	 */
	public void update(String fields[], Object values[], RecordFilter filter);

	/**
	 * Deletes the records that matches the filter
	 * @param filter filter that matches the records to delete
	 */
	public void delete(RecordFilter filter);

	/**
	 * Deletes records that has given values in given fields
	 * @param fields
	 * @param values
	 */
	public void delete(String [] fields, Object [] values);

	/**
	 * @param fields columns to include in returned record set
	 * @param filter filter to match the records to return in record set
	 * @return record set containing selected columns from rows that
	 * matches the filter
	 */
	public RecordSet select(String [] fields, RecordFilter filter);

}
