package com.sulyma.lab111.labwork2;

/**
 * A class that implements the interface "If1" and overrides the method.
 *
 * @author Aleksandr Sulyma
 * @version 1.0
 * @see If1
 * @since 10-10-2017
 */
public class Cl1 implements If1 {
    /**
     * Example of object aggregation.
     */
    If1 if1;
    If2 if2;

    /**
     * Override "meth1" that outputs the name of the class and method.
     */
    @Override
    public void meth1() {
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

    public If1 getIf1() {
        return if1;
    }

    public void setIf1(If1 if1) {
        this.if1 = if1;
    }

    public If2 getIf2() {
        return if2;
    }

    public void setIf2(If2 if2) {
        this.if2 = if2;
    }
}
