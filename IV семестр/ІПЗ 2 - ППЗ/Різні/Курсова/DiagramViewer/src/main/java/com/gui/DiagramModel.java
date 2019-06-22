package com.gui;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Observable;

import javax.swing.JOptionPane;

import com.csv.CSVParseThread;
import com.csv.CSVProcessor;
import com.main.AppSettings;

/**
 * Клас моделі діаграми.
 *
 * @author Куцовол Віктор
 */
public class DiagramModel extends Observable {

    /**
     * Об'єкт CSV процесора.
     */
    private CSVProcessor processor;

    /**
     * Таблиця значень.
     */
    private Object[][] table;

    /**
     * Поле стратегії відображувача діаграм.
     */
    private DiagramDrawer diagramDrawer;

    /**
     * Повертає таблицю значень.
     *
     * @return таблицю знчень
     */
    public final Object[][] getTable() {
        return table;
    }

    /**
     * Файл.
     */
    private File file;

    /**
     * Повертає стратегію відображувача діаграм.
     *
     * @return стратегію відображувача діаграм
     */
    public final DiagramDrawer getDiagramDrawer() {
        return diagramDrawer;
    }

    /**
     * Встановлює стратегію відображувача діаграм.
     *
     * @param strategy
     *            стратегія відображувача діаграм
     */
    public final void setDiagramDrawer(final DiagramDrawer strategy) {
        diagramDrawer = strategy;
        strategy.setTable(table);
    }

    /**
     * Повертає файл.
     *
     * @return файл
     */
    public final File getFile() {
        return file;
    }

    /**
     * Встановлює файл.
     *
     * @param f
     *            файл
     */
    public final void setFile(final File f) {
        file = f;
    }

    /**
     * Конструктор.
     *
     * @param f
     *            CSV файл
     */
    public DiagramModel(final File f) {
        file = new File("");
        String del = (String) AppSettings.getInstance().get("delimiter");
        processor = new CSVProcessor(del);
        try {
            processor.load(f.getAbsolutePath());
            file = f;
        } catch (IOException ex) {
            System.out.println("Помилка завантаження файлу.");
            JOptionPane.showOptionDialog(null, "Помилка завантаження файлу",
                    "Помилка", JOptionPane.CLOSED_OPTION,
                    JOptionPane.ERROR_MESSAGE, null, null, null);
        }
        CSVParseThread pth = new CSVParseThread(processor);
        try {
            pth.getThread().join();
        } catch (InterruptedException e) {
            System.out.println("Переривання потоку.");
            JOptionPane.showOptionDialog(null, "Переривання потоку", "Помилка",
                    JOptionPane.CLOSED_OPTION, JOptionPane.ERROR_MESSAGE, null,
                    null, null);
        }
        table = pth.getTable();
        if (table[0].length == 0) {
            JOptionPane.showOptionDialog(null, "Помилковий формат файлу",
                    "Помилка", JOptionPane.CLOSED_OPTION,
                    JOptionPane.ERROR_MESSAGE, null, null, null);
        }
        diagramDrawer = new SectorDiagramDrawer(table);
    }

    /**
     * Конструктор.
     *
     * @param newFile
     *            ім'я нового файлу
     */
    public DiagramModel(final String newFile) {
        file = new File(newFile);
        String del = (String) AppSettings.getInstance().get("delimiter");
        processor = new CSVProcessor(del);
        table = new Object[2][1];
        table[0][0] = "";
        table[1][0] = "0";
        diagramDrawer = new SectorDiagramDrawer(table);
    }

    /**
     * Повідомляє про зміни.
     *
     * @param par
     *            характер змін
     */
    public final void doChange(final String par) {
        setChanged();
        notifyObservers(par);
    }

    /**
     * Додає новий рядок.
     *
     * @param index
     *            позиція рядка
     * @param after
     *            ознака додавання після позиції рядка
     */
    public final void addNewRow(final int index, final boolean after) {
        table[0] = Arrays.copyOf(table[0], table[0].length + 1);
        table[1] = Arrays.copyOf(table[1], table[1].length + 1);
        System.arraycopy(table[0], index, table[0], index + 1, table[0].length
                - index - 1);
        System.arraycopy(table[1], index, table[1], index + 1, table[1].length
                - index - 1);
        if (after) {
            table[0][index + 1] = "";
            table[1][index + 1] = "0";
            diagramDrawer.addColor(index + 1);
        } else {
            table[0][index] = "";
            table[1][index] = "0";
            diagramDrawer.addColor(index);
        }
    }

    /**
     * Видаляє рядок.
     *
     * @param index
     *            позиція рядка
     */
    public final void removeRow(final int index) {
        System.arraycopy(table[0], index + 1, table[0], index, table[0].length
                - index - 1);
        System.arraycopy(table[1], index + 1, table[1], index, table[1].length
                - index - 1);
        table[0] = Arrays.copyOf(table[0], table[0].length - 1);
        table[1] = Arrays.copyOf(table[1], table[1].length - 1);
        diagramDrawer.removeColor(index);
    }

    /**
     * Зберігає файл.
     *
     * @param f
     *            файл
     */
    public final void save(final File f) {
        file = f;
        try {
            processor.save(f.getAbsolutePath(), table);
        } catch (IOException e) {
            System.out.println("Помилка збереження");
            JOptionPane.showOptionDialog(null, "Помилка збереження", "Помилка",
                    JOptionPane.CLOSED_OPTION, JOptionPane.ERROR_MESSAGE, null,
                    null, null);
        }
    }
}
