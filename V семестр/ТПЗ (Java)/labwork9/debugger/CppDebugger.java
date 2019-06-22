package com.sulyma.lab111.labwork9.debugger;

/**
 * The class that implements the interface overrides the method and has the method toString().
 *
 * @author Aleksandr Sulyma
 */
public class CppDebugger implements Debugger {
    /**
     * Override method.
     */
    public void debug() {
        System.out.println(this + ".debug()");
    }

    public String toString() {
        return "This is C++ Debugger";
    }
}
