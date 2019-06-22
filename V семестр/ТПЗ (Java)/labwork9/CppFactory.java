package com.sulyma.lab111.labwork9;

import com.sulyma.lab111.labwork9.compiler.CppCompiler;
import com.sulyma.lab111.labwork9.compiler.Compiler;
import com.sulyma.lab111.labwork9.debugger.CppDebugger;
import com.sulyma.lab111.labwork9.debugger.Debugger;
import com.sulyma.lab111.labwork9.validator.CppValidator;
import com.sulyma.lab111.labwork9.validator.Validator;

/**
 * Factory for Compiler, Debugger, Validator on the C++ language.
 *
 * @author Aleksandr Sulyma
 */
public class CppFactory extends AbstractFactory {

    /**
     * Creating C++ Compiler
     *
     * @return new CppCompiler
     */
    public Compiler createCompiler() {
        return new CppCompiler();
    }

    /**
     * Creating C++ Debugger
     *
     * @return new CppDebugger
     */
    public Debugger createDebugger() {
        return new CppDebugger();
    }

    /**
     * Creating C++ Validator
     *
     * @return new CppValidator
     */
    public Validator createValidator() {
        return new CppValidator();
    }
}
