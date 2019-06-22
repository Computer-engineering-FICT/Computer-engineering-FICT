package com.lab111.labwork5;

/**
 * Factory for relational tables.
 * @author freil
 *
 */
public class RelationalTableFactory {

	/**
	 * Creates a RelationalTable implementor's instanse and initializes it
	 * with given columns descriptors
	 * @param fields
	 * @return
	 */
	public static RelationalTable createRelationalTable(FieldInfo fields[]) {
		RelationalTable table = new RelationalTableImpl();
		table.setFields(fields);
		return table;
	}

}
