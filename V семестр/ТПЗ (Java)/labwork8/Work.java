package com.sulyma.lab111.labwork8;

/**
 * A class that contains the entry point to the program.
 *
 * @author Aleksandr Sulyma
 */
public class Work {
    public static void main(String[] args) {
        RelationalTable firstRelationalTable = new RelationalTable();
        firstRelationalTable.executeQuery("select * from magazine");
        System.out.println("\n");

        RelationalTable secondRelationTable = new RelationalTable();
        secondRelationTable.executeQuery("insert into person('name') values ('Aleksandr')");

    }
}
