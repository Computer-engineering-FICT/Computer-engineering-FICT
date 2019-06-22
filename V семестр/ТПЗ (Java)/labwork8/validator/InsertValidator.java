package com.sulyma.lab111.labwork8.validator;


/**
 * Implementation of the interface and redefining the methods of verification for "insertion".
 *
 * @author Aleksandr Sulyma
 */
public class InsertValidator implements Validator {
    @Override
    public void validate(String query, String typeQuery) {
        System.out.println("Validate insert query: " + query);

        if (isCorrectSyntax(query)) {
            System.out.println(typeQuery + " query is done.");
        } else {
            System.out.println("Error! Incorrect data!");
        }
    }

    private boolean isCorrectSyntax(String query) {
        String array[] = query.split(" ");
        boolean firstOperator = false;
        boolean secondOperator = false;
        boolean thirdOperator = false;

        for (String s : array) {
            if (s.equalsIgnoreCase("insert"))
                firstOperator = true;
            else if (s.equalsIgnoreCase("into"))
                secondOperator = true;
            else if (s.equalsIgnoreCase("values"))
                thirdOperator = true;
        }
        return firstOperator & secondOperator & thirdOperator;
    }
}
