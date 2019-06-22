package com.lab111.labwork6;

/**
 * Only workclass.
 * Realise pattern "Strategy". Its a client part.
 *
 * @author Anastasia Brovchenko
 */
public class WorkClass {
    public static void main(String[] args) {
        Context context = new Context();

        context.setStrategy(new SortOne());
        context.sortByStrategy();

        context.setStrategy(new SortTwo());
        context.sortByStrategy();
    }
}
