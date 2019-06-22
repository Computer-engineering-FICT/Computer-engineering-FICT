package com.sulyma.lab111.labwork2;

/**
 * The second interface contains the "meth2" method.
 * This interface is inherited from the "If3" interface.
 *
 * @author Aleksandr Sulyma
 * @version 1.0
 * @since 10-10-2017
 */
public interface If2 extends If3 {
    /**
     * The method that prints the class name and the name of the method.
     */
    void meth2();

    /**
     * Example of object aggregation.
     */
    Cl1 cl1 = new Cl1();
}
