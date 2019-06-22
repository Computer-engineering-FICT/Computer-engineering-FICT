package com.lab111.labwork4;

/**
 * Only workclass.
 * Realise pattern "Facade". Its a client part.
 *
 * @author Anastasia Brovchenko
 */
public class WorkClass {
    public static void main(String[] args) {

        //создали проводник
        MyExplorer explorer= new MyExplorer();
        //создали иерархию
        explorer.create();
        System.out.println();
        //удалили ее
        explorer.destroy();

    }
}
