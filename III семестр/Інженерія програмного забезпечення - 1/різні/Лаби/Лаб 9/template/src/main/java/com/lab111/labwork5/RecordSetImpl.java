package com.lab111.labwork5;

import java.util.HashMap;
import java.util.Map;

/**
 * Sample implementation of RecordSet that keeps returned records in an array.
 * @author freil
 *
 */
public class RecordSetImpl implements RecordSet {
	private FieldInfo fields[];
	private Object data[][];
	private int position;
	private Map<String, Integer> nameToIndex;

	public RecordSetImpl(FieldInfo fields[], Object data[][]) {
		this.fields = fields;
		this.data = data;
		position = 0;
		nameToIndex = new HashMap<String, Integer>();
		for (int i=0; i<fields.length; i++) {
			nameToIndex.put(fields[i].getName(), new Integer(i));
		}
	}

	@Override
	public FieldInfo[] getFields() {
		return fields;
	}

	@Override
	public boolean hasNext() {
		return position >=0 && position < data.length;
	}

	@Override
	public Record next() {
		if (position < 0 || position >= data.length)
			return null;
		RecordImpl rec = new RecordImpl(nameToIndex);
		rec.setValues(data[position]);
		position++;
		return rec;
	}

	@Override
	public boolean hasPrev() {
		return position > 0 && position <= data.length;
	}

	@Override
	public Record prev() {
		if (position <= 0 || position > data.length)
			return null;
		RecordImpl rec = new RecordImpl(nameToIndex);
		position--;
		rec.setValues(data[position]);
		return rec;
	}

	@Override
	public void first() {
		position = 0;
	}

	@Override
	public void last() {
		position = data.length;
	}

	@Override
	public int size() {
		return data.length;
	}

	@Override
	public void seek(int recNumber) throws IndexOutOfBoundsException {
		if (recNumber < 0 || recNumber > data.length)
			throw new IndexOutOfBoundsException();
		position = recNumber;
	}

	@Override
	public void close() {
		data = null;
		nameToIndex = null;
		fields = null;
	}

}
