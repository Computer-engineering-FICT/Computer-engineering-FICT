package com.lab111.labwork6;

/**
 * Class that realise some strategy must extend this interface.
 *
 * @author Anastasia Brovchenko
 */
public interface Strategy {

    /**
     * Сотрирует массив по определенному алгоритму
     *
     * @param mas - сортируемый массив
     */
    public void sort(Object[] mas);

}
