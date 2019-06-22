package com.sulyma.lab111.labwork6.equipment;

import com.sulyma.lab111.labwork6.visitor.EquipmentVisitor;

/**
 * Abstract Equipment class
 *
 * @author Aleksandr Sulyma
 */
public abstract class Equipment {
    /**
     * Name of model
     */
    private String name;

    /**
     * Price of model
     */
    private int price;

    /**
     * Power of model
     */
    private int power;

    Equipment(String name, int price, int power) {
        this.name = name;
        this.price = price;
        this.power = power;
    }

    /**
     * Call visitor for concrete type of equipmentSS
     *
     * @param equipmentVisitor
     */
    public abstract void accept(EquipmentVisitor equipmentVisitor);

    /**
     * Getters name.
     *
     * @return Name of object.
     */
    public String getName() {
        return name;
    }

    /**
     * Getter price.
     *
     * @return Price of object;
     */
    public int getPrice() {
        return price;
    }

    /**
     * Getter power.
     *
     * @return Power of object;
     */
    public int getPower() {
        return power;
    }

    @Override
    public String toString() {
        return String.format("%15s%6d%6d", name, price, power);
    }
}
