package com.lab111.labwork5;

/**
 * Table that supports relations with another tables.
 * Relation means cascading updates and deletes among the insertions checks.
 * @author freil
 *
 */
public interface RelationalTable extends Table, FieldSetObservable {

	/**
	 * Sets a relation between tables. Field set of primary table has an
	 * one-to-many relation to field set of secondary table
	 * @param src primary table
	 * @param relative field set of current (related) table
	 * @param primary field set of primary table
	 */
	public void setRelation(RelationalTable src, FieldInfo relative[], FieldInfo primary[]);

}
