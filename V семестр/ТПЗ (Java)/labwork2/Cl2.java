package com.sulyma.lab111.labwork2;

/**
 * A class that implements the interface "If2" and overrides the method.
 *
 * @author Aleksandr Sulyma
 * @version 1.0
 * @see If2
 * @since 10-10-2017
 */
public class Cl2 extends Cl3 implements If2, If1 {
    /**
     * Override "meth2" that outputs the name of the class and method.
     */
    @Override
    public void meth2() {
        try {
            throw new Exception();
        } catch (Exception e) {
            System.out.println(e.getStackTrace()[0].getClassName() + "." + e.getStackTrace()[0].getMethodName() + "()");
        }
    }

    /**
     * Override "meth3" that outputs the name of the class and method.
     */
    @Override
    public void meth3() {
        try {
            throw new Exception();
        } catch (Exception e) {
            System.out.println(e.getStackTrace()[0].getClassName() + "." + e.getStackTrace()[0].getMethodName() + "()");
        }
    }
    /**
     * Example of object aggregation.
     */
    Cl3 cl3 = new Cl3();

    @Override
    public void meth1() {
        try {
            throw new Exception();
        } catch (Exception e) {
            System.out.println(e.getStackTrace()[0].getClassName() + "." + e.getStackTrace()[0].getMethodName() + "()");
        }
    }
}
