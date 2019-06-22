package com.lab111.labwork8;

import java.util.ArrayList;

/**
 * interface for different structure as lists
 * @author Nightingale
 *
 */
public class Product {
	protected ArrayList<Integer> list=new ArrayList<Integer>();
/**
 * constructor	
 * @param k
 */
	public Product(ArrayList<Integer> k){
		super();
		this.list=k;
	}
/**
 * getters/setters
 * @return
 */
	public ArrayList<Integer> getList(){
		return list;
	}
	
	public void setList(ArrayList<Integer> k){
		this.list=k;
	}
}