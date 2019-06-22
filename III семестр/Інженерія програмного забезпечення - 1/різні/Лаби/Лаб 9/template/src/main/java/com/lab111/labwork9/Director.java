package com.lab111.labwork9;
/**
 * director
 * @author Nightingale
 *
 */
public class Director {
	/**
	 * method realize create table
	 * @param builder
	 * @return
	 */
	public Elements[] MakeTable(Builder builder){
		builder.create();
		builder.setInfo();
		return builder.getTable();
	}
}