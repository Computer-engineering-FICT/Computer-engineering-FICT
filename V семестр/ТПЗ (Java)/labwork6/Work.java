package com.sulyma.lab111.labwork6;

import com.sulyma.lab111.labwork6.equipment.PCEquipment;
import com.sulyma.lab111.labwork6.visitor.PowerEquipmentVisitor;
import com.sulyma.lab111.labwork6.visitor.PriceEquipmentVisitor;

/**
 * Example working. Variable - 8.
 *
 * @author Aleksandr Sulyma
 */
public class Work {
    public static void main(String[] args) {
        PCEquipment pc = new PCEquipment("ASUS", 5000, 2000);

        System.out.println(pc);
        PowerEquipmentVisitor power = new PowerEquipmentVisitor();
        PriceEquipmentVisitor price = new PriceEquipmentVisitor();

        pc.accept(power);
        pc.accept(price);

        System.out.println("Total power: " + power.getPower());
        System.out.println("Total price: " + price.getPrice());
    }
}
