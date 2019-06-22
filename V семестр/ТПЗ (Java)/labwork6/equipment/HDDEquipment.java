package com.sulyma.lab111.labwork6.equipment;

import com.sulyma.lab111.labwork6.visitor.EquipmentVisitor;

/**
 * HDDEquipment, this class answer about Hard Disk Drive.
 *
 * @author Aleksandr Sulyma
 */
public class HDDEquipment extends Equipment {
    /**
     * Constructor.
     *
     * @param name  Name of object;
     * @param price Price of object;
     * @param power Power of object;
     */
    HDDEquipment(String name, int price, int power) {
        super(name, price, power);
    }

    /**
     * Override method, that visit this object;
     *
     * @param equipmentVisitor Visitor;
     */
    @Override
    public void accept(EquipmentVisitor equipmentVisitor) {
        equipmentVisitor.visitHDD(this);
    }
}
