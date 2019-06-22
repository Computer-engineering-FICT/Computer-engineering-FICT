package com.sulyma.lab111.labwork9.validator;

/**
 * The class that implements the interface overrides the method and has the method toString().
 *
 * @author Aleksandr Sulyma
 */
public class JavaValidator implements Validator {
    /**
     * Override method.
     */
    public void validate() {
        System.out.println(this + ".validate()");
    }

    public String toString() {
        return "This is Java Validator";
    }
}
