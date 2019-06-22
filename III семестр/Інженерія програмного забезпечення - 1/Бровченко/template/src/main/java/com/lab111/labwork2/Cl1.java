package com.lab111.labwork2;
/**
 * Class which implements interface "If2", extends "Cl2", consist field of "If1" type and contain
 * methods "meth1()", "meth2()" and "meth3()"
 *
 * @author Anastasia Brovchenko
 *
 */
public class Cl1 extends Cl2 implements If1{
    /**
     * Field of "Cl1" type
     */
    If1 if1;
    If2 if2;
    public static void main(String[] args) {
// TODO Auto-generated method stub
    }

    /**
     * Method which print information about method in console
     */
    public void meth1(){
        System.out.println("Meth 1 is done!");
    }
    /**
     * Method which print information about method in console
     */
    public void meth2(){
        System.out.println("Meth 2 is done!");
    }
    /**
     * Method which print information about method in console
     */
    public void meth3(){
        System.out.println("Meth 3 is done!");
    }
}


