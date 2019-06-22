package com.lab111.labwork5;

/**
 * Chained filter with 'AND' type condition: returns true only if all filters
 * in the chain also returns true.
 * @author freil
 *
 */
public class ChainedAndRecordFilter extends ChainedRecordFilter {

	public ChainedAndRecordFilter() {
		super();
	}

	public ChainedAndRecordFilter(RecordFilter filters[]) {
		super(filters);
	}

	@Override
	public boolean match(Record record) {
		for (RecordFilter filter : filters) {
			if (!filter.match(record))
				return false;
		}
		return true;
	}

}
