package com.csv;

/**
 * Клас потоку розбору CSV файла.
 *
 * @author Куцовол Віктор
 */
public class CSVParseThread implements Runnable {

    /**
     * Об'єкт CSV процесора.
     */
    private CSVProcessor processor;

    /**
     * Об'єкт потоку.
     */
    private Thread t;

    /**
     * Обєкт результуючої таблиці.
     */
    private Object[][] table = new Object[2][0];

    /**
     * Повертає потік.
     *
     * @return потік
     */
    public final Thread getThread() {
        return t;
    }

    /**
     * Конструктор.
     *
     * @param pro
     *            CSV процесор
     */
    public CSVParseThread(final CSVProcessor pro) {
        processor = pro;
        t = new Thread(this);
        t.start();
    }

    /**
     * Виконується при запуску потоку.
     */
    public final void run() {
        try {
            table = processor.parse();
        } catch (CSVParseException e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * Повертає результуючу таблицю.
     *
     * @return результуючу таблицю
     */
    public final Object[][] getTable() {
        return table;
    }

}
