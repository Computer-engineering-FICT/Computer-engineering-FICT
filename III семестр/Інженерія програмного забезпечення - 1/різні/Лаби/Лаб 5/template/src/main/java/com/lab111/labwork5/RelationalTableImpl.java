package com.lab111.labwork5;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Sample RelationalTable implementation. Keeps all data in an array.
 * Implements relations with other RelationalTable objects through
 * FieldSetObserver interface implementation.
 * @author freil
 *
 */
class RelationalTableImpl implements RelationalTable {

	protected FieldInfo fields[];
	protected String fieldNames[];
	protected FieldInfo primaryKey;
	private Map<String, Integer> nameToIndex;
	private Object data[][];
	private int rowsCount;

	protected List<FieldSetObserver> observers;
	// protected Map<String, List<FieldSetObserver>> fieldObservers;
	
	protected List<FieldSetObserver> relations;

	/*
	 * Internal class for simplifying observer notifications on update
	 */
	private class ObserverUpdate {
		public FieldSetObserver observer;
		public String fields[];
		public Object values[];
	}

	public RelationalTableImpl() {
		nameToIndex = new HashMap<String, Integer>();
		// fieldObservers = new HashMap<String, List<FieldSetObserver>>();
		observers = new LinkedList<FieldSetObserver>();
		relations = new LinkedList<FieldSetObserver>();
		rowsCount = 0;
	}

	@Override
	public FieldInfo[] getFileds() {
		return fields;
	}

	@Override
	public String[] getFieldNames() {
		return fieldNames;
	}

	@Override
	public void setFields(FieldInfo[] fields) {
		if (this.fields != null)
			throw new UnsupportedOperationException();
		this.fields = fields;
		fieldNames = new String[fields.length];
		for (int i=0; i<fields.length; i++) {
			fieldNames[i] = fields[i].getName();
			nameToIndex.put(fieldNames[i], new Integer(i));
		}
		data = new Object[64][fields.length];
	}

	@Override
	public void setPrimaryKey(FieldInfo[] fields) {
		// TODO Auto-generated method stub
	}

	@Override
	public FieldInfo[] getPrimaryKeyFields() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(String[] fields, Object[] values) {
		if (data.length == rowsCount)
			growRecordsArray();
		for (int i=0; i<fields.length; i++) {
			data[rowsCount][nameToIndex.get(fields[i])] = values[i];
		}
		rowsCount++;
	}

	private void growRecordsArray() {
		int length = data.length * 2;
		Object newData[][] = new Object[length][fields.length];
		for (int i=0; i<rowsCount; i++) {
			for (int j=0; j<fields.length; j++) {
				newData[i][j] = data[i][j];
				data[i][j] = null;
			}
		}
		data = newData;
	}

	@Override
	public void update(String[] fields, Object[] values, RecordFilter filter) {
		if (rowsCount == 0)
			return;
		List<ObserverUpdate> ous = getObserversUpdate(fields);
		RecordImpl rec = new RecordImpl(nameToIndex);
		for (int i=0; i< rowsCount; i++) {
			rec.setValues(data[i]);
			if (filter.match(rec)) { // record will be updated
				for (ObserverUpdate ou : ous) { // save old values for observers
					ou.values = getFieldsValues(ou.fields, data[i]);
				}
				for (int j=0; j<fields.length; j++) { // update record
					data[i][nameToIndex.get(fields[j])] = values[j];
				}
				for (ObserverUpdate ou : ous) { // notify observers
					ou.observer.updated(ou.fields, ou.values, getFieldsValues(ou.fields, data[i]));
				}
			}
		}
	}

	/**
	 * Builds list of ObserverUpdate objects that will be notified during
	 * given fields update. 
	 * @param fieldsToUpdate
	 * @return
	 */
	private List<ObserverUpdate> getObserversUpdate(String[] fieldsToUpdate) {
		List<ObserverUpdate> result = new LinkedList<RelationalTableImpl.ObserverUpdate>();
		List<String> fieldsList = Arrays.asList(fieldsToUpdate);
		List<String> observedFields = new LinkedList<String>();
		for (FieldSetObserver observer : observers) {
			FieldInfo oFields[] = observer.getFields();
			for (int i=0; i<oFields.length; i++) {
				if (fieldsList.contains(oFields[i].getName())) {
					observedFields.add(oFields[i].getName());
				}
			}
			if (!observedFields.isEmpty()) {
				ObserverUpdate ou = new ObserverUpdate();
				ou.observer = observer;
				ou.fields = observedFields.toArray(new String[] {});
				ou.values = null;
				result.add(ou);
			}
		}
		return result;
	}

	@Override
	public void delete(RecordFilter filter) {
		RecordImpl record = new RecordImpl(nameToIndex);
		for (int i=0; i<rowsCount;) {
			record.setValues(data[i]);
			if (filter.match(record)) {
				for (FieldSetObserver observer : observers) {
					Object values[] = getFieldsValues(observer.getFields(), data[i]);
					observer.deleted(values);
				}
				for(int j=i; j<rowsCount-1; j++) {
					for (int k=0; k<fields.length; k++) {
						data[j][k] = data[j+1][k];
					}
				}
				rowsCount--;
				for (int j=0; j<fields.length; j++) {
					data[rowsCount][j] = null;
				}
			}
			else {
				i++;
			}
		}
	}

	@Override
	public void delete(String[] fields, Object[] values) {
		ChainedRecordFilter filter = new ChainedAndRecordFilter();
		for (int i=0; i<fields.length; i++) {
			filter.addFilter(new FieldEqFilter(fields[i], values[i]));
		}
		delete(filter);
	}

	@Override
	public RecordSet select(String[] fields, RecordFilter filter) {
		List<Object []> records = new LinkedList<Object[]>();
		RecordImpl rec = new RecordImpl(nameToIndex);
		for (int i=0; i<rowsCount; i++) {
			rec.setValues(data[i]);
			if (filter == null || filter.match(rec)) {
				records.add(getFieldsValues(fields, data[i]));
			}
		}
		FieldInfo resultFields[] = new FieldInfo[fields.length];
		for (int i=0; i<resultFields.length; i++) {
			resultFields[i] = new FieldInfo(this.fields[nameToIndex.get(fields[i])], i);
		}
		RecordSetImpl result = new RecordSetImpl(resultFields, records.toArray(new Object[][] {}));
		return result;
	}

	@Override
	public void addObserver(FieldSetObserver observer) {
		observers.add(observer);
	}

	@Override
	public void removeObserver(FieldSetObserver observer) {
		observers.remove(observer);
	}

	@Override
	public void setRelation(RelationalTable src, FieldInfo[] relative,
			FieldInfo[] primary) {
		FieldSetObserver observer = new TableRelationImpl(this, relative, src, primary);
		relations.add(observer);
	}

	protected Object[] getFieldsValues(FieldInfo fields[], Object row[]) {
		Object values[] = new Object[fields.length];
		for (int i=0; i<fields.length; i++) {
			values[i] = row[nameToIndex.get(fields[i].getName())];
		}
		return values;
	}

	protected Object[] getFieldsValues(String fields[], Object row[]) {
		Object values[] = new Object[fields.length];
		int index;
		for (int i=0; i<fields.length; i++) {
			index = nameToIndex.get(fields[i]);
			values[i] = row[index];
		}
		return values;
	}

}
