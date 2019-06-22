package com.sulyma.lab111.labwork6.equipment;

import com.sulyma.lab111.labwork6.visitor.EquipmentVisitor;

/**
 * Sound Card Equipment class.
 *
 * @author Aleksandr Sulyma
 */
public class SoundCardEquipment extends Equipment {
    /**
     * Constructor.
     */
    SoundCardEquipment(String name, int price, int power) {
        super(name, price, power);
    }

    @Override
    public void accept(EquipmentVisitor equipmentVisitor) {
        equipmentVisitor.visitSoundCard(this);
    }
}
