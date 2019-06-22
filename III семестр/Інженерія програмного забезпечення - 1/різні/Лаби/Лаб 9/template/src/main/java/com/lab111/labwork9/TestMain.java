package com.lab111.labwork9;
/**
 * run class
 * @author Nightingale
 *
 */
public class TestMain {
	private static Director d;
	/**
	 * Invokes at application startup.
	 * create example of classes, perform their method
	 * @param Args parameters from command line
	 */
	public static void main (String args[]){
		Elements[] table;
		d=new Director();
		TableBuilder build = new TableBuilder();
		table = d.MakeTable(build);
		for (int i=0; i<table.length; i++){
			System.out.println("line"+i+" "+table[i].getInfo()+" "+table[i].getNumber());
		}
	}
}
