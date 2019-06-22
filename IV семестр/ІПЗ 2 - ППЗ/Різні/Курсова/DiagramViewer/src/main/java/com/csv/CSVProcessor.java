package com.csv;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.StringTokenizer;

/**
 * Оброблювач CSV файлів.
 *
 * @author Куцовол Віктор
 *
 */
public class CSVProcessor {

    /**
     * Агрегований об'єкт класу ArrayList, в якому знаходяться рядки CSV-файлу.
     *
     * @serial
     */
    private ArrayList<String> csvStrings = new ArrayList<String>();

    /**
     * Об'єкт відокремлювач.
     */
    private String delimiter;

    /**
     * Повертає відокремлювач.
     *
     * @return відокремлювач
     */
    public final String getDelimiter() {
        return delimiter;
    }

    /**
     * Встановлює відокремлювач.
     *
     * @param del
     *            новий відокремлювач
     */
    public final void setDelimiter(final String del) {
        delimiter = del;
    }

    /**
     * Конструктор.
     *
     * @param del
     *            відокремлювач
     */
    public CSVProcessor(final String del) {
        super();
        delimiter = del;
    }

    /**
     * Завантажує в файл рядки з агрегованого об'єкту.
     *
     * @param fileName
     *            ім'я файлу
     * @throws IOException
     *             виникає внаслідок помилки вводу/виводу
     */
    public final void save(final String fileName) throws IOException {
        BufferedWriter wf = new BufferedWriter(new FileWriter(fileName));
        Iterator<String> iterator = csvStrings.iterator();
        while (iterator.hasNext()) {
            wf.write(iterator.next());
            wf.newLine();
        }
        wf.close();
    }

    /**
     * Вивантажує з файлу рядки в агрегований об'єкт.
     *
     * @param fileName
     *            ім'я файлу
     * @throws IOException
     *             виникає внаслідок помилки вводу/виводу
     */
    public final void load(final String fileName) throws IOException {
        BufferedReader rf = new BufferedReader(new FileReader(fileName));
        csvStrings.clear();
        String line;
        while ((line = rf.readLine()) != null) {
            csvStrings.add(line);
        }
        rf.close();
    }

    /**
     * Серіалізує дані в файл.
     *
     * @throws Exception
     *             виникає внаслідок помилки серіалізації
     * @param fileName
     *            ім'я файлу для серіалізації
     */
    public final void serialize(final String fileName) throws Exception {
        FileOutputStream fos = new FileOutputStream(fileName);
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        oos.writeObject(csvStrings);
        oos.flush();
        oos.close();
    }

    /**
     * Серіалізує дані в файл "serialized.dat".
     *
     * @throws Exception
     *             виникає внаслідок помилки серіалізації
     */
    public final void serialize() throws Exception {
        serialize("serialized.dat");
    }

    /**
     * Десеріалізує дані з файлу.
     *
     * @throws Exception
     *             виникає внаслідок помилки десеріалізації
     * @param fileName
     *            ім'я файлу для десеріалізації
     */
    @SuppressWarnings("unchecked")
    public final void deserialize(final String fileName) throws Exception {
        FileInputStream fis = new FileInputStream(fileName);
        ObjectInputStream ois = new ObjectInputStream(fis);
        csvStrings = (ArrayList<String>) ois.readObject();
        ois.close();
    }

    /**
     * Десеріалізує дані з файлу "serialized.dat".
     *
     * @throws Exception
     *             виникає внаслідок помилки десеріалізації
     */
    public final void deserialize() throws Exception {
        deserialize("serialized.dat");
    }

    /**
     * Повертає агрегований об'єкт.
     *
     * @return агрегований об'єкт класу ArrayList
     */
    public final ArrayList<String> getCsvStrings() {
        return csvStrings;
    }

    /**
     * Виконує розбір даних агрегованого об'єкту.
     *
     * @return двовимірний масив
     */
    public final synchronized Object[][] parse() {
        if (csvStrings.size() != 0) {
            if (csvStrings.size() == 1) {
                throw new CSVParseException(
                        "Невірний формат даних. Відсутні значення.");
            }
            Object[][] table = new Object[2][];
            StringTokenizer t = new StringTokenizer(csvStrings.get(0),
                    delimiter);
            table[0] = new Object[t.countTokens()];
            for (int i = 0; i < table[0].length; i++) {
                table[0][i] = t.nextElement();
            }
            if (!csvStrings.get(1).contains(delimiter)
                    && table[0].length != 1) {
                throw new CSVParseException("Даний файл не є CSV.");
            }
            t = new StringTokenizer(csvStrings.get(1), delimiter);
            table[1] = new Object[t.countTokens()];
            if (table[1].length > table[0].length) {
                throw new CSVParseException(
                        "Невірний формат даних. Зайві значення.");
            }
            if (table[1].length < table[0].length) {
                throw new CSVParseException(
                        "Невірний формат даних. Не вистачає значень.");
            }
            for (int i = 0; i < table[1].length; i++) {
                table[1][i] = t.nextToken();
                try {
                    Double.valueOf((String) table[1][i]);
                } catch (NumberFormatException e) {
                    throw new CSVParseException(
                            "Невірний формат даних. Значення не є числа.");
                }
            }
            return table;
        } else {
            return new Object[2][0];
        }
    }

    /**
     * Зберігає в агрегований об'єкт двовимірний масив у форматі CSV, а потім
     * завантажує в файл рядки з цього об'єкту.
     *
     * @param fileName
     *            імя файлу
     * @param table
     *            двовимірний масив
     * @throws IOException
     *             виникає внаслідок помилки вводу/виводу
     */
    public final void save(final String fileName, final Object[][] table)
            throws IOException {
        csvStrings.clear();
        String str;
        for (int i = 0; i < table.length; i++) {
            str = "";
            for (int j = 0; j < table[i].length; j++) {
                if (((String) table[i][j]).length() != 0) {
                    str += (String) table[i][j];
                } else {
                    str += " ";
                }
                if (j != (table[i].length - 1)) {
                    str += delimiter;
                }
            }
            csvStrings.add(str);
        }
        save(fileName);
    }

}