package com.lab111.labwork5;

import com.lab111.labwork5.FieldInfo.FieldType;

/**
 * Main class. Nothing to say about it.
 * @author freil
 *
 */
public class Lab5 {

	private static final String PRIMARY_TABLE_FIELD_NAMES[] = { "id", "Name" };
	private static final FieldInfo PRIMARY_TABLE_FIELDS[] = {
		new FieldInfo("id", FieldType.TYPE_INTEGER),
		new FieldInfo("Name", FieldType.TYPE_STRING)
	};

	private static final String RELATED_TABLE_FIELD_NAMES[] = { "id", "primId", "RelatedName" };
	private static final FieldInfo RELATED_TABLE_FIELDS[] = {
		new FieldInfo("id", FieldType.TYPE_INTEGER),
		new FieldInfo("primId", FieldType.TYPE_INTEGER),
		new FieldInfo("RelatedName", FieldType.TYPE_STRING)
	};

	private static Object PRIMARY_TABLE_CONTENT[][] = {
		{ 1, "First" },
		{ 2, "Second" },
		{ 4, "Fourth" },
		{ 7, "Seventh" }
	};

	private static Object RELATED_TABLE_CONTENT[][] = {
		{ 1, 2, "R-One" },
		{ 2, 1, "R-Two" },
		{ 3, 4, "R-Three" },
		{ 4, 2, "R-Four" },
		{ 5, 4, "R-Five" }
	};

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		RelationalTable primary, related;
		primary = RelationalTableFactory.createRelationalTable(PRIMARY_TABLE_FIELDS);
		related = RelationalTableFactory.createRelationalTable(RELATED_TABLE_FIELDS);
		related.setRelation(primary, new FieldInfo[] { RELATED_TABLE_FIELDS[1] }, new FieldInfo[] { PRIMARY_TABLE_FIELDS[0] });
		// Fill primary table
		for (int i=0; i<PRIMARY_TABLE_CONTENT.length; i++) {
			primary.insert(PRIMARY_TABLE_FIELD_NAMES, PRIMARY_TABLE_CONTENT[i]);
		}
		// Fill related table
		for (int i=0; i<RELATED_TABLE_CONTENT.length; i++) {
			related.insert(RELATED_TABLE_FIELD_NAMES, RELATED_TABLE_CONTENT[i]);
		}
		// Print related table content
		RecordSet relatedData = related.select(RELATED_TABLE_FIELD_NAMES, null);
		System.out.println("Related table data:");
		printRecords(RELATED_TABLE_FIELD_NAMES, relatedData);
		// Do some updates to primary table. Updates should be propagated to related table
		primary.update(new String[] { "id" }, new Object[] { 3 }, new FieldEqFilter("id", 2));
		// secondary records with primId=2 should be updated
		relatedData = related.select(RELATED_TABLE_FIELD_NAMES, null);
		System.out.println("Related table data after primary table update:");
		printRecords(RELATED_TABLE_FIELD_NAMES, relatedData);
		relatedData.close();
		primary.delete(new FieldEqFilter("id", 4));
		relatedData = related.select(RELATED_TABLE_FIELD_NAMES, null);
		System.out.println("Related table data after row deletion in primary table:");
		printRecords(RELATED_TABLE_FIELD_NAMES, relatedData);
		relatedData.close();
	}

	private static void printRecords(String fields[], RecordSet recordSet) {
		for (int i=0; i<fields.length; i++) {
			if (i>0)
				System.out.print('\t');
			System.out.print(fields[i]);
		}
		System.out.println();
		while (recordSet.hasNext()) {
			Record rec = recordSet.next();
			Integer id = (Integer)rec.getFieldValue("id");
			Integer primId = (Integer)rec.getFieldValue("primId");
			String relatedName = (String)rec.getFieldValue("RelatedName");
			System.out.format("%d\t%d\t%s\n", id, primId, relatedName);
		}
		System.out.println();
	}
}
