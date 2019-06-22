package com.lab111.labwork5;

/**
 * Interface that allows a table to notify an observer object about records
 * changes.
 * @author freil
 *
 */
public interface FieldSetObservable {

	/**
	 * Adds an observer
	 * @param observer
	 */
	public void addObserver(FieldSetObserver observer);
	
	/**
	 * Removes an observer
	 * @param observer
	 */
	public void removeObserver(FieldSetObserver observer);

}
