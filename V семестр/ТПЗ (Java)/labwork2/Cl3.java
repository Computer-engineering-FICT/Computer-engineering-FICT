package com.sulyma.lab111.labwork2;

/**
 * A class that implements the interface "If3" and overrides the method.
 *
 * @author Aleksandr Sulyma
 * @version 1.0
 * @see If3
 * @since 10-10-2017
 */
public class Cl3 implements If3 {
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
}
