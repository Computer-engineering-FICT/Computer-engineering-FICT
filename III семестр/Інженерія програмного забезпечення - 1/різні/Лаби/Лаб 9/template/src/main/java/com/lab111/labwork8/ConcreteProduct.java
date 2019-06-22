package com.lab111.labwork8;

import java.util.ArrayList;

/**
 * class for certain list
 * @author Nightingale
 *
 */
public class ConcreteProduct extends Product{
	protected int size;
/**
 * constructor	
 * @param k
 */
	public ConcreteProduct(ArrayList<Integer> k) {
		super(k);
		this.size=k.size();
	}
/**
 * method return size
 * @return
 */
	public int getSize(){
		return size;
	}
}