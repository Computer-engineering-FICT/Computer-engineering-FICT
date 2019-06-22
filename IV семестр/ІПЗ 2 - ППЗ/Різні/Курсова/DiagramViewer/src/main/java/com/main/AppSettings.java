package com.main;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;

import javax.swing.JOptionPane;

/**
 * Класс настроек. Налаштування зберігаються у файлі "settings.txt".
 *
 * @author Куцовол Віктор
 */
public final class AppSettings {

    /**
     * Екземпляр класу AppSettings.
     */
    private static AppSettings instance = new AppSettings();

    /**
     * Екземпляр класу Properties.
     */
    private Properties properties;

    /**
     * Конструктор.
     */
    private AppSettings() {
        FileReader fr = null;
        properties = new Properties();
        try {
            fr = new FileReader("D:/KPI/EclDocs/DiagramViewer/settings.txt");
        } catch (FileNotFoundException e) {
            System.out.println("Відсутній файл налаштувань.");
            JOptionPane.showOptionDialog(null, Main.class.
                    getResource("settings.txt").getPath(),
                    "Помилка", JOptionPane.CLOSED_OPTION,
                    JOptionPane.ERROR_MESSAGE, null, null, null);
        }
        try {
            if (fr != null) {
                properties.load(fr);
                fr.close();
            }
        } catch (IOException e) {
            System.out.println("Помилка завантаження налаштувань.");
            JOptionPane.showOptionDialog(null,
                    "Помилка завантаження налаштувань", "Помилка",
                    JOptionPane.CLOSED_OPTION, JOptionPane.ERROR_MESSAGE, null,
                    null, null);
        }
    }

    /**
     * Повертає екземпляр AppSettings.
     *
     * @return екземпляр AppSettings
     */
    public static AppSettings getInstance() {
        return instance;
    }

    /**
     * Зберігає налаштування у файлі "settings.txt".
     *
     * @throws IOException
     *             виникає внаслідок помилки вводу/виводу
     */
    public void save() throws IOException {
        FileWriter fw = new FileWriter("D:/KPI/EclDocs/DiagramViewer/setting.txt");
        properties.store(fw, "Diagram viewer");
    }

    /**
     * Додає до хештейбла значення та зв'язує з його ключем.
     *
     * @param key
     *            ключ
     * @param value
     *            значення
     */
    public void put(final Object key, final Object value) {
        properties.put(key, value);
    }

    /**
     * Повертає значення за ключем.
     *
     * @param key
     *            ключ
     * @return значення за ключем
     */
    public Object get(final Object key) {
        return properties.get(key);
    }
}
