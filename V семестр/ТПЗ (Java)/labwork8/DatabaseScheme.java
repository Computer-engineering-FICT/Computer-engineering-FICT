package com.sulyma.lab111.labwork8;

/**
 * A singleton class. Provides a database schema in a single instance. Contains a private constructor and several methods.
 *
 * @author Aleksandr Sulyma
 */
public class DatabaseScheme {
    private final String username = "ROOT";
    private final String password = "ROOT";
    private static DatabaseScheme instance;
    private final String nameScheme = "business";

    /**
     * Constructor
     */
    private DatabaseScheme() {
    }

    /**
     * A method, that check instance this class and return object in single example.
     *
     * @return DatabaseScheme object.
     */
    public static DatabaseScheme getInstance() {
        if (instance == null)
            instance = new DatabaseScheme();

        return instance;
    }

    /**
     * Getter username.
     *
     * @return username String.
     */
    public String getUsername() {
        return username;
    }

    /**
     * Getter password.
     *
     * @return password String.
     */
    public String getPassword() {
        return password;
    }

    /**
     * Getter Scheme name.
     *
     * @return Scheme name String.
     */
    public String getNameScheme() {
        return nameScheme;
    }
}
