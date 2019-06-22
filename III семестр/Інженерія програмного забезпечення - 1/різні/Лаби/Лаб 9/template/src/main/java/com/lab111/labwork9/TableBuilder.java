package com.lab111.labwork9;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
/**
 * current builder for building table
 * @author Nightingale
 *
 */
public class TableBuilder extends Builder{
	private Elements[] set;
	/**
	 * method create void table
	 */
	public void create(){
		int size=5;
		set=new Elements[size];
	}
	/**
	 * method set information in table
	 */
	public void setInfo(){
		for (int i=0; i<set.length; i++){
			BufferedReader k = new BufferedReader (new InputStreamReader (System.in));
			try {
				System.out.println("input line "+(i+1));
				Elements s = new Elements();
				s.setInfo(k.readLine());
				s.setNumber(i+1);
				set[i]=s;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * method return table
	 */
	public Elements[] getTable(){
		return set;
	}
}