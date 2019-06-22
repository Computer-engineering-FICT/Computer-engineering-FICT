package com.lab111.labwork5;

import java.util.LinkedList;
import java.util.List;

/**
 * Abstract base class for chained filters.
 * @author freil
 *
 */
public abstract class ChainedRecordFilter implements RecordFilter {

	protected List<RecordFilter> filters;

	public ChainedRecordFilter() {
		filters = new LinkedList<RecordFilter>();
	}

	public ChainedRecordFilter(RecordFilter filters[]) {
		this();
		for (int i=0; i<filters.length; i++) {
			this.filters.add(filters[i]);
		}
	}

	public void addFilter(RecordFilter filter) {
		filters.add(filter);
	}

}
