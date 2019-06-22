package com.sulyma.lab111.labwork6.equipment;

import com.sulyma.lab111.labwork6.visitor.EquipmentVisitor;

/**
 * CPUEquipment, this class answer about Central Processor Unit.
 *
 * @author Aleksandr Sulyma
 */
public class CPUEquipment extends Equipment {
    /**
     * Constructor
     * @param name Name of CPU
     * @param price Price of CPU
     * @param power Power of CPU
     */
    CPUEquipment(String name, int price, int power) {
        super(name, price, power);
    }

    /**
     * Override method, that visit this object.
     * @param equipmentVisitor
     */
    @Override
    public void accept(EquipmentVisitor equipmentVisitor) {
        equipmentVisitor.visitCPU(this);
    }
}
