package lab111.labwork4;

/**
 * Интерфейс для работы с файлами. Содержит методы open, close, delete.
 *
 * @author Error_404
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
