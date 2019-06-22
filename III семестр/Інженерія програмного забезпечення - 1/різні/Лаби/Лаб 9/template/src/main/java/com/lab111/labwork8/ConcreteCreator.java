package com.lab111.labwork8;

import java.util.ArrayList;

/**
 * concrete creator realize iterator for concrete list
 * @author Nightingale
 *
 */
public class ConcreteCreator implements Creator{
	private static Product inst;
/**
 * method that create list
 */
	public Product CreateProduct() {
		if (inst==null){
			ArrayList<Integer> list=new ArrayList<Integer>();
			list.add(1);
			list.add(2);
			list.add(5);
			inst= new ConcreteProduct(list);
		}
		return inst;
	}
/**
 * method that realize iterator	
 */
	public void GetProduct(Product Product){
		ArrayList<Integer> list=new ArrayList<Integer>();
		Product j = CreateProduct();
		list = j.getList();
		for (int i=0; i<list.size(); i++){
			System.out.println(list.get(i));
		}
	}
}