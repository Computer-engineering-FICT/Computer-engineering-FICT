package com.sulyma.lab111.labwork6.equipment;

import com.sulyma.lab111.labwork6.visitor.EquipmentVisitor;

/**
 * Video Card Equipment class.
 *
 * @author Aleksandr Sulyma
 */
public class VideoCardEquipment extends Equipment {
    /**
     * Constructor.
     */
    VideoCardEquipment(String name, int price, int power) {
        super(name, price, power);
    }

    @Override
    public void accept(EquipmentVisitor equipmentVisitor) {
        equipmentVisitor.visitVideoCard(this);
    }
}
