package com.sulyma.lab111.labwork9;

import com.sulyma.lab111.labwork9.debugger.Debugger;
import com.sulyma.lab111.labwork9.validator.Validator;
import com.sulyma.lab111.labwork9.compiler.Compiler;

/**
 * Abstract factory for Compilers, Debuggers, Validators
 *
 * @author Aleksandr Sulyma
 */
public abstract class AbstractFactory {

    /**
     * Creating compiler
     *
     * @return new Compiler
     */
    public abstract Compiler createCompiler();

    /**
     * Creating  debugger
     *
     * @return new Debugger
     */
    public abstract Debugger createDebugger();

    /**
     * Creating validator
     *
     * @return new Validator
     */
    public abstract Validator createValidator();

}
