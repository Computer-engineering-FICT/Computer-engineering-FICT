package com.sulyma.lab111.labwork7;

/**
 * Example working. Variable - 0.
 *
 * @author Aleksandr Sulyma
 */
public class Work {
    public static void main(String[] args) {
        Redactor redactor = new Redactor();
        System.out.println("Before Update");
        System.out.println(redactor);

        redactor.updateColorShape(1, 1126);
        redactor.updateColorShape(2, 1308);
        redactor.updateColorShape(4, 1228);
        redactor.updateSizeShape(3, 526);
        redactor.updateSizeShape(0, 666);
        redactor.updateCoordinates(6);
        redactor.updateCoordinates(5);

        System.out.println("After update:");
        System.out.println(redactor);

        redactor.cancelChanges(0);
        redactor.cancelChanges(3);
        redactor.cancelChanges(6);

        System.out.println("After canceling changes at #1, #4, #7");
        System.out.println(redactor);
    }

}
