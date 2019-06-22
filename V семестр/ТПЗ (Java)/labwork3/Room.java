package com.sulyma.lab111.labwork3;


import java.util.ArrayList;
import java.util.List;

/**
 * A class that implements Area interface and describes pattern "Composite".
 * The Class allows add a component(new Area interface) and remove the component.
 *
 * @author Aleksandr Sulyma
 */
public class Room implements Area {
    private List<Area> components = new ArrayList<>();

    /**
     * A method that added new component in the list.
     *
     * @param area object to add.
     */
    void addComponents(Area area) {
        components.add(area);
    }

    /**
     * A method that removed select component in the list.
     *
     * @param area object to add.
     */
    void removeComponents(Area area) {
        components.remove(area);
    }

    /**
     * Override "getSize" which outputs a string.
     *
     * @return size.
     */
    @Override
    public int getSize() {
        int resultArea = 0;
        for (Area component : components) {
            resultArea += component.getSize();
        }
        return resultArea;
    }
}
