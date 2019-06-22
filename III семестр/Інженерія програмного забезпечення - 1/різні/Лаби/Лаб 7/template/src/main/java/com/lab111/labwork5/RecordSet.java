package com.lab111.labwork5;

/**
 * Interface to record set returned by query to table(s).
 * Utilizes 'iterator' pattern for access to particular records.
 * @author freil
 *
 */
public interface RecordSet {

	/**
	 * @return information about fields contained in each record
	 */
	public FieldInfo [] getFields();

	/**
	 * @return true if there is next record to retrieve
	 */
	public boolean hasNext();

	/**
	 * @return next record in record set
	 */
	public Record next();

	/**
	 * @return true if there is previous record to retrieve
	 */
	public boolean hasPrev();
	
	/**
	 * @return previous record in record set
	 */
	public Record prev();

	/**
	 * Places an iterator to a first record
	 */
	public void first();

	/**
	 * Places an iterator to a last record
	 */
	public void last();

	/**
	 * @return number of records in record set
	 */
	public int size();

	/**
	 * Places an iterator to a record at given index
	 * @param recNumber index of record to point to
	 * @throws IndexOutOfBoundsException when index is negative or greater than number of records
	 */
	public void seek(int recNumber) throws IndexOutOfBoundsException;

	/**
	 * Closes the record set reclaiming all associated resources
	 */
	public  void close();

}
