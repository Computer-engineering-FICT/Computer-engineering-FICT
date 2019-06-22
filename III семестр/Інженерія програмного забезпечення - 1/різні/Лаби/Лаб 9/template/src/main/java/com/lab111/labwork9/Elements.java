package com.lab111.labwork9;
/**
 * class that realize structure of table
 * @author Nightingale
 * 
 */
public class Elements {
	private String info;
	private int number;
	/**
	 * constructor
	 */
	public Elements(){
		super();
	}
	/**
	 * constructor with fields
	 * @param newInfo
	 * @param newNumber
	 */
	public Elements(String newInfo, int newNumber){
		this();
		this.info=newInfo;
		this.number=newNumber;
	}
	/**
	 * method permit get field info
	 * @return
	 */
	public String getInfo(){
		return info;
	}
	/**
	 * method set field info
	 * @param newInfo
	 */
	public void setInfo(String newInfo){
		this.info=newInfo;
	}
	/**
	 * method permit get field number
	 * @return
	 */
	public Integer getNumber(){
		return number;
	}
	/**
	 * method set field number
	 * @return
	 */
	public void setNumber (int newNumber){
		this.number=newNumber;
	}
}