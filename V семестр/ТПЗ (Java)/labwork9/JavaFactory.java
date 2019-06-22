package com.sulyma.lab111.labwork9;


import com.sulyma.lab111.labwork9.compiler.JavaCompiler;
import com.sulyma.lab111.labwork9.compiler.Compiler;
import com.sulyma.lab111.labwork9.debugger.Debugger;
import com.sulyma.lab111.labwork9.debugger.JavaDebugger;
import com.sulyma.lab111.labwork9.validator.JavaValidator;
import com.sulyma.lab111.labwork9.validator.Validator;

/**
 * Factory for Compiler, Debugger, Validator on the Java language.
 *
 * @author Aleksandr Sulyma
 */
public class JavaFactory extends AbstractFactory {

    /**
     * Creating Java Compiler
     *
     * @return new JavaCompiler
     */
    public Compiler createCompiler() {
        return new JavaCompiler();
    }

    /**
     * Creating Java Debugger
     *
     * @return new JavaDebugger
     */
    public Debugger createDebugger() {
        return new JavaDebugger();
    }

    /**
     * Creating Java Validator
     *
     * @return new JavaValidator
     */
    public Validator createValidator() {
        return new JavaValidator();
    }
}
