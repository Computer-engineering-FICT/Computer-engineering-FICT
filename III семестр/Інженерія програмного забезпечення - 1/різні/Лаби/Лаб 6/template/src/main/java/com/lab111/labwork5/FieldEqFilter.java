package com.lab111.labwork5;

/**
 * Record filter that matches records having a given value in given column
 * @author freil
 *
 */
public class FieldEqFilter extends FieldFilter {

	public FieldEqFilter(String fieldName, Object value) {
		super(fieldName, value);
	}

	@Override
	public boolean match(Record record) {
		return record.getFieldValue(fieldName).equals(value);
	}

}
