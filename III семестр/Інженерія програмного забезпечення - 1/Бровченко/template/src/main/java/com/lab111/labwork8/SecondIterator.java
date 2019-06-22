package com.lab111.labwork8;

/**
 * This is the second type of objects which we will create.
 * Realize Factory design pattern.
 * @author Anastasia Brovchenko
 */
public class SecondIterator implements MyIterator {
    @Override
    public void searchNextEllement() {
        System.out.println("Second iterator search algorithm");
    }
}
