package com.lab111.labwork8;

/**
 * This is the first factory creator.
 * Realize Factory design pattern.
 * @author Anastasia Brovchenko
 */
public class FirstCreator implements MyCreator {
    @Override
    public MyIterator createIterator() {
        return new FirstIterator();
    }
}
