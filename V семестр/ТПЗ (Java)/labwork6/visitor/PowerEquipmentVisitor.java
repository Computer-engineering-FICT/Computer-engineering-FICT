package com.sulyma.lab111.labwork6.visitor;

import com.sulyma.lab111.labwork6.equipment.*;

/**
 * Visitor that count sum of equipments power.
 *
 * @author Aleksandr Sulyma
 */
public class PowerEquipmentVisitor extends EquipmentVisitor {
    /**
     * Total power
     */
    public int power;

    public PowerEquipmentVisitor() {
        power = 0;
    }

    /**
     * Get power of cpu
     * @param cpuEquipment
     */
    @Override
    public void visitCPU(CPUEquipment cpuEquipment) {
        power += cpuEquipment.getPower();
    }

    /**
     * Get power of hdd
     * @param hddEquipment
     */
    @Override
    public void visitHDD(HDDEquipment hddEquipment) {
        power += hddEquipment.getPower();
    }

    /**
     * Get power of Video Card
     * @param videoCardEquipment
     */
    @Override
    public void visitVideoCard(VideoCardEquipment videoCardEquipment) {
        power += videoCardEquipment.getPower();
    }

    /**
     * Get power of sound card
     * @param soundCardEquipment
     */
    @Override
    public void visitSoundCard(SoundCardEquipment soundCardEquipment) {
        power += soundCardEquipment.getPower();
    }

    /**
     * Get power of pc
     * @param pcEquipment
     */
    @Override
    public void visitPC(PCEquipment pcEquipment) {
        power += pcEquipment.getPower();
    }

    /**
     * Return total Power
     * @return
     */
    public int getPower() {
        return power;
    }
}
