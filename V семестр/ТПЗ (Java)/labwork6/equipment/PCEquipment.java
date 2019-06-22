package com.sulyma.lab111.labwork6.equipment;

import com.sulyma.lab111.labwork6.visitor.EquipmentVisitor;

/**
 * PCEquipment, this class are realization all other classes and delegate other object.
 *
 * @author Aleksandr Sulyma.
 */
public class PCEquipment extends Equipment {
    Equipment[] equipments;

    /**
     * Constructor.
     */
    public PCEquipment(String name, int price, int power) {
        super(name, price, power);
        equipments = new Equipment[4];
        equipments[0] = new CPUEquipment("INTEL I7", 500, 1200);
        equipments[1] = new HDDEquipment("DigitalHDD", 250, 980);
        equipments[2] = new SoundCardEquipment("Dyn3D Sound", 100, 700);
        equipments[3] = new VideoCardEquipment("Nvidia GeForce", 280, 1000);
    }

    @Override
    public void accept(EquipmentVisitor equipmentVisitor) {
        for (int i = 0; i < equipments.length; i++) {
            equipments[i].accept(equipmentVisitor);
        }

        equipmentVisitor.visitPC(this);
    }

    @Override
    public String toString() {
        StringBuilder result = new StringBuilder();
        result.append(super.toString() + "\n");
        for (int i = 0; i < equipments.length; i++)
            result.append(equipments[i] + "\n");

        return result.toString();
    }
}
