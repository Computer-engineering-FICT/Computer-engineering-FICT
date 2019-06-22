package com.lab111.labwork5;

import java.util.HashMap;
import java.util.Map;

/**
 * Class that implements tables relation on some field sets.
 * It uses an 'observer' pattern to get notified of events on primary
 * table. Also, it serves as 'mediator' cause it implements business logic
 * of these events processing by propagating changes to related table.
 * @author freil
 *
 */
public class TableRelationImpl implements FieldSetObserver {

	private RelationalTable target;

	@SuppressWarnings("unused")
	private FieldInfo targetFields[];
	
	private String targetFieldNames[];

	private RelationalTable source;

	private FieldInfo srcFields[];

	private Map<String, String> fieldMap;

	/**
	 * Default constructor, disabled by making it private
	 */
	@SuppressWarnings("unused")
	private TableRelationImpl() {}

	/**
	 * Constructor that accepts all necessary relation data.
	 * Note that type matching checks was skipped for simplicity reason.
	 * @param target related table
	 * @param targetFields fields in related table that takes part in relation
	 * @param src primary table
	 * @param srcFields fields in primary table that takes part in relation
	 */
	public TableRelationImpl(RelationalTable target, FieldInfo targetFields[], RelationalTable src, FieldInfo srcFields[]) {
		targetFieldNames = new String[targetFields.length];
		fieldMap = new HashMap<String, String>();
		for (int i=0; i<targetFields.length; i++) {
			targetFieldNames[i] = targetFields[i].getName();
			fieldMap.put(srcFields[i].getName(), targetFieldNames[i]);
		}
		this.targetFields = targetFields;
		this.srcFields = srcFields;
		this.target = target;
		this.source = src;
		source.addObserver(this);
	}

	@Override
	public FieldInfo[] getFields() {
		return srcFields;
	}

	@Override
	public void deleted(Object[] values) {
		// build filter for records to be deleted
		RecordFilter filter = buildRecordFilter(targetFieldNames, values);
		// Fire deletion
		target.delete(filter);
	}

	@Override
	public void updated(String fields[], Object[] oldValues, Object[] newValues) {
		// build filter for records needs updating
		String targetFields[] = new String[fields.length];
		for (int i=0; i<fields.length; i++)
			targetFields[i] = fieldMap.get(fields[i]);
		RecordFilter filter = buildRecordFilter(targetFields, oldValues);
		// update them
		target.update(targetFieldNames, newValues, filter);
	}

	/**
	 * Builds record filter matching all records with given values of known
	 * fields in related table.
	 * @param values array of field values
	 * @return
	 */
	private RecordFilter buildRecordFilter(String fields[], Object values[]) {
		if (fields.length == 1)
			return new FieldEqFilter(fields[0], values[0]);
		ChainedRecordFilter filter = new ChainedAndRecordFilter();
		for (int i=0; i<fields.length; i++) {
			RecordFilter fieldFilter = new FieldEqFilter(fields[i], values[i]);
			filter.addFilter(fieldFilter);
		}
		return filter;
	}
}
