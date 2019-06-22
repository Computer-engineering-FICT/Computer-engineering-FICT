package com.lab111.labwork5;

/**
 * Intended for matching records during query execution
 * @author freil
 *
 */
public interface RecordFilter {

	/**
	 * Checks that given record matches conditions represented by filter
	 * @param record
	 * @return true if given record matches the filter, false otherwise
	 */
	public boolean match(Record record);

}
