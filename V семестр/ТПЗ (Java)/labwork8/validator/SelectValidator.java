package com.sulyma.lab111.labwork8.validator;

import com.sulyma.lab111.labwork8.RelationalTable;

/**
 * Implementation of the interface and redefining the methods of verification for "selection".
 *
 * @author Aleksandr Sulyma
 */
public class SelectValidator implements Validator {
    private RelationalTable relationalTable;

    public SelectValidator() {
        relationalTable = new RelationalTable();
    }

    @Override
    public void validate(String query, String typeQuery) {
        System.out.println("Validate select query: " + query);

        if (isCorrectTable(query) && isCorrectSyntax(query)) {
            System.out.println(typeQuery + " query is done.");
        } else {
            System.out.println("Error! Incorrect data!");
        }

    }

    private boolean isCorrectSyntax(String query) {
        String array[] = query.split(" ");

        for (String s : array) {
            if (s.equalsIgnoreCase("from"))
                return true;
        }
        return false;
    }

    private boolean isCorrectTable(String query) {
        String databaseName = relationalTable.getTableName();
        String array[] = query.split(" ");

        for (String s : array) {
            if (s.equalsIgnoreCase(databaseName))
                return true;
        }
        return false;
    }
}
