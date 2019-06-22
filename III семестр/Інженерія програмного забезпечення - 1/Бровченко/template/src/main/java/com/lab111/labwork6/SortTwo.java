package com.lab111.labwork6;

/**
 * Realise algorithm 2 using Strategy interface
 *
 * @author Anastasia Brovchenko
 */
public class SortTwo implements Strategy{

    @Override
    public void sort(Object[] mas) {
        System.out.println("Отсортировано вторым");
    }
}
