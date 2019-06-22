package com.lab111.labwork2;

/**
 * Class which implements interface If1, consists of field of Cl3's type,
 * methods which allow to print information about class and method on console
 * 
 * @author Nightingale
 * 
 */
public class Cl1 extends Cl2 implements If1 {
	/**
	 * Field of Cl3's type
	 */
	Cl3 cl3;

	/**
	 * Method which prints information about class and method on console
	 */
	public void meth1() {
		System.out.println("Cl1 meth1. Nothing at all.");
	}

	/**
	 * Method which extended from interface If2 by interface If1 It prints
	 * information about class and method on console
	 */
	public void meth2() {
		System.out
				.println("Cl1 meth2\nLet's f...n' roll, rubber d..k was found");
	}

	/**
	 * Method which extended from interface If3 by interface If1 It prints
	 * information about class and method on console
	 */
	public void meth3() {
		System.out.println("Cl1 meth3\nSplean on you.");
	}

}

