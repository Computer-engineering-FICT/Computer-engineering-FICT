package com.lab111.labwork5;

/**
 * Interface intended to check validity of inserted record in related table 
 * @author freil
 *
 */
public interface RelationChecker {

	/**
	 * @param values orw to be inserted in related table
	 * @return true if primary table contains record with corresponding values
	 * in fields used in relation
	 */
	public boolean isRecordValid(Object values[]);
}
