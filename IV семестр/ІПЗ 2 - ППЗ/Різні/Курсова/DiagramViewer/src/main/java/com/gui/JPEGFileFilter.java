package com.gui;

import java.io.File;

import javax.swing.filechooser.FileFilter;

/**
 * Фільтер JPEG файлів.
 *
 * @author Куцовол Віктор
 */
public class JPEGFileFilter extends FileFilter {

    /**
     * Повертає значення true, якщо в якості параметра йому було передано JPEG
     * файл.
     *
     * @param f
     *            файл
     * @return true, якщо в якості параметра йому було передано JPEG файл
     */
    public final boolean accept(final File f) {
        if (f.getName().endsWith(".jpg")) {
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
        return "JPEG Files";
    }

}
