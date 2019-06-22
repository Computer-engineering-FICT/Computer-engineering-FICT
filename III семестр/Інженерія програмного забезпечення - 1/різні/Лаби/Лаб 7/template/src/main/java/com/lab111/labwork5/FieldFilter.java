package com.lab111.labwork5;

/**
 * Abstract base class for implementations comparing single field with
 * specified value
 * @author freil
 *
 */
public abstract class FieldFilter implements RecordFilter {

	protected String fieldName;

	protected Object value;

	/**
	 * Constructs <code>FieldFilter</code> object initializing column name
	 * and value properties.
	 * @param fieldName column name to compare values of
	 * @param value value to compare to
	 */
	public FieldFilter(String fieldName, Object value) {
		this.fieldName = fieldName;
		this.value = value;
	}

}
