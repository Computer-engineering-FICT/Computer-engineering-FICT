package com.sulyma.lab111.labwork8;

import com.sulyma.lab111.labwork8.validator.InsertValidator;
import com.sulyma.lab111.labwork8.validator.SelectValidator;
import com.sulyma.lab111.labwork8.validator.Validator;

import java.sql.SQLException;

/**
 * The class is responsible for creating a relational table. In itself contains instances of the validator classes and schema.
 *
 * @author Aleksandr Sulyma
 */
public class RelationalTable {
    private DatabaseScheme databaseScheme;
    private Validator validator;
    private String tableName = "magazine";

    /**
     * Constructor
     */
    public RelationalTable() {
    }

    /**
     * Fulfillment of our request. Create a validator, check for operability and output information.
     *
     * @param query query String.
     */
    public void executeQuery(String query) {
        createConnection();

        String[] tmpArray = query.split(" ");
        String typeQuery = tmpArray[0].toUpperCase();

        if (typeQuery.equals("SELECT"))
            validator = new SelectValidator();
        else if (typeQuery.equals("INSERT"))
            validator = new InsertValidator();
        else {
            System.out.println("Your query are not correct!");
            return;
        }

        validator.validate(query, typeQuery);
    }

    /**
     * Create databaseScheme object.
     */
    private void createConnection() {
        databaseScheme = DatabaseScheme.getInstance();
        System.out.println("Connect is created. HashCode scheme: " + databaseScheme.hashCode());
    }

    public String getTableName() {
        return tableName;
    }
}
