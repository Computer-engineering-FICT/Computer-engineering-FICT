package com.lab111.labwork8;

/**
 * This is the first factory creator.
 * Realize Factory design pattern.
 * @author Anastasia Brovchenko
 */
public class SecondCreator implements MyCreator {
    @Override
    public MyIterator createIterator() {
        return new SecondIterator();
    }
}
