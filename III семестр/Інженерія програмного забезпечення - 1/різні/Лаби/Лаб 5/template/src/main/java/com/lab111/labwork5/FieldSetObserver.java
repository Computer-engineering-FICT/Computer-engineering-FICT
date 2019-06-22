package com.lab111.labwork5;

/**
 * Observer for changes in subset of table's fields. 
 * @author freil
 *
 */
public interface FieldSetObserver {

	/**
	 * Returns field info for fields to be observed for changes 
	 * @return observed fields info
	 */
	public FieldInfo [] getFields();
	
	/**
	 * This method is used to notify observer about deletion of record with
	 * given fields values.
	 * @param values observed fields values of deleted record
	 */
	public void deleted(Object values[]);
	
	/**
	 * Notifies an observer that record changes observed values
	 * @param fields names of changed fields
	 * @param oldValues old values of observed fields
	 * @param newValues new values of observed fields
	 */
	public void updated(String fields[], Object oldValues[], Object newValues[]);

}
