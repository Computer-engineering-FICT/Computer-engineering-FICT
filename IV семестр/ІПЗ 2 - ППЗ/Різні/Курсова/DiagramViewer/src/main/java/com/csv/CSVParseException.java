package com.csv;

/**
 * Клас виключення розбору CSV файлів.
 *
 * @author Куцовол Віктор
 * */

public class CSVParseException extends IllegalArgumentException {

    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = 6177850649807286847L;

    /**
     * Конструктор, що створює виключення CSVParseException з порожнім
     * деталізуючим повідомленням.
     */
    public CSVParseException() {
        super();
    }

    /**
     * Конструктор, що створює виключення CSVParseException з власним
     * деталізуючим повідомленням.
     *
     * @param message
     *            деталізуюче повідомлення
     */
    public CSVParseException(final String message) {
        super(message);
    }
}
