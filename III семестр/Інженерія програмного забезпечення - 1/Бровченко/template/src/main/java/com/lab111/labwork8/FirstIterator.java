package com.lab111.labwork8;

/**
 * This is the first type of objects which we will create.
 * Realize Factory design pattern.
 * @author Anastasia Brovchenko
 */
public class FirstIterator implements MyIterator {
    @Override
    public void searchNextEllement() {
        System.out.println("First iterator search algorithm");
    }
}
