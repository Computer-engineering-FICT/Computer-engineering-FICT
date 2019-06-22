package com.lab111.labwork5;

import java.util.HashMap;
import java.util.Map;

/**
 * Sample implementation of single record in RecordSet
 * Keeps an array of column values and mapping from column name to index in
 * that array
 * @author freil
 *
 */
public class RecordImpl implements Record {

	private Map<String, Integer> nameToIndex;
	private Object values[];

	public RecordImpl(String fields[]) {
		this.nameToIndex = new HashMap<String, Integer>();
		for (int i=0; i<fields.length; i++) {
			nameToIndex.put(fields[i], new Integer(i));
		}
	}

	public RecordImpl(Map<String, Integer> nameToIndex) {
		this.nameToIndex = nameToIndex;
	}

	@Override
	public Object getFieldValue(String field) {
		Integer index = nameToIndex.get(field);
		if (index == null)
			return null;
		return values[index];
	}

	@Override
	public Object getFieldValue(int index) {
		if (index < 0 || index >= values.length)
			throw new IndexOutOfBoundsException();
		return values[index];
	}

	/**
	 * Sets values for current row.
	 * Note the 'default' (aka 'package') visibility: this is not a public method
	 * @param values
	 */
	void setValues(Object values[]) {
		this.values = values;
	}
}
