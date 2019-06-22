package com.lab111.labwork4;

/**
 * Interface for work with files.
 *Includes methods "open", "close", "delete".
 * @author Anastasia Brovchenko
 */
public interface MyFileIf {

    /**
     *  Открывает файл с расположением path. Если файла не сушествует - создает его, или же просто
     *  переписывает его и открывает.
     * @param path - расположение файла
     * @param createIfNotExist - существует ли файл
     */
    public void open(String path, boolean createIfNotExist);

    /**
     * Закрывает файл.
     */
    public void close();

    /**
     * Удаляет файл по пути path
     * @param path - путь удаляемого файла
     */
    public void delete(String path);


}
