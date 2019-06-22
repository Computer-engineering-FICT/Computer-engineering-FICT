package com.lab111.labwork6;

/**
 *  Realise algorithm 1 using Strategy interface
 *
 * @author Anastasia Brovchenko
 */
public class SortOne implements Strategy {

    @Override
    public void sort(Object[] mas) {
        System.out.println("Отсортировано первым");
    }

}
