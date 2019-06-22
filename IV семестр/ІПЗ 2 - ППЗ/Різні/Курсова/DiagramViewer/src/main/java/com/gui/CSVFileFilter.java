package com.gui;

import java.io.File;

import javax.swing.filechooser.FileFilter;

/**
 * Фільтер CSV файлів.
 *
 * @author Куцовол Віктор
 */
public class CSVFileFilter extends FileFilter {

    /**
     * Повертає значення true, якщо в якості параметра йому було передано CSV
     * файл.
     *
     * @param f
     *            файл
     * @return true, якщо в якості параметра йому було передано CSV файл
     */
    public final boolean accept(final File f) {
        if (f.getName().endsWith(".csv")) {
            return true;
        }
        if (f.isDirectory()) {
            return true;
        }
        return false;
    }

    /**
     * Повертає опис фільтра.
     *
     * @return рядок опису
     */
    public final String getDescription() {
        return "CSV Files";
    }

}
