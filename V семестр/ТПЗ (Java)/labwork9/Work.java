package com.sulyma.lab111.labwork9;


import com.sulyma.lab111.labwork9.debugger.Debugger;
import com.sulyma.lab111.labwork9.compiler.Compiler;
import com.sulyma.lab111.labwork9.validator.Validator;

/**
 * An example of the validity of a validator, compiler, and debugger.
 *
 * @author Aleksandr Sulyma
 */
public class Work {

    public static void main(String[] args) {

        AbstractFactory factory = new JavaFactory();

        Validator validator = factory.createValidator();
        validator.validate();

        Compiler compiler = factory.createCompiler();
        compiler.compile();

        Debugger debugger = factory.createDebugger();
        debugger.debug();
    }
}
