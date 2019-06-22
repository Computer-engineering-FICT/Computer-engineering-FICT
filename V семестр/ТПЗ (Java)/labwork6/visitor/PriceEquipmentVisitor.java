package com.sulyma.lab111.labwork6.visitor;

import com.sulyma.lab111.labwork6.equipment.*;

/**
 * Visitor to calculate total price of equipments.
 *
 * @author Aleksandr Sulyma
 */
public class PriceEquipmentVisitor extends EquipmentVisitor {
    /**
     * Total price of equipment
     */
    private int price;
    public PriceEquipmentVisitor() {
        price = 0;
    }

    /**
     * Get price of cpu
     * @param cpuEquipment
     */
    @Override
    public void visitCPU(CPUEquipment cpuEquipment) {
        price += cpuEquipment.getPrice();
    }

    /**
     * Get price of hdd
     * @param hddEquipment
     */
    @Override
    public void visitHDD(HDDEquipment hddEquipment) {
        price += hddEquipment.getPrice();
    }

    /**
     * Get price of video card
     * @param videoCardEquipment
     */
    @Override
    public void visitVideoCard(VideoCardEquipment videoCardEquipment) {
        price += videoCardEquipment.getPrice();
    }

    /**
     * Get price of sound card
     * @param soundCardEquipment
     */
    @Override
    public void visitSoundCard(SoundCardEquipment soundCardEquipment) {
        price += soundCardEquipment.getPrice();
    }

    /**
     * Get price of pc
     * @param pcEquipment
     */
    @Override
    public void visitPC(PCEquipment pcEquipment) {
        price += pcEquipment.getPrice();
    }

    /**
     * Return total price
     * @return
     */
    public int getPrice() {
        return price;
    }
}
