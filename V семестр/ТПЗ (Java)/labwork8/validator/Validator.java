package com.sulyma.lab111.labwork8.validator;

/**
 * The interface that is responsible for checking input requests.
 *
 * @author Aleksandr Sulyma
 */
public interface Validator {
    /**
     * The method, that validating query.
     *
     * @param query input string.
     */
    void validate(String query, String typeQuery);
}
