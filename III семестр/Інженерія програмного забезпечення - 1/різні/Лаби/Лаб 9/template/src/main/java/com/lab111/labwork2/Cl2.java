package com.lab111.labwork2;

/**
 * Class which implements interface If2, consists of field of If2's type,
 * methods which allow to print information about class and method on console
 * 
 * @author Nightingale
 * 
 */
public class Cl2 implements If2 {
	/**
	 * Field of If3's type
	 */
	If3 if3;

	/**
	 * Method which prints information about class and method on console
	 */
	public void meth2() {
		System.out.println("Cl2 meth2");
	}

	@Override
	public void meth3() {
		System.out.println("Cl2 meth3\n"
			+ "Normally, you shouldn't get this message unless you eventually call this\n" 
			+ "...n' method wakening up a monster.");

	}

}

