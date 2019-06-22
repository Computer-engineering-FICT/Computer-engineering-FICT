package com.lab111.labwork4;

/**
 * Interface for work with directories.
 * Includes methods "create", "rmdir".
 * @author Anastasia Brovchenko
 */
public interface MyDirectoryIf {

    /**
     * Создает папу по пути path.
     * @param path -путь создаваемой папки
     */
    public void create(String path);

    /**
     * Удаляет папку по пути path.
     * @param path - путь удаляемой папки
     */
    public void rmdir(String path);

}
