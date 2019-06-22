package com.sulyma.lab111.labwork9.compiler;

/**
 * The class that implements the interface overrides the method and has the method toString().
 *
 * @author Aleksandr Sulyma
 */
public class CppCompiler implements Compiler {

    /**
     * Override method.
     */
    public void compile() {
        System.out.println(this + ".compile()");
    }

    public String toString() {
        return "This is C++ Compiler";
    }
}
