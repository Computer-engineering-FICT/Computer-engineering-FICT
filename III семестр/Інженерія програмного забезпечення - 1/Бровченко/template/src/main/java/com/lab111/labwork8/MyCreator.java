package com.lab111.labwork8;

/**
 * This is the interface for our factory.
 * Realize Factory design pattern.
 * @author Anastasia Brovchenko
 */
public interface MyCreator {
    /**
     * Create our new object.
     * @return object we must have.
     */
    MyIterator createIterator();
}
